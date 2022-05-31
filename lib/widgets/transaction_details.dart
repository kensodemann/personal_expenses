import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Text(
          DateFormat.yMMMd().format(transaction.date),
          style: Theme.of(context).textTheme.titleSmall,
        ),
      ],
    );
  }
}
