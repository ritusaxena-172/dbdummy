// import 'dart:io';
import 'package:connectivity/connectivity.dart';
import 'package:dbdummy/components/appbar_decoration.dart';
import 'package:flutter/material.dart';
class InternetConnectivity extends StatefulWidget {
  @override
  _InternetConnectivityState createState() => _InternetConnectivityState();
}

class _InternetConnectivityState extends State<InternetConnectivity> {
  somefunction() async 
  {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile || connectivityResult== ConnectivityResult.wifi) {
      print("Connected");
    } 
     else {
      print("Not connected");
    }

  }
  Widget someFunc(){
  print('isnide widget');
    somefunction();



    return null;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(shape: RoundedRectangleBorder(
            // borderRadius:BorderRadius.circular(80),
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
          ),
          centerTitle: true,
          title: Text(
            'PawSome!',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          flexibleSpace: Container(
            decoration: boxDecoration,
          ),),
      body:  someFunc(),
      
      
    );
    
  }
}
