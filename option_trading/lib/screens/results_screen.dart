import 'package:flutter/material.dart';
import 'package:option_trading/utils/monte_carlo_simulation.dart';

class ResultsScreen extends StatelessWidget {
  final double stockPrice;
  final double strikePrice;
  final double timeToExpiration;
  final double riskFreeRate;
  final double volatility;

  const ResultsScreen({super.key,
    required this.stockPrice,
    required this.strikePrice,
    required this.timeToExpiration,
    required this.riskFreeRate,
    required this.volatility,
  });

  @override
  Widget build(BuildContext context) {
    OptionPricingResult result = runMonteCarloSimulation(
      stockPrice,
      strikePrice,
      timeToExpiration,
      riskFreeRate,
      volatility,
      numberOfSimulations: 1000,
      numberOfSteps: 500,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Option Pricing Results'),
        backgroundColor: Colors.blue[700],
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children:[
            SizedBox(height: 20),
            Text('Input Parameters:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text('Stock Price: ₹${stockPrice.toStringAsFixed(2)}'),
            Text('Strike Price: ₹${strikePrice.toStringAsFixed(2)}'),
            Text('Time to Expiration: ${timeToExpiration.toStringAsFixed(2)} years'),
            Text('Risk-free Rate: ${(riskFreeRate * 100).toStringAsFixed(2)}%'),
            Text('Volatility: ${(volatility * 100).toStringAsFixed(2)}%'),
            const SizedBox(height: 20),
            Card(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text('Call Option Price: ₹${result.mean.toStringAsFixed(2)}', 
                         style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                    SizedBox(height: 10),
                    Text('Standard Deviation: ₹${result.standardDeviation.toStringAsFixed(2)}',
                         style: TextStyle(fontSize: 16)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Card(
              color: Colors.blue[50],
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Monte Carlo Simulation Explanation:', 
                         style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    SizedBox(height: 10),
                    Text('• Simulated 1,000 possible stock price paths over ${timeToExpiration.toStringAsFixed(2)} years'),
                    Text('• Each path uses random price movements based on volatility of ${(volatility * 100).toStringAsFixed(1)}%'),
                    Text('• Calculated payoff for each path: max(Final Price - Strike Price, 0)'),
                    Text('• Discounted all payoffs back to present value using ${(riskFreeRate * 100).toStringAsFixed(1)}% risk-free rate'),
                    Text('• The option price is the average of all discounted payoffs'),
                    SizedBox(height: 8),
                    Text('Result: This call option gives you the right to buy the stock at ₹${strikePrice.toStringAsFixed(2)} and is worth ₹${result.mean.toStringAsFixed(2)} today.',
                         style: TextStyle(fontWeight: FontWeight.w500, color: Colors.blue[800])),
                  ],
                ),
              ),
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Back to Input'),
            ),
          ],
        ),
      ),
    );
  }
}
