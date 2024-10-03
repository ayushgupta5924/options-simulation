from flask import Flask, request, jsonify
import numpy as np
import pandas as pd

app = Flask(__name__)

def calculate_statistics(periodic_daily_returns):
    """
    Calculate average daily return, standard deviation, variance, and drift from periodic daily returns.
    
    Parameters:
    - periodic_daily_returns: A pandas Series of periodic daily returns.
    
    Returns:
    - A dictionary containing the average daily return, standard deviation, variance, and drift.
    """
    average_daily_return = np.mean(periodic_daily_returns)
    standard_deviation = np.std(periodic_daily_returns, ddof=0)  # Population standard deviation (STDEV.P)
    variance = np.var(periodic_daily_returns, ddof=0)  # Population variance (VAR.P)
    drift = average_daily_return - (variance / 2)
    
    return {
        'average_daily_return': average_daily_return,
        'standard_deviation': standard_deviation,
        'variance': variance,
        'drift': drift
    }

@app.route('/api/project_trajectory', methods=['POST'])
def project_trajectory():
    data = request.get_json()
    
    if not data or 'prices' not in data:
        return jsonify({'error': 'Missing data'}), 400
    
    stock_prices = data['prices']
    
    # Calculate periodic daily returns
    if not isinstance(stock_prices, pd.Series):
        stock_prices = pd.Series(stock_prices)
    periodic_daily_returns = np.log(stock_prices / stock_prices.shift(1))[1:]  # Exclude the first NaN value
    
    # Calculate statistics
    stats = calculate_statistics(periodic_daily_returns)
    
    return jsonify(stats)

if __name__ == '_main_':
    app.run(debug=True)