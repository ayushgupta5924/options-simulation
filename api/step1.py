from flask import Flask, request, jsonify
import numpy as np
import pandas as pd

app = Flask(__name__)

def calculate_periodic_daily_returns(stock_prices):
    """
    Calculate the periodic daily returns using the natural logarithm.
    
    Parameters:
    - stock_prices: A pandas Series or a list of stock prices.
    
    Returns:
    - A list of periodic daily returns.
    """
    # Convert the list to a pandas Series if necessary
    if not isinstance(stock_prices, pd.Series):
        stock_prices = pd.Series(stock_prices)
    
    # Calculate the periodic daily returns
    periodic_daily_returns = np.log(stock_prices / stock_prices.shift(1))
    
    return periodic_daily_returns[1:]  # Exclude the first NaN value

@app.route('/api/project_trajectory', methods=['POST'])
def project_trajectory():
    # Assuming the request JSON body is a list of historical prices
    data = request.get_json()
    
    # Validate the input data
    if not data or 'prices' not in data:
        return jsonify({'error': 'Missing data'}), 400
    
    stock_prices = data['prices']
    
    # Calculate periodic daily returns
    periodic_daily_returns = calculate_periodic_daily_returns(stock_prices)
    
    # For demonstration, return the calculated periodic daily returns
    # In a real scenario, you might use these returns to project future price trajectories
    return jsonify({'periodic_daily_returns': periodic_daily_returns.tolist()})

if __name__ == '_main_':
    app.run(debug=True)