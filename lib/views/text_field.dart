import 'package:flutter/material.dart';

class TextFieldClass extends StatelessWidget {
  final TextEditingController titleController;
  final TextEditingController amountController;
  final VoidCallback addTransaction;
  const TextFieldClass({Key? key, required this.titleController, required this.amountController, required this.addTransaction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(labelText: 'Title'),
            ),
            TextField(controller: amountController, decoration: const InputDecoration(labelText: 'Amount')),
            TextButton(
                onPressed: addTransaction,
                child: const Text(
                  'Add Transaction',
                ))
          ],
        ),
      ),
    );
  }
}
