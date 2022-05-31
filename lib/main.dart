import 'package:flutter/material.dart';
import 'package:personal_expenses/pages/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final theme = ThemeData(primarySwatch: Colors.purple);
  static const title = 'Personal Expenses';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      theme: theme.copyWith(
        colorScheme: theme.colorScheme.copyWith(
          secondary: Colors.pink,
        ),
      ),
      home: const MyHomePage(title: title),
    );
  }
}
