import './chart_bar.dart';
import '../models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  //const Chart({Key? key}) : super(key: key);

  final List<Transaction> recentTransaction;

  Chart(this.recentTransaction);

  List<Map<String, Object>> get groupTransactionValue {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      var totalSum = 0.0;

      for (var i = 0; i < recentTransaction.length; i++) {
        if (recentTransaction[i].date.day == weekDay.day &&
            recentTransaction[i].date.month == weekDay.month &&
            recentTransaction[i].date.year == weekDay.year) {
          totalSum += recentTransaction[i].amount;
        }
      }

      return {
        'day': DateFormat.E().format(weekDay),
        'amount': totalSum,
      };
    });
  }

  double get totalSpending {
    return groupTransactionValue.fold(0.0, (sum, item) {
      return sum + (item['amount'] as num);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Container(
        width: 200,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: groupTransactionValue.map(
            (data) {
              return ChartBar(data['day'] as String, data['amount'] as double,
                  (data['amount'] as double) / totalSpending);
            },
          ).toList(),
        ),
      ),
    );
  }
}
