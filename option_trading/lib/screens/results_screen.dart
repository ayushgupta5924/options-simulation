// import 'dart:math';
// import 'package:flutter/material.dart';
// import 'package:option_trading/models/option_pricing_result.dart';
// import 'package:option_trading/utils/monte_carlo_simulation.dart';

// class ResultsScreen extends StatefulWidget {
//   final double currentStockPrice;
//   final double strikePrice;
//   final double timeToExpiration;
//   final double riskFreeRate;
//   final double volatility;

//   const ResultsScreen({
//     required this.currentStockPrice,
//     required this.strikePrice,
//     required this.timeToExpiration,
//     required this.riskFreeRate,
//     required this.volatility,
//   });

//   @override
//   _ResultsScreenState createState() => _ResultsScreenState();
// }

// class _ResultsScreenState extends State<ResultsScreen> {
//   OptionPricingResult? result; // Make it nullable

//   @override
//   void initState() {
//     super.initState();
//     calculateOptionPrices();
//   }

//   void calculateOptionPrices() {
//     // Run the Monte Carlo simulation and calculate option prices
//     result = runMonteCarloSimulation(
//       widget.currentStockPrice,
//       widget.strikePrice,
//       widget.timeToExpiration,
//       widget.riskFreeRate,
//       widget.volatility,
//       numberOfSimulations: 10000,
//       numberOfSteps: 100,
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Option Pricing Simulation Results'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             if (result != null) // Check for null before accessing properties
//               Text('Mean Option Price: ${result!.mean.toStringAsFixed(2)}'),
//             if (result != null)
//               Text('Standard Deviation: ${result!.standardDeviation.toStringAsFixed(2)}'),
//             // Display other statistical measures
//             // Implement visualization of option prices
//             // Add buttons for additional actions
//           ],
//         ),
//       ),
//     );
//   }
// }

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
        title: const Text('Option Pricing Simulation Results'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            const SizedBox(height: 10),
            Text('Mean Option Price: ${result.mean.toStringAsFixed(2)}'),
            const SizedBox(height: 10),
            Text('Standard Deviation: ${result.standardDeviation.toStringAsFixed(2)}'),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
