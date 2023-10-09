// // ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables

// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';

// class AdaptiveFlatButton extends StatelessWidget {
  
//   final String text;
//   final Function handler;

//   AdaptiveFlatButton(this.text, this.handler);

//   @override
//   Widget build(BuildContext context) {
//     return Platform.isIOS
//         ? CupertinoButton(
//             onPressed: handler,
//             child: Text(
//               text,
//               style: TextStyle(fontWeight: FontWeight.bold),
//             ))
//         : TextButton(
//             onPressed: handler,
//             child: Text(
//               text,
//               style: TextStyle(fontWeight: FontWeight.bold),
//             )
//           );
//   }
// }
