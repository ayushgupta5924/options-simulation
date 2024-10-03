from flask import Flask, request, jsonify
import numpy as np
import pandas as pd

app = Flask(__name__)

def calculate_statistics(periodic_daily_returns):
    """
    Calculate average daily return, standard deviation, variance, and drift from periodic daily returns.
    """
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

def get_random_input(standard_deviation):
    """
    Obtain a random value from a normal distribution with a mean of 0 and the given standard deviation.
    """
    random_value = np.random.normal(0, standard_deviation)
    return random_value

@app.route('/api/simulate_random_input', methods=['POST'])
def simulate_random_input():
    """
    Endpoint to simulate a random input based on the standard deviation of periodic daily returns.
    """
    data = request.get_json()
    
    if not data or 'prices' not in data:
        return jsonify({'error': 'Missing data'}), 400
    
    stock_prices = pd.Series(data['prices'])
    periodic_daily_returns = np.log(stock_prices / stock_prices.shift(1))[1:]  # Exclude the first NaN value
    
    stats = calculate_statistics(periodic_daily_returns)
    standard_deviation = stats['standard_deviation']
    
    # Generate a random input based on the standard deviation
    random_input = get_random_input(standard_deviation)
    
    return jsonify({'random_input': random_input})

if __name__ == '_main_':
    app.run(debug=True)