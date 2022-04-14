import 'package:expense_tracker/model/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ListItem extends StatelessWidget {
  const ListItem({Key? key, required this.transactions}) : super(key: key);

  final List<Transaction> transactions;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
              child: Row(
            children: [
              Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(border: Border.all(color: Colors.black45)),
                  margin: const EdgeInsets.fromLTRB(10, 0, 25, 0),
                  child: Text(
                    '\$${transactions[index].amount.toStringAsFixed(2)}',
                    style: TextStyle(color: Colors.green.shade300, fontWeight: FontWeight.bold),
                  )),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 10, 10, 10),
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      transactions[index].title,
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      DateFormat.yMMMd().format(transactions[index].date),
                      style: const TextStyle(color: Colors.grey),
                    )
                  ],
                ),
              )
            ],
          ));
        });
    // return Column(
    //   children: transactions.map((e) {
    //     return Card(
    //         child: Row(
    //       children: [
    //         Container(
    //             padding: const EdgeInsets.all(20),
    //             decoration: BoxDecoration(border: Border.all(color: Colors.black45)),
    //             margin: const EdgeInsets.fromLTRB(10, 0, 25, 0),
    //             child: Text(
    //               '\$${e.amount.toStringAsFixed(2)}',
    //               style: TextStyle(color: Colors.green.shade300, fontWeight: FontWeight.bold),
    //             )),
    //         Container(
    //           margin: const EdgeInsets.fromLTRB(0, 10, 10, 10),
    //           padding: const EdgeInsets.all(10),
    //           child: Column(
    //             mainAxisAlignment: MainAxisAlignment.start,
    //             crossAxisAlignment: CrossAxisAlignment.start,
    //             children: [
    //               Text(
    //                 e.title,
    //                 style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    //               ),
    //               Text(
    //                 DateFormat.yMMMd().format(e.date),
    //                 style: const TextStyle(color: Colors.grey),
    //               )
    //             ],
    //           ),
    //         )
    //       ],
    //     ));
    //   }).toList(),
    // );
  }
}
