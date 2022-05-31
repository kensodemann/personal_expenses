import 'package:flutter/material.dart';
import 'package:personal_expenses/models/transaction.dart';
import 'package:personal_expenses/widgets/transaction_item.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> _transactions;
  const TransactionList(this._transactions, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      // crossAxisAlignment: CrossAxisAlignment.stretch,
      child: ListView.builder(
        itemBuilder: (ctx, idx) => TransactionItem(_transactions[idx]),
        itemCount: _transactions.length,
      ),
    );
  }
}
