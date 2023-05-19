import 'dart:ui';

import 'package:currency_convertor/components/constants.dart';
import 'package:currency_convertor/components/customDropDown.dart';
import 'package:currency_convertor/utils/currencyController.dart';
import 'package:currency_convertor/utils/utilFunction.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../components/createTable.dart';

final to = StateProvider<String>((ref) => "1");
//final fromCur = StateProvider<String>((ref) => "USD");
//final toCur = StateProvider<String>((ref) => "USD");



class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final ScrollController scrollController = ScrollController();

  final gotData = StateProvider<bool>((ref) => false);

  CurrencyController cc = new CurrencyController();

  final TextEditingController fromController = TextEditingController(text: "1");
  final TextEditingController toController = TextEditingController(text: "1");

  final TextEditingController fromCurController = TextEditingController(text: "USD");
  final TextEditingController toCurController = TextEditingController(text: "USD");

  final TextEditingController startDateController = TextEditingController(text: getDate());
  final TextEditingController endDateController = TextEditingController(text: getDate());

  final toCur = StateProvider<TextEditingController>((ref) => TextEditingController(text: "USD"));

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    print(getDate().toString());
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: Container(
            width: size.width * 0.9,
            child: Consumer(builder: (context, ref, child){
              //var provider = ref.watch(provider);
              final toValue = ref.watch(to);
              //final baseCur = ref.watch(fromCur);
              //final desiredCur = ref.watch(toCur);
              /*ref.listen(toCur, (previous, next) {
                print("listened to change");
                //call function to get the current conversion of currency
                cc.getCurrencyF(fromCurController.text,toCurController.text,startDateController.text,endDateController.text);
                ref.watch(to.notifier).state =  cc.getCurrency;
                toController.text = toValue;
              });*/
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    margin: const EdgeInsets.only(bottom: 12.0),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Currency\nConverter",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 46,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  SizedBox(height: 20,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: size.width * 0.5,
                        height: size.height * 0.1,
                        child: TextField(
                          controller: fromController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: foregroundColor,
                            labelText: "From",
                            labelStyle: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.start,
                          keyboardType: TextInputType.number,
                        ),
                      ),

                      SizedBox(
                        width: size.width * 0.3,
                        //child: CustomDropDown(["USD","EGP","EUR"],fromCur)
                        child: TextField(
                          controller: fromCurController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            labelText: "From Currency",
                            labelStyle: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: foregroundColor,
                          ),
                          textAlign: TextAlign.start,
                          keyboardType: TextInputType.text,
                        ),
                      ),
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      SizedBox(
                        width: size.width * 0.5,
                        height: size.height * 0.1,
                        child: TextField(
                          readOnly: true,
                          controller: toController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: foregroundColor,
                            labelText: "To",
                            labelStyle: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.start,
                          keyboardType: TextInputType.number,
                        ),
                      ),

                      SizedBox(
                          width: size.width * 0.3,
                          //child: CustomDropDown(["USD","EGP","EUR"],toCur)
                          child: TextField(
                            controller: toCurController,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              labelText: "To Currency",
                              labelStyle: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 18,
                                color: Colors.black,
                              ),
                            ),
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: foregroundColor,
                            ),
                            textAlign: TextAlign.start,
                            keyboardType: TextInputType.text,
                            onSubmitted: (v) async {
                              ref.watch(gotData.notifier).state = false;
                              //await cc.getCurrencyF(fromCurController.text,toCurController.text,startDateController.text,endDateController.text);
                              toController.text = await cc.getCurrency(fromCurController.text,toCurController.text);
                            },
                          ),
                      ),

                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: size.width * 0.4,
                        height: size.height * 0.1,
                        child: TextField(
                          controller: startDateController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: foregroundColor,
                            labelText: "Start Date",
                            labelStyle: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 14,
                              color: Colors.white,
                            ),
                          ),
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.start,
                          keyboardType: TextInputType.datetime,
                        ),
                      ),

                      SizedBox(
                        width: size.width * 0.4,
                        height: size.height * 0.1,
                        child: TextField(
                          controller: endDateController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: foregroundColor,
                            labelText: "End Date",
                            labelStyle: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 14,
                              color: Colors.white,
                            ),
                          ),
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.start,
                          keyboardType: TextInputType.datetime,
                        ),
                      ),
                    ],
                  ),

                  FilledButton(
                      onPressed: () async {
                        ref.watch(gotData.notifier).state = false;
                        //call function to get the current conversion of currency
                        await cc.getCurrencyF(fromCurController.text,toCurController.text,startDateController.text,endDateController.text);
                        Future.delayed(Duration(milliseconds: 300), () {
                          ref.watch(gotData.notifier).state = true;
                        });

                        print("to basic : ${ref.watch(to)}");
                        print("to value : ${toValue}");
                        print("to controller : ${toController.text}");
                      },
                      child: Text("Get Currency")
                  ),

                  Container(
                    width: size.width * 0.9,
                    height: size.height * 0.4,
                    padding: EdgeInsets.only(top: size.height * 0.02),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      controller: scrollController,
                      child: ref.watch(gotData) ? createTable(cc.getRates) : null,
                    ),
                  )

                ],
              );
            }),
          )
      ),
    );
  }
}
