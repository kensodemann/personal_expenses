import 'package:flutter/material.dart';
import 'package:personal_expenses/models/transaction.dart';
import 'package:personal_expenses/widgets/transaction_amount.dart';
import 'package:personal_expenses/widgets/transaction_details.dart';

class TransactionItem extends StatelessWidget {
  final Transaction transaction;

  const TransactionItem(this.transaction, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          TransactionAmount(transaction.amount),
          TransactionDetails(transaction),
        ],
      ),
    );
  }
}
