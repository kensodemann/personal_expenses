import 'package:flutter/material.dart';
import 'package:personal_expenses/models/transaction.dart';

class TransactionDetails extends StatelessWidget {
  final Transaction transaction;

  const TransactionDetails(this.transaction, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          transaction.title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          transaction.date.toString(),
          style: const TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
