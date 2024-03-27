// import 'package:flutter/material.dart';

// Future pickerShowBottomSheet(context, setState,TextEditingController selectedValue) {
//   selectedValue.text = 'Option 1';
//   List<String> options = ['Option 1', 'Option 2', 'Option 3', 'Option 4'];
//
//   return showModalBottomSheet(
//     context: context,
//     builder: (BuildContext context) {
//       return SizedBox(
//         height: 200.0,
//         child: ListView.builder(
//           itemCount: options.length,
//           itemBuilder: (BuildContext context, int index) {
//             return ListTile(
//               title: Text(options[index]),
//               onTap: () {
//                 setState(() {
//                   selectedValue.text = options[index];
//                 });
//                 Navigator.pop(context); // Close the bottom sheet
//               },
//             );
//           },
//         ),
//       );
//     },
//   );
// }
