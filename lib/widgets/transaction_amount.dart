import 'package:flutter/material.dart';

class TransactionAmount extends StatelessWidget {
  final double amount;

  const TransactionAmount(this.amount, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.purple,
          width: 2,
        ),
      ),
      margin: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 15,
      ),
      padding: const EdgeInsets.all(10),
      child: Text(
        '\$${amount.toStringAsFixed(2)}',
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color: Colors.purple,
        ),
      ),
    );
  }
}
