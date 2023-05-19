import 'package:currency_convertor/components/dropDown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final val = StateProvider<String>((ref) => "USD");
//String val = "USD";
final cur = Provider<List<String>>((ref) => ["usd","egp","eur"]);

Widget CustomDropDown(List l,StateProvider<String> p){
  p = val;
  return Container(
    padding: EdgeInsets.symmetric(vertical: 4, horizontal: 18),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8),
    ),
    child: Consumer(builder: (context, ref, child){
      //ref.watch(p.notifier).state = val;
      //final value = ref.watch(val);
      final value = ref.watch(p);
      //final value = "choose";
      //final items = ref.watch(cur);
      //var items = {"usd","egp","eur"};
      var items = l;
      print(value);
      return DropdownButton(
        value: value,
        items: items.map((v) =>
            DropdownMenuItem<String>(
              value: v,
              child: Text(v),
            )
        ).toList(),
        onChanged: (newval){
          print(newval);
          ref.watch(val.notifier).state = newval!;
          ref.watch(p.notifier).state = newval;
        },
      );
    }),
  );
}
