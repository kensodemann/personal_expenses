import 'package:flutter/material.dart';
import 'package:personal_expenses/pages/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final theme = ThemeData(
    primarySwatch: Colors.purple,
    fontFamily: 'Quicksand',
    textTheme: ThemeData.light().textTheme.copyWith(
          titleLarge: const TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          titleMedium: const TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          titleSmall: const TextStyle(
            fontFamily: 'Quicksand',
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
    appBarTheme: ThemeData().appBarTheme.copyWith(
          titleTextStyle: const TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 20,
          ),
        ),
  );
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
