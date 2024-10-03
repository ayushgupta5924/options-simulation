import 'package:flutter/material.dart';
import 'package:option_trading/screens/results_screen.dart';

class InputScreen extends StatelessWidget{
  final TextEditingController _stockPriceController = TextEditingController();
  final TextEditingController _strikePriceController = TextEditingController();
  final TextEditingController _timeToExpirationController = TextEditingController();
  final TextEditingController _riskFreeRateController = TextEditingController();
  final TextEditingController _volatilityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Options Pricing Simulation'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextFormField(
              controller: _stockPriceController,
              decoration: InputDecoration(labelText: 'Current Stock Price'),
              keyboardType: TextInputType.number,
            ),
            TextFormField(
              controller: _strikePriceController,
              decoration: InputDecoration(labelText: 'Strike Price: '),
              keyboardType: TextInputType.number,
            ),
            TextFormField(
              controller: _timeToExpirationController,
              decoration: InputDecoration(labelText: 'Time to Expiration'),
              keyboardType: TextInputType.number,
            ),
            TextFormField(
              controller: _riskFreeRateController,
              decoration: InputDecoration(labelText: 'Risk-Free Rate'),
              keyboardType: TextInputType.number,
            ),
            TextFormField(
              controller: _volatilityController,
              decoration: InputDecoration(labelText: 'Volatility'),
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
  }
}