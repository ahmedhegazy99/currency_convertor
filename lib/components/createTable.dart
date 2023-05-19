import 'package:currency_convertor/components/constants.dart';
import 'package:flutter/material.dart';
import '../models/currencyResponseModel.dart';



Widget createTable(List<Rates>? ratesList){
  List<TableRow> rows = [];
  rows.add(
      TableRow(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Text("Date", style: TextStyle(color: Colors.white),),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Text("value", style: TextStyle(color: Colors.white),),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Text("Currency", style: TextStyle(color: Colors.white),),
            ),
          ]
      )
  );
  for (int i = 0; i < ratesList!.length; i++) {
    rows.add(
        TableRow(
          children: [
            Text(ratesList[i].date, style: TextStyle(color: Colors.white),),
            Text(ratesList[i].value, style: TextStyle(color: Colors.white),),
            Text(ratesList[i].currency, style: TextStyle(color: Colors.white),),
          ]
        )
    );
  }
  return Container(
    margin: EdgeInsets.symmetric(vertical: 12.0, horizontal: 14.0),
    padding: EdgeInsets.symmetric(vertical: 18.0, horizontal: 18.0),
    color: foregroundColor,
    child: Table(
        children: rows
    )
  );
}