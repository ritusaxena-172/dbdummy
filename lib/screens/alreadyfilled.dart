import 'package:dbdummy/components/appbar_decoration.dart';
import 'package:dbdummy/components/text_style.dart';
import 'package:dbdummy/model/general_model.dart';
import 'package:dbdummy/screens/homescreen.dart';
import 'package:dbdummy/utils/color_services.dart';
import 'package:dbdummy/utils/string_services.dart';
import 'package:flutter/material.dart';

class AlreadyFilled extends StatelessWidget {
  AlreadyFilled(MediaQueryy mediaQuery);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title: Text(
          'PawSome ',
          style: TextStyle(color: light, fontWeight: FontWeight.bold),
        ),
        flexibleSpace: Container(
          decoration: boxDecoration,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top:40, left:10, bottom: mediaQuery.height*.03),
            height: mediaQuery.height*.1,
            child: Text('Dear user,',style: TextStyle(
              color: secondcolor,
              fontSize: 40,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
            ),)
          ),
          Container(
            margin: EdgeInsets.only(top:5, left: 10, bottom: 10, right:8),
            child: Text(acknowledgement,
            style: textStyle,),
          ),
          Container(
            margin: EdgeInsets.only(top:mediaQuery.height*.05, left: 10, right:8),
            child: Text(ackno,style: textStyle,),
          ),
          Center(
            child: Container(
              // height: mediaQuery.height*.1,
               margin: EdgeInsets.only(top:mediaQuery.height*.1,),
              child: Text('Thank You!',style: TextStyle(
                color: secondcolor,
                fontSize: 40,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
              ), ),
            ),
          )
          
        ],
      ),
      
    );
  }
}