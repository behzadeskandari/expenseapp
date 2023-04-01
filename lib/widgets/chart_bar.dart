import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  // const ChartBar({Key? key}) : super(key: key);

  final String label;
  final double spendingAmount;
  final double spendingPctOfTotal;

  ChartBar(this.label, this.spendingPctOfTotal, this.spendingAmount);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('\$${spendingAmount.toStringAsFixed(0)}'),
        SizedBox(
          height: 4,
        ),
        Container(
          height: 60,
          width: 10,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: const Color.fromRGBO(220, 220, 220, 1),
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.grey, width: 1.0)),
              ),
              FractionallySizedBox(
                heightFactor: spendingPctOfTotal,
                child: Container(
                  decoration:
                      BoxDecoration(color: Theme.of(context).primaryColor),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 4,
        ),
        Text(label),
      ],
    );
  }
}
