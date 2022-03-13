// ignore_for_file: prefer_const_constructors

import 'package:bytebank_v2/database/app_database.dart';
import 'package:bytebank_v2/screens/contact_form.dart';
import 'package:bytebank_v2/screens/contacts_list.dart';
import 'package:bytebank_v2/screens/dashboard.dart';
import 'package:flutter/material.dart';

import 'models/contact.dart';

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
      home: Dashboard(),
    );
  }
}
