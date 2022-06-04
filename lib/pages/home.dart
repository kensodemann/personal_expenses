import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:personal_expenses/models/transaction.dart';
import 'package:personal_expenses/widgets/chart.dart';
import 'package:personal_expenses/widgets/transaction_editor.dart';
import 'package:personal_expenses/widgets/transaction_list.dart';

class MyHomePage extends StatefulWidget {
  final String title;
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _transactions = [];

  void _addNewTransaction(String title, double amount, DateTime date) {
    final newTx = Transaction(
      title: title,
      amount: amount,
      date: date,
      id: DateTime.now().toString(),
    );

    setState(() {
      _transactions.add(newTx);
    });
  }

  void _startAddNewTransaction(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          behavior: HitTestBehavior.opaque,
          child: TransactionEditor(onAddTransaction: _addNewTransaction),
        );
      },
    );
  }

  void _deleteTransaction(String id) {
    setState(() {
      _transactions.removeWhere((tx) => tx.id == id);
    });
  }

  List<Transaction> get _recentTransactions {
    final beginDate = DateTime.now().subtract(const Duration(days: 7));
    return _transactions.where((tx) => tx.date.isAfter(beginDate)).toList();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final isLandscape = mediaQuery.orientation == Orientation.landscape;

    final PreferredSizeWidget appBar = Platform.isIOS
        ? CupertinoNavigationBar(
            middle: Text(widget.title),
            trailing: Row(mainAxisSize: MainAxisSize.min, children: [
              GestureDetector(
                child: const Icon(CupertinoIcons.add),
                onTap: () => _startAddNewTransaction(context),
              ),
            ]),
          ) as PreferredSizeWidget
        : AppBar(
            title: Text(widget.title),
            actions: [
              IconButton(
                icon: const Icon(Icons.add),
                onPressed:
                    isLandscape ? null : () => _startAddNewTransaction(context),
              ),
            ],
          );

    final availableHeight = mediaQuery.size.height -
        mediaQuery.padding.top -
        appBar.preferredSize.height;

    final body = SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: availableHeight * (isLandscape ? 0.4 : 0.25),
              child: Chart(_recentTransactions),
            ),
            SizedBox(
              height: availableHeight * (isLandscape ? 0.6 : 0.75),
              child: TransactionList(
                _transactions,
                onRemoveTransaction: _deleteTransaction,
              ),
            ),
          ],
        ),
      ),
    );

    return Platform.isIOS
        ? CupertinoPageScaffold(
            child: body,
            navigationBar: appBar as ObstructingPreferredSizeWidget,
          )
        : Scaffold(
            appBar: appBar,
            body: body,
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButton: isLandscape
                ? null
                : FloatingActionButton(
                    child: const Icon(Icons.add),
                    onPressed: () => _startAddNewTransaction(context),
                  ),
          );
  }
}
