import 'package:flutter/material.dart';
import '../models/transaction.dart';

import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  List<Transaction> transaction = [];

  TransactionList(this.transaction);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: transaction.isEmpty
          ? Column(
              children: [
                Text(
                  'No Transaction Added yet',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 200,
                  child: Image.asset('assets/images/waiting.png',
                      fit: BoxFit.cover),
                )
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                    child: Row(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 15),
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Theme.of(context).primaryColor,
                                width: 2),
                          ),
                          padding: EdgeInsets.all(10),
                          child: Text(
                            '\$${transaction[index].amount.toStringAsFixed(2)}',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Theme.of(context).primaryColor),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              transaction[index].title,
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              DateFormat.yMMMd()
                                  .format(transaction[index].date),
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ));
              },
              itemCount: transaction.length,
              // children: transaction.map((tx) {}).toList(),
            ),
    );
  }
}
