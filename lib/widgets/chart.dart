import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses/models/transaction.dart';
import 'chart_bar.dart';

class Chart extends StatelessWidget {
  final List<Transaction> _recentTransactions;

  const Chart(this._recentTransactions, {Key? key}) : super(key: key);

  List<Widget> get _chartBars {
    final double total =
        _recentTransactions.fold(0.0, (sum, item) => sum + item.amount);

    return List.generate(7, (index) {
      final date = DateTime.now().subtract(Duration(days: index));
      final label = DateFormat.E().format(date);

      double dayTotal = 0.0;

      for (var tx in _recentTransactions) {
        if (tx.date.day == date.day &&
            tx.date.month == date.month &&
            tx.date.year == date.year) {
          dayTotal += tx.amount;
        }
      }

      return Flexible(
        fit: FlexFit.tight,
        child: ChartBar(
          amount: dayTotal,
          percentOfTotal: total == 0.0 ? 0.0 : dayTotal / total,
          label: label,
        ),
      );
    }).reversed.toList();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.all(10),
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: _chartBars,
        ),
      ),
    );
  }
}
