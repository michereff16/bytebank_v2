import 'package:bytebank_v2/http/webclient.dart';
import 'package:bytebank_v2/models/transaction.dart';
import 'package:bytebank_v2/screens/dashboard.dart';
import 'package:flutter/material.dart';

import 'models/contact.dart';

void main() {
  runApp(BytebankApp());
  save(Transaction(200.0, Contact(0, 'Krau', 2000)))
      .then((transaction) => print(transaction));
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
