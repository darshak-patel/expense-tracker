import 'dart:ffi';

import 'package:expense_tracker/model/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './views/text_field.dart';
import './views/list_item.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ExpenseTracker(),
    );
  }
}

class ExpenseTracker extends StatefulWidget {
  const ExpenseTracker({Key? key}) : super(key: key);

  @override
  State<ExpenseTracker> createState() => _ExpenseTrackerState();
}

class _ExpenseTrackerState extends State<ExpenseTracker> {
  final List<Transaction> transactions = [
    Transaction(id: '1', title: 'Coffee', amount: 12.10, date: DateTime.now()),
    Transaction(id: '2', title: 'Starbucks', amount: 15.50, date: DateTime.parse('2022-04-01'))
  ];

  late TextEditingController _amountController;
  late TextEditingController _titleController;

  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
    _amountController.dispose();
  }

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
    _amountController = TextEditingController();
  }

  void addTransaction() {
    setState(() {
      transactions
          .add(Transaction(id: '3', title: _titleController.value.text, amount: double.parse(_amountController.value.text), date: DateTime.now()));
      _titleController.clear();
      _amountController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Expense Tracker"),
        backgroundColor: const Color.fromRGBO(136, 3, 252, 1),
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return TextFieldClass(titleController: _titleController, amountController: _amountController, addTransaction: addTransaction);
                  });
            },
            icon: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: Column(children: [
        const SizedBox(
          width: double.infinity,
          child: Card(
            child: Text(
              "Card 1",
            ),
            elevation: 5,
          ),
        ),
        ListItem(transactions: transactions)
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return TextFieldClass(titleController: _titleController, amountController: _amountController, addTransaction: addTransaction);
              });
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: const Color.fromRGBO(136, 3, 252, 1),
      ),
    );
  }
}
