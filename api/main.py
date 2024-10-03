from flask import Flask, jsonify, request
import numpy as np
import pandas as pd
import math
import datetime
import http.client
import json
import yfinance
from urllib.request import urlopen
from typing import List

app = Flask(__name__)

def estimate_parameters_from_historical_data(stock_data):
    # Placeholder function to estimate parameters such as volatility (sigma)
    # Implement your logic to estimate parameters from historical stock data
    pass

historical_stock_data = [10, 12, 14, 15, 18, 17, 16, 15, 14, 13]
estimated_parameters = estimate_parameters_from_historical_data(historical_stock_data)

print("Estimated Volatility:", estimated_parameters['volatility'])
print("Estimated Mean Return:", estimated_parameters['mean_return'])

def fetch_data(symbol, interval, range):
    url = f"https://query1.finance.yahoo.com/v8/finance/chart/SBIN.NS?region=US&lang=en-US&includePrePost=false&interval={interval}&useYfid=true&range={range}&corsDomain=finance.yahoo.com&.tsrc=finance"
    conn = http.client.HTTPSConnection("query1.finance.yahoo.com")
    payload = ''
    headers = {
    'authority': 'query1.finance.yahoo.com',
    'accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,/;q=0.8,application/signed-exchange;v=b3;q=0.7',
    'accept-language': 'en-GB,en-US;q=0.9,en;q=0.8',
    'cache-control': 'max-age=0',
    "sec-ch-ua-platform": "\"Windows\"",
    'sec-fetch-dest': 'document',
    'sec-fetch-mode': 'navigate',
    'sec-fetch-site': 'none',
    'sec-fetch-user': '?1',
    'upgrade-insecure-requests': '1',
    'user-agent': 'Mozilla/5.0 (X11; Linux x86_64; rv:109.0) Gecko/20100101 Firefox/115.0',
    'Cookie': 'A1=d=AQABBLSZ0GUCEBX3E25c2ZXIOPCSz5NqavAFEgEBAQHr0WXaZdxV0iMA_eMAAA&S=AQAAAuDodOcA49RavFdRLuotNPY; A1S=d=AQABBLSZ0GUCEBX3E25c2ZXIOPCSz5NqavAFEgEBAQHr0WXaZdxV0iMA_eMAAA&S=AQAAAuDodOcA49RavFdRLuotNPY; A3=d=AQABBLSZ0GUCEBX3E25c2ZXIOPCSz5NqavAFEgEBAQHr0WXaZdxV0iMA_eMAAA&S=AQAAAuDodOcA49RavFdRLuotNPY'
    }
    conn.request("GET", "/v8/finance/chart/MPHASIS.NS?region=US&lang=en-US&includePrePost=false&interval=1h&useYfid=true&range=2d&corsDomain=finance.yahoo.com&.tsrc=finance", payload, headers)
    res = conn.getresponse()

    print(res)
    raw_data = res
    print(raw_data)
    x=urlopen(url)
    raw_data = x.read()
    encoding = x.info().get_content_charset('utf8')  # JSON default
    data = json.loads(raw_data.decode(encoding))
    print(data)
    len_data = len(data['chart']['result']['timestamp'])
    print("HIIIII")
    # for i in range(len_data):
    #      timestamp = datetime.utcfromtimestamp(raw_data['chart']['timestamp']['result'][0][i])
    #      if timestamp.strftime('%I:%M:%S %p') == '03:30:00 PM':
    #         continue
    #      data.append({
    #         'timestamp': timestamp.strftime('%Y-%m-%d %H:%M:%S'),
    #         'high': raw_data['chart']['result'][0]['indicators']['quote']['high'][i],
    #         'low': raw_data['chart']['result'][0]['indicators']['quote']['low'][i],
    #         'open': raw_data['chart']['result'][0]['indicators']['quote']['open'][i],
    #         'close': raw_data['chart']['result'][0]['indicators']['quote']['close'][i]
    #      })

    # market_price = raw_data['chart']['result'][0]['indicators']['quote'][0]['close'][-1]
    # return json.dumps({'market_price': market_price, 'raw_data': data})
    return json.dumps(data)

def monte_carlo_simulation(S0, K, T, r, sigma, simulations, steps):
    dt = T / steps
    total_payoff = 0

    for i in range(simulations):
        S = S0
        for j in range(steps):
            e = np.random.normal(0, 1)
            S *= np.exp((r - 0.5 * sigma**2) * dt + sigma * np.sqrt(dt) * e)
        payoff = np.maximum(S - K, 0)
        total_payoff += payoff
    option_price = np.exp(-r * T) * (total_payoff / simulations)
    return option_price



@app.route('/api/option_pricing', methods=['POST'])
def option_pricing():
    data = request.json
    symbol = data['symbol']
    print(symbol)
    interval = data['interval']
    print(interval)
    range = data['range']
    print(range)
    stock_data = fetch_data(symbol, interval, range)
    print(stock_data)

    if stock_data is None:
        return jsonify({'error': 'Failed to fetch historical stock data'})

    S0 = data['S0']
    print(S0)
    K = data['K']
    print(K)
    T=data['T']
    print(T)
    r = data['r']
    print(r)
    sigma = estimate_parameters_from_historical_data(stock_data)
    simulations = data.get('simulations', 1000)
    steps = data.get('steps', 100)

    price = monte_carlo_simulation(S0, K, T, r, sigma, simulations, steps)
    return jsonify({'option_price': price})

if __name__ == '__main__':
    app.run(debug=True)
