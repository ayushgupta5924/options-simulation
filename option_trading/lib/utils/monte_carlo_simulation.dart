// import 'dart:math';

// class OptionPricingResult {
//   final double mean;
//   final double standardDeviation;
//   final List<double> optionPrices;

//   OptionPricingResult({
//     required this.mean,
//     required this.standardDeviation,
//     required this.optionPrices,
//   });
// }

// OptionPricingResult runMonteCarloSimulation(
//   double currentStockPrice,
//   double strikePrice,
//   double timeToExpiration,
//   double riskFreeRate,
//   double volatility, {
//   int numberOfSimulations = 1000,
//   int numberOfSteps = 100,
// }) {
//   List<double> optionPrices = [];

//   for (int i = 0; i < numberOfSimulations; i++) {
//     double stockPrice = currentStockPrice;
//     double dt = timeToExpiration / numberOfSteps;

//     for (int j = 0; j < numberOfSteps; j++) {
//       double rand = Random().nextDouble();
//       double epsilon = sqrt(-2 * log(rand)) * cos(2 * pi * rand);

//       stockPrice *= exp(
//           (riskFreeRate - (pow(volatility, 2) / 2)) * dt + volatility * epsilon);
//     }

//     double payoff = max(0, stockPrice - strikePrice);
//     double discountedPayoff = payoff * exp(-riskFreeRate * timeToExpiration);

//     optionPrices.add(discountedPayoff);
//   }

//   double mean = optionPrices.reduce((a, b) => a + b) / numberOfSimulations;
//   double variance = optionPrices.map((x) => pow(x - mean, 2)).reduce((a, b) => a + b) / numberOfSimulations;
//   double standardDeviation = sqrt(variance);

//   return OptionPricingResult(
//     mean: mean,
//     standardDeviation: standardDeviation,
//     optionPrices: optionPrices,
//   );
// }

import 'dart:math';

class OptionPricingResult {
  final double mean;
  final double standardDeviation;

  OptionPricingResult({
    required this.mean,
    required this.standardDeviation,
  });
}

OptionPricingResult runMonteCarloSimulation(
  double currentStockPrice,
  double strikePrice,
  double timeToExpiration,
  double riskFreeRate,
  double volatility, {
  int numberOfSimulations = 1000,
  int numberOfSteps = 500,
}) {
  List<double> optionPrices = [];
  Random random = Random();

  for (int i = 0; i < numberOfSimulations; i++) {
    double stockPrice = currentStockPrice;
    double dt = timeToExpiration / numberOfSteps;

    for (int j = 0; j < numberOfSteps; j++) {
      double u1 = random.nextDouble();
      double u2 = random.nextDouble();
      double epsilon = sqrt(-2 * log(u1)) * cos(2 * pi * u2);

      stockPrice *= exp(
          (riskFreeRate - (pow(volatility, 2) / 2)) * dt + volatility * sqrt(dt) * epsilon);
    }

    double payoff = max(0, stockPrice - strikePrice);
    double discountedPayoff = payoff * exp(-riskFreeRate * timeToExpiration);

    optionPrices.add(discountedPayoff);
  }

  double mean = optionPrices.reduce((a, b) => a + b) / numberOfSimulations;
  double variance = optionPrices.map((x) => pow(x - mean, 2)).reduce((a, b) => a + b) / numberOfSimulations;
  double standardDeviation = sqrt(variance);

  return OptionPricingResult(
    mean: mean,
    standardDeviation: standardDeviation,
  );
}
