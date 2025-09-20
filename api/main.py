from flask import Flask, jsonify, request
import numpy as np

app = Flask(__name__)

def monte_carlo_simulation(S0, K, T, r, sigma, simulations=1000, steps=100):
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
    try:
        data = request.json
        S0 = data['S0']
        K = data['K']
        T = data['T']
        r = data['r']
        sigma = data.get('sigma', 0.2)
        simulations = data.get('simulations', 1000)
        steps = data.get('steps', 100)
        
        price = monte_carlo_simulation(S0, K, T, r, sigma, simulations, steps)
        return jsonify({'option_price': price})
    except Exception as e:
        return jsonify({'error': str(e)}), 400

if __name__ == '__main__':
    app.run(debug=True)
