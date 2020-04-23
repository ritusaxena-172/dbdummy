<<<<<<< HEAD
import 'package:dbdummy/components/appBar_style.dart';
import 'package:dbdummy/components/appbar_decoration.dart';
import 'package:dbdummy/utils/color_services.dart';
=======
import 'package:dbdummy/components/appbar.dart';
>>>>>>> 176096e... c_fina
import 'package:flutter/material.dart';

class AboutUsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
<<<<<<< HEAD
      appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(80),
        ),
        centerTitle: true,
        title: Text(
          'About us',
          style: style
        ),
        flexibleSpace: Container(
          decoration: boxDecoration,
        ),
      ),
=======
      appBar:func('About Us'),
>>>>>>> 176096e... c_fina
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
