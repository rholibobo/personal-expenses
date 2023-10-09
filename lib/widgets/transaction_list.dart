// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, use_key_in_widget_constructors, avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  // TransactionList({Key? key}) : super(key: key);

  final List<Transaction> transactions;
  final Function deleteTx;

  TransactionList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(builder: (context, constraints) {
            return Column(
              children: <Widget>[
                Text(
                  "No transactions added yet!",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                    height: constraints.maxHeight * 0.6,
                    child: Image.asset(
                      "assets/images/empty.png",
                      fit: BoxFit.contain,
                    ))
              ],
            );
          })
        : ListView.builder(
            itemBuilder: (context, index) {
              return Card(
                elevation: 5,
                margin: EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 5,
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: FittedBox(
                          child: Text('\$${transactions[index].amount}')),
                    ),
                  ),
                  title: Text(
                    transactions[index].title,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  subtitle: Text(
                    DateFormat.yMMMd().format(transactions[index].date),
                  ),
                  trailing: MediaQuery.of(context).size.width > 420
                      ? TextButton.icon(
                          onPressed: () => deleteTx(transactions[index].id),
                          icon: Icon(
                            Icons.delete,
                            color: Theme.of(context).colorScheme.error,
                          ),
                          label: Text(
                            'Delete',
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.error,
                            ),
                          ),
                        )
                      : IconButton(
                          icon: Icon(Icons.delete),
                          color: Theme.of(context).colorScheme.error,
                          onPressed: () => deleteTx(transactions[index].id),
                        ),
                ),
              );
            },
            itemCount: transactions.length,
          );
  }
}
