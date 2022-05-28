import 'package:flutter/material.dart';

class TransactionEditor extends StatefulWidget {
  const TransactionEditor({Key? key}) : super(key: key);

  @override
  State<TransactionEditor> createState() => _TransactionEditorState();
}

class _TransactionEditorState extends State<TransactionEditor> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: const InputDecoration(labelText: 'Title'),
              controller: _titleController,
            ),
            TextField(
              decoration: const InputDecoration(labelText: 'Amount'),
              controller: _amountController,
            ),
            TextButton(
                onPressed: () {
                  print(
                      'title: ${_titleController.text}, amount: ${_amountController.text}');
                },
                child: const Text('Add Transaction')),
          ],
        ),
      ),
    );
  }
}
