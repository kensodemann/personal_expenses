import 'package:flutter/material.dart';
import 'package:personal_expenses/models/transaction.dart';
import 'package:personal_expenses/widgets/transaction_item.dart';

class TransactionList extends StatelessWidget {
  final Function onRemoveTransaction;
  final List<Transaction> _transactions;
  const TransactionList(
    this._transactions, {
    Key? key,
    required this.onRemoveTransaction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _transactions.isEmpty
        ? LayoutBuilder(builder: (ctx, constraints) {
            return Column(
              children: [
                SizedBox(
                  height: constraints.maxHeight * 0.1,
                  child: FittedBox(
                    child: Text(
                      'You have no transactions!',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                ),
                SizedBox(
                  height: constraints.maxHeight * 0.1,
                ),
                SizedBox(
                  height: constraints.maxHeight * 0.7,
                  child: const Image(
                    image: AssetImage('assets/images/waiting.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            );
          })
        : ListView.builder(
            itemBuilder: (ctx, idx) => TransactionItem(
              _transactions[idx],
              onRemoveTransaction: onRemoveTransaction,
            ),
            itemCount: _transactions.length,
          );
  }
}
