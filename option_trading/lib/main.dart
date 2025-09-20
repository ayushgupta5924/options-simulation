import 'package:flutter/material.dart';
import 'package:option_trading/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Option Pricing Simulation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: HomeScreen(),
    );
  }
}


    // theme: new ThemeData(scaffoldBackgroundColor: const Color(0xFFEFEFEF)),
    // home: new MyHomePage(title: 'Flutter Demo Home Page'),