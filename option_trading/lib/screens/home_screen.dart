import 'package:flutter/material.dart';
import 'package:option_trading/screens/input_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Options Pricing Simulator'),
        backgroundColor: Colors.blue[700],
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Welcome Section
            Center(
              child: Card(
                color: Colors.blue[50],
                child: Padding(
                  padding: EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.trending_up, size: 48, color: Colors.blue[700]),
                      SizedBox(height: 10),
                      Text('Welcome to Options Pricing Simulator',
                           style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                           textAlign: TextAlign.center),
                      SizedBox(height: 8),
                      Text('Learn and calculate fair option prices using Monte Carlo simulation',
                           style: TextStyle(fontSize: 16), textAlign: TextAlign.center),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),

            // Start Button at top
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => InputScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[700],
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                ),
                child: Text('Start Calculating Options', style: TextStyle(fontSize: 18)),
              ),
            ),
            SizedBox(height: 30),

            // Two Column Layout
            LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth > 800) {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(child: _buildLeftColumn()),
                      SizedBox(width: 16),
                      Expanded(child: _buildRightColumn()),
                    ],
                  );
                } else {
                  return Column(
                    children: [
                      _buildLeftColumn(),
                      _buildRightColumn(),
                    ],
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLeftColumn() {
    return Column(
      children: [
        // What are Options - Detailed
        _buildSection(
          'What are Options?',
          'Options are financial derivatives that give you the RIGHT (not obligation) to buy or sell an underlying asset at a predetermined price within a specific time period.\n\n'
          '📈 CALL OPTIONS:\n'
          '• Right to BUY a stock at strike price\n'
          '• You profit when stock price > strike price\n'
          '• Maximum loss = Premium paid\n'
          '• Unlimited profit potential\n\n'
          '📉 PUT OPTIONS:\n'
          '• Right to SELL a stock at strike price\n'
          '• You profit when stock price < strike price\n'
          '• Maximum loss = Premium paid\n'
          '• Profit limited to strike price\n\n'
          '💡 KEY TERMS:\n'
          '• Premium: Price you pay to buy the option\n'
          '• Strike Price: The agreed buying/selling price\n'
          '• Expiration: When the option expires\n'
          '• Exercise: Actually using your right to buy/sell',
          Icons.account_balance_wallet,
        ),

        // Real Examples
        _buildSection(
          'Real-World Examples',
          '🔥 CALL OPTION EXAMPLE:\n'
          'Stock: Reliance, Current Price: ₹2,500\n'
          'You buy Call Option: Strike ₹2,600, Premium ₹50\n\n'
          'Scenario 1 - Stock rises to ₹2,800:\n'
          '• Exercise option: Buy at ₹2,600, Sell at ₹2,800\n'
          '• Profit = ₹2,800 - ₹2,600 - ₹50 = ₹150 per share\n\n'
          'Scenario 2 - Stock falls to ₹2,400:\n'
          '• Don\'t exercise (why buy at ₹2,600 when market is ₹2,400?)\n'
          '• Loss = Premium paid = ₹50 per share\n\n'
          '❄️ PUT OPTION EXAMPLE:\n'
          'Stock: TCS, Current Price: ₹3,500\n'
          'You buy Put Option: Strike ₹3,400, Premium ₹80\n\n'
          'Scenario 1 - Stock falls to ₹3,200:\n'
          '• Exercise option: Sell at ₹3,400 when market is ₹3,200\n'
          '• Profit = ₹3,400 - ₹3,200 - ₹80 = ₹120 per share\n\n'
          'Scenario 2 - Stock rises to ₹3,700:\n'
          '• Don\'t exercise (why sell at ₹3,400 when market is ₹3,700?)\n'
          '• Loss = Premium paid = ₹80 per share',
          Icons.trending_up,
        ),

        // Mathematical Model
        _buildSection(
          'Mathematical Formula',
          'Stock Price Movement (Geometric Brownian Motion):\n'
          'S(t+dt) = S(t) × exp((r - σ²/2)×dt + σ×√dt×ε)\n\n'
          'Where:\n'
          '• S(t) = Stock price at time t\n'
          '• r = Risk-free rate\n'
          '• σ = Volatility\n'
          '• dt = Time step\n'
          '• ε = Random normal variable\n\n'
          'Option Price = e^(-r×T) × Average(max(S_final - K, 0))',
          Icons.calculate,
        ),
      ],
    );
  }

  Widget _buildRightColumn() {
    return Column(
      children: [
        // Why Options Matter
        _buildSection(
          'Why Trade Options?',
          '🎯 LEVERAGE:\n'
          '• Control large positions with small capital\n'
          '• ₹5,000 premium can control ₹2,50,000 worth of stocks\n\n'
          '🛡️ HEDGING:\n'
          '• Protect your stock portfolio from losses\n'
          '• Buy puts to insure against price drops\n\n'
          '💰 INCOME GENERATION:\n'
          '• Sell options to earn premium income\n'
          '• Generate monthly cash flow from your holdings\n\n'
          '📊 SPECULATION:\n'
          '• Bet on price direction with limited risk\n'
          '• Higher returns than direct stock investment\n\n'
          '⚠️ RISKS:\n'
          '• Options can expire worthless (100% loss)\n'
          '• Time decay reduces option value daily\n'
          '• Requires good market timing and analysis',
          Icons.psychology,
        ),

        // Factors Affecting Option Prices
        _buildSection(
          'What Affects Option Prices?',
          '📈 STOCK PRICE:\n'
          '• Higher stock price = Higher call option value\n'
          '• Higher stock price = Lower put option value\n\n'
          '🎯 STRIKE PRICE:\n'
          '• Lower strike = More expensive call options\n'
          '• Higher strike = More expensive put options\n\n'
          '⏰ TIME TO EXPIRATION:\n'
          '• More time = Higher option value (more chances to profit)\n'
          '• Time decay accelerates as expiration approaches\n\n'
          '📊 VOLATILITY:\n'
          '• Higher volatility = Higher option prices\n'
          '• More price swings = More profit opportunities\n\n'
          '💰 INTEREST RATES:\n'
          '• Higher rates = Higher call prices, Lower put prices\n'
          '• Affects the present value calculations\n\n'
          '💸 DIVIDENDS:\n'
          '• Expected dividends reduce call prices\n'
          '• Increase put prices (stock goes ex-dividend)',
          Icons.tune,
        ),

        // Monte Carlo Simulation
        _buildSection(
          'Monte Carlo Simulation',
          'A mathematical technique that uses random sampling to model complex systems.\n\n'
          'For options pricing:\n'
          '• Simulates thousands of possible stock price paths\n'
          '• Each path uses random price movements\n'
          '• Calculates option payoff for each scenario\n'
          '• Averages all payoffs to get fair price\n\n'
          'This method handles market uncertainty and volatility effectively.',
          Icons.analytics,
        ),

        // How to Use
        _buildSection(
          'How to Use This App',
          '1. Enter current stock price in ₹\n'
          '2. Set strike price (your target price)\n'
          '3. Choose time to expiration in years\n'
          '4. Input risk-free rate (e.g., 0.06 for 6%)\n'
          '5. Set volatility (e.g., 0.25 for 25%)\n'
          '6. Get instant option price calculation!',
          Icons.help_outline,
        ),
      ],
    );
  }

  Widget _buildSection(String title, String content, IconData icon) {
    return Card(
      margin: EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: Colors.blue[700]),
                SizedBox(width: 10),
                Text(title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ],
            ),
            SizedBox(height: 12),
            Text(content, style: TextStyle(fontSize: 14, height: 1.5)),
          ],
        ),
      ),
    );
  }
}