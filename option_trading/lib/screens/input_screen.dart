import 'package:flutter/material.dart';
import 'package:option_trading/screens/results_screen.dart';

class InputScreen extends StatefulWidget {
  @override
  _InputScreenState createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  final TextEditingController _stockPriceController = TextEditingController();
  final TextEditingController _strikePriceController = TextEditingController();
  final TextEditingController _timeToExpirationController = TextEditingController();
  final TextEditingController _riskFreeRateController = TextEditingController();
  final TextEditingController _volatilityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Options Pricing Simulator'),
        backgroundColor: Colors.blue[700],
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextFormField(
              controller: _stockPriceController,
              decoration: InputDecoration(labelText: 'Current Stock Price (₹)'),
              keyboardType: TextInputType.number,
            ),
            TextFormField(
              controller: _strikePriceController,
              decoration: InputDecoration(labelText: 'Strike Price (₹)'),
              keyboardType: TextInputType.number,
            ),
            TextFormField(
              controller: _timeToExpirationController,
              decoration: InputDecoration(labelText: 'Time to Expiration (in Years)'),
              keyboardType: TextInputType.number,
            ),
            TextFormField(
              controller: _riskFreeRateController,
              decoration: InputDecoration(labelText: 'Risk-Free Rate (e.g., 0.06 for 6%)'),
              keyboardType: TextInputType.number,
            ),
            TextFormField(
              controller: _volatilityController,
              decoration: InputDecoration(labelText: 'Volatility (e.g., 0.25 for 25%)'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text('Run Simulation'),
              onPressed: () => _navigateToResultsScreen(context),
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToResultsScreen(BuildContext context) {
    try {
      Navigator.push(
        context, MaterialPageRoute(
          builder: (context) => ResultsScreen(
            stockPrice: double.parse(_stockPriceController.text),
            strikePrice: double.parse(_strikePriceController.text),
            timeToExpiration: double.parse(_timeToExpirationController.text),
            riskFreeRate: double.parse(_riskFreeRateController.text),
            volatility: double.parse(_volatilityController.text),
          ),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter valid numbers')),
      );
    }
  }
}