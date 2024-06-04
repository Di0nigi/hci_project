import 'package:flutter/material.dart';
import 'views/homePage.dart';

void main() {
  runApp(const MyApp());
}

double width = 0;
double height = 0;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HCI project',
      home: const HomePage(title: 'HCI'),
    );
  }
}
