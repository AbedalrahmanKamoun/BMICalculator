import 'package:flutter/material.dart';
import 'package:bmi_app/screen/home.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: const HomeScreen(),
    title: 'BMI CALC',
    theme: ThemeData(
      primarySwatch: Colors.yellow,
      visualDensity: VisualDensity.adaptivePlatformDensity
    ),
  ));
}
