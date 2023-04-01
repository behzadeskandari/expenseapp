import 'package:flutter/foundation.dart';

class Transaction {
  String id = '';
  String title = '';
  double amount = 0.0;
  DateTime date = DateTime.now();

  Transaction({id = '', title = '', amount = 0.0, date = DateTime.march}) {
    this.id = id;
    this.amount = amount;
    this.title = title;
    this.date = date;
  }
}
