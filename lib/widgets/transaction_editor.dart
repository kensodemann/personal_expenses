import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
  DateTime? _selectedDate;

  Future<void> _presentDatePicker() async {
    final date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1970),
      lastDate: DateTime.now(),
    );

    if (date != null) {
      setState(() {
        _selectedDate = date;
      });
    }
  }

  void _submitForm() {
    if (_amountController.text.isEmpty ||
        _titleController.text.isEmpty ||
        _selectedDate == null) {
      return;
    }

    final title = _titleController.text;
    final amount = double.parse(_amountController.text);

    if (amount <= 0) {
      return;
    }

    widget.onAddTransaction(title, amount, _selectedDate);
    _titleController.clear();
    _amountController.clear();
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.only(
            top: 10,
            left: 10,
            right: 10,
            bottom: mediaQuery.viewInsets.bottom + 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextField(
                decoration: const InputDecoration(labelText: 'Title'),
                controller: _titleController,
                onSubmitted: (_) => _submitForm(),
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Amount'),
                controller: _amountController,
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                onSubmitted: (_) => _submitForm(),
              ),
              SizedBox(
                height: 70,
                child: Row(
                  children: [
                    Expanded(
                      child: Text(_selectedDate == null
                          ? 'No Text Chosen'
                          : DateFormat.yMd().format(_selectedDate!)),
                    ),
                    TextButton(
                        onPressed: _presentDatePicker,
                        child: const Text('Choose Date')),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: _submitForm,
                child: const Text('Add Transaction'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
