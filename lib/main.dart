import 'package:flutter/material.dart';
import 'MainScreen.dart';

void main() => runApp(GPACalculatorApp());

class GPACalculatorApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: MainScreen(
        title: 'GPA Calculator',
      ),
    );
  }
}
