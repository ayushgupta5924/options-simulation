import 'package:flutter/material.dart';
import 'package:option_trading/screens/input_screen.dart';
// ignore: unused_import
import 'package:http/http.dart' as http;

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
        scaffoldBackgroundColor: Color.fromARGB(138, 76, 214, 191),
      ),
      home: InputScreen(),
    );
  }
}


    // theme: new ThemeData(scaffoldBackgroundColor: const Color(0xFFEFEFEF)),
    // home: new MyHomePage(title: 'Flutter Demo Home Page'),