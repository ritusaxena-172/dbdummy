import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dbdummy/components/appbar_decoration.dart';
import 'package:dbdummy/utils/color_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ConfirmAdoption extends StatefulWidget {
  @override
  _ConfirmAdoptionState createState() => _ConfirmAdoptionState();
}

class _ConfirmAdoptionState extends State<ConfirmAdoption> {
  var name;
  Future<String> getData() async {
    String uid = (await FirebaseAuth.instance.currentUser()).uid;
    final data =
        await Firestore.instance.collection('users').document(uid).get();
    name = data.data['phone'];
    return name;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Confirm Adoption ',
          style: TextStyle(color: light, fontWeight: FontWeight.bold),
        ),
        flexibleSpace: Container(
          decoration: boxDecoration,
        ),
      ),
      body: FutureBuilder(
          future: getData(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            String name1;
            if (snapshot.hasData) {
              return Card(child: Container(child: Text(name1)));
            } else {
              return Text('Error');
            }
          }),
    );
  }
}
