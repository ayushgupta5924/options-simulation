from flask import Flask, request, jsonify
import numpy as np
import pandas as pd

app = Flask(__name__)

def project_future_prices(today_price, drift, standard_deviation, days):
    """
    Project the future prices of an asset over a specified number of days.
    
    Parameters:
    - today_price: The current price of the asset.
    - drift: Calculated drift from the historical data.
    - standard_deviation: Standard deviation of the periodic daily returns.
    - days: Number of days to project into the future.
    
    Returns:
    - A list of projected prices, one for each day.
    """
    future_prices = [today_price]
    for _ in range(days):
        random_value = np.random.normal(0, standard_deviation)
        next_price = future_prices[-1] * np.exp(drift + random_value)
        future_prices.append(next_price)
    return future_prices[1:]  # Exclude today's price to only return future projections

@app.route('/api/project_prices', methods=['POST'])
def project_prices():
    data = request.get_json()
    
    if not data or 'prices' not in data or 'days' not in data:
        return jsonify({'error': 'Missing data'}), 400
    
    today_price = data['prices'][-1]  # Assuming the last price is today's price
    days = data['days']
    
    # Calculate periodic daily returns from historical prices
    stock_prices = pd.Series(data['prices'])
    periodic_daily_returns = np.log(stock_prices / stock_prices.shift(1))[1:]
    
    # Calculate statistics
    stats = calculate_statistics(periodic_daily_returns)
    drift = stats['drift']
    standard_deviation = stats['standard_deviation']
    
    # Project future prices
    future_prices = project_future_prices(today_price, drift, standard_deviation, days)
    
    return jsonify({'future_prices': future_prices})

def calculate_statistics(periodic_daily_returns):
    average_daily_return = np.mean(periodic_daily_returns)
    standard_deviation = np.std(periodic_daily_returns, ddof=0)  # Population standard deviation
    variance = np.var(periodic_daily_returns, ddof=0)  # Population variance
    drift = average_daily_return - (variance / 2)
    
    return {
        'average_daily_return': average_daily_return,
        'standard_deviation': standard_deviation,
        'variance': variance,
        'drift': drift
    }

if __name__ == '_main_':
    app.run(debug=True)