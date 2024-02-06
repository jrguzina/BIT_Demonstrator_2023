import 'package:flutter/material.dart';
import 'Pages/StartPage.dart';



void main() => runApp(DemonstratorApp());

class DemonstratorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bosch Smart Home Demonstrator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StartPage(),
    );
  }
}
