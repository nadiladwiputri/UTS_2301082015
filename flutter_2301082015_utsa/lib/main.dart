import 'package:flutter/material.dart';
import 'pdam_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PDAM App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PdamScreen(),
    );
  }
}