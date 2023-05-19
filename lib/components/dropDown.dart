// import 'dart:js';
//
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
//
// class DropDown extends StatefulWidget {
//   var controller;
//   var currencies;
//
//   DropDown({
//     Key ?key,
//     this.controller,
//     this.currencies,
//   }) :super(key: key);
//
//   @override
//   _DropDownState createState() => _DropDownState();
// }
//
// class _DropDownState extends State<DropDown> {
//   //final controller = Get.put(CreatePlayerController());
//   String ?dropdownValue = 'select';
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     widget.currencies = Get.find<PostController>().cities.value;
//     //dropdownValue = widget.cities[0].cityName;
//     return Container(
//       //margin: EdgeInsets.symmetric(vertical: 12.5* widget.cSize),
//       padding: EdgeInsets.symmetric(horizontal: 12 *widget.cSize!, vertical: 5 * widget.cSize!),
//       height: size.width * (widget.cSize!/6),
//       width: size.width * widget.cSize! * widget.oWidth!,
//       decoration: BoxDecoration(
//         color: widget.color,
//         borderRadius: BorderRadius.circular(/*37.5*cSize*/30),
//       ),
//       child:DropdownButton<String>(
//         value: dropdownValue,
//         icon: Icon(Icons.arrow_downward, color: ppmMain),
//         iconSize: 24,
//         elevation: 16,
//         style: TextStyle(
//             color: ppmMain
//         ),
//
//         onChanged: (String ? newValue) {
//           setState(() {
//             dropdownValue = newValue! ;
//             widget.controller.city = dropdownValue;
//             /*switch (dropdownValue) {
//               case 'Coworking Space': {
//                   controller.category = PlaceTypeEnum.coworkingSpace.toString();
//                 } break;
//               case 'Studio': {
//                 controller.category = PlaceTypeEnum.studio.toString();
//               } break;
//               case 'Restaurant': {
//                 controller.category = PlaceTypeEnum.restaurant.toString();
//               } break;
//           }*/
//           });
//         },
//
//         items: widget.currencies
//             .map<DropdownMenuItem<String>>((data) {
//           return DropdownMenuItem<String>(
//             value: data.cityName,
//             child: Center(child: Text('${data.cityName}'.tr)),
//           );
//         }).toList(),
//       ),
//     );
//   }
// }