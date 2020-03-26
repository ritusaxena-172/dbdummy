// import 'package:dbdummy/components/appbar_decoration.dart';
import 'package:dbdummy/components/appbar_components.dart';
import 'package:dbdummy/utils/color_service.dart';
// import 'package:dbdummy/utils/color_services.dart';

import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(80),
        ),
        centerTitle: true,
        title: Text(
          'About us',
          style: TextStyle(color: light, fontWeight: FontWeight.bold),
        ),
        flexibleSpace: Container(
          decoration: boxDecoration,
        ),
      ),
      body: Container(
        child: Center(
            child: Text(
          'Pawsome!',
          style: TextStyle(fontSize: 50),
        )),
      ),
    );
  }
}
