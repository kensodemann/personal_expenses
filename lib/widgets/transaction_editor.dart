import 'package:flutter/material.dart';

class TransactionEditor extends StatefulWidget {
  final Function onAddTransaction;

  const TransactionEditor({Key? key, required this.onAddTransaction})
      : super(key: key);

  @override
  State<TransactionEditor> createState() => _TransactionEditorState();
}

class _TransactionEditorState extends State<TransactionEditor> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();

  void _submitForm() {
    final title = _titleController.text;
    final amount = double.parse(_amountController.text);

    if (title.isEmpty || amount <= 0) {
      return;
    }

    widget.onAddTransaction(title, amount);
    _titleController.clear();
    _amountController.clear();
    // Navigator.of(context).pop();
  }

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
              onPressed: _submitForm,
              child: const Text('Add Transaction'),
            ),
          ],
        ),
      ),
    );
  }
}
