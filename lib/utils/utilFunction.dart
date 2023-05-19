// Help to store datetime in firestore
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

String formattedDate = " ";

String getDate() {
  getDateF();
  return formattedDate;
}
Future<String> getDateF() async{
  var now = new DateTime.now();
  var safeNow = now.subtract(Duration(days: 0, hours: 10, minutes: 0));
  var formatter = new DateFormat('yyyy-MM-dd');
  formattedDate = formatter.format(safeNow);
  print(formattedDate); // 2016-01-25
  return formattedDate;
}