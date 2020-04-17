import 'package:dbdummy/utils/color_services.dart';
import 'package:flutter/material.dart';

final outlineTextFiled = OutlineInputBorder(
    borderRadius: BorderRadius.circular(40),
    borderSide: BorderSide(color: firstcolor));

final buttonborder = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(40.0),
    side: BorderSide(color: Colors.white));

// final inputDecoration = InputDecoration(
//   errorStyle: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
//   fillColor: Colors.black.withOpacity(0.4),
//   filled: true,
//   contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
//   border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
//   // labelText: 'Name?',
//   labelStyle:
//       TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: Colors.white),
// );
