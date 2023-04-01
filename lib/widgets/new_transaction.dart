import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);
    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    widget.addTx(
      enteredTitle,
      enteredAmount,
    );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
                controller: titleController,
                keyboardType: TextInputType.text,
                onChanged: (val) {},
                onSubmitted: (_) => submitData(),
                decoration: InputDecoration(labelText: 'Title')),
            TextField(
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitData(),
              //onChanged: (val) => amountInput = val,
              decoration: InputDecoration(labelText: 'Amount'),
            ),
            TextButton(
              child: Text('Add Transaction'),
              onPressed: submitData,
              style: TextButton.styleFrom(
                backgroundColor: Colors.amber.shade400,
                textStyle: TextStyle(color: Colors.red),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
