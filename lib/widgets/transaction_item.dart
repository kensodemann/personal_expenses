import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses/models/transaction.dart';

class TransactionItem extends StatelessWidget {
  final Function onRemoveTransaction;
  final Transaction transaction;

  const TransactionItem(
    this.transaction, {
    Key? key,
    required this.onRemoveTransaction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 5,
      ),
      elevation: 5,
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: FittedBox(
              child: Text('\$${transaction.amount}'),
            ),
          ),
        ),
        title: Text(
          transaction.title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        subtitle: Text(
          DateFormat.yMMMd().format(transaction.date),
          style: Theme.of(context).textTheme.titleSmall,
        ),
        trailing: IconButton(
          icon: const Icon(Icons.delete),
          color: Theme.of(context).colorScheme.error,
          onPressed: () => onRemoveTransaction(transaction.id),
        ),
      ),
    );
  }
}
