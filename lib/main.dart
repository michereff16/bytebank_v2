import 'package:bytebank_v2/screens/dashboard.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(BytebankApp());
}

class BytebankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Colors.green[900],
          appBarTheme: AppBarTheme(color: Colors.green[900])),
      home: const Dashboard(),
    );
  }
}
