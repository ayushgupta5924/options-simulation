import json
import numpy as np
import yfinance as yf
import pandas as pd
from datetime import datetime

def fetch_stock_data(ticker_symbol, start_date, end_date):


    ticker_symbol = input("Enter the symbol")

    stock_data = yf.download(ticker_symbol, start=input("Enter start date"), end = input("Enter end date"))

    stock_data.reset_index(inplace=True)

    json_data = stock_data.to_json(orient='records')

    return json_data

def calculate_statistics(json_data):
    """
    Calculate average periodic daily returns, average standard deviation, and average variance
    from the provided JSON data.
    
    Parameters:
    json_data (str): JSON-formatted string containing stock data.
    
    Returns:
    dict: A dictionary containing the calculated statistics.
    """
    # Parse the JSON data
    data = json.loads(json_data)

    # Convert JSON data to DataFrame
    df = pd.DataFrame(data)

    # Convert the 'Date' column to datetime
    df['Date'] = pd.to_datetime(df['Date'], unit='ms')

    # Set 'Date' column as index
    df.set_index('Date', inplace=True)

    # Calculate the periodic daily returns
    periodic_daily_returns = np.log(df['Close'] / df['Close'].shift(1))

    # Calculate the average returns
    average_return = periodic_daily_returns.mean()

    # Calculate the average standard deviation
    average_std_dev = periodic_daily_returns.std()

    # Calculate the average variance
    average_variance = periodic_daily_returns.var()

    drift = average_return - (average_variance)/2

    random_value = np.random.normal(loc=0, scale=1)

    random_value_scaled = average_std_dev * random_value


    # Create a dictionary to store the results
    results = {
        "average_periodic_daily_returns": average_return,
        "average_standard_deviation": average_std_dev,
        "average_variance": average_variance,
        "drift": drift,
        "random_value_scaled": random_value_scaled
    }

    return results


# Example parameters
today_price = 100  # Example value for today's price
drift = 0.05  # Example value for drift
random_value = 0.1  # Example value for random value

# Calculate next day's price
next_day_price = today_price * np.exp(drift + random_value)

print("Next Day's Price:", next_day_price)





def main():
    # Input from user
    ticker_symbol = input("Enter the symbol: ")
    start_date = input("Enter start date (YYYY-MM-DD): ")
    end_date = input("Enter end date (YYYY-MM-DD): ")

    json_data = fetch_stock_data(ticker_symbol, start_date, end_date)

    # next_day_price = statistics["next_day_price"]

# Calculate statistics
    statistics = calculate_statistics(json_data)

# Print the results
    print("Average periodic daily returns:", statistics["average_periodic_daily_returns"])
    print("Average standard deviation:", statistics["average_standard_deviation"])
    print("Average variance:", statistics["average_variance"])
    print("Drift: ",statistics["drift"])
    print("Random Value:", statistics["random_value_scaled"])
    print("Next Day's Price", next_day_price)

    today_price = json.loads(json_data)[-1]['Close']


if __name__ == "__main__":
    main()

print("DONE")
