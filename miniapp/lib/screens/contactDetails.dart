import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dbdummy/components/appbar_components.dart';
import 'package:dbdummy/model/buyerScreen.dart';
import 'package:dbdummy/model/contactDetails.dart';
import 'package:dbdummy/utils/color_service.dart';
import 'package:flutter/material.dart';

class ContactOwner extends StatefulWidget {
  @override
  ContactOwnerState createState() => ContactOwnerState();
}

class ContactOwnerState extends State<ContactOwner> {
  getDetails() async{
    print('inside getDetails');
  details=await Firestore.instance.collection('users').document(dogUserId).get();
     ownerContact= details.data['phone number'];
     ownerName=details.data['name'];
     print('contact is $ownerContact');
      print('contact is $ownerName');
}
showOwnerInfo() 
{
  getDetails();
   return ListTile(
       title: Text('Owner\'s Name is $ownerName'),
       subtitle: Text('Owner\'s Contact Number is $ownerContact'),
     );
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
      body: showOwnerInfo()
      
      // body:
      //  StreamBuilder(
      //   stream: Firestore.instance.collection('users').document('dogUserId').snapshots(),
      //   builder: (BuildContext context, AsyncSnapshot snapshots) {
      //      if (snapshots.hasError) {
      //           print('snapshot has error');
      //           return Text('error: ${snapshots.error}');
      //         }
      //         switch(snapshots.connectionState)
      //         {
      //           case ConnectionState.waiting:
      //           return Text('Loading');
      //           default:
      //           return ListView(
      //               children: snapshots.data.documents.map((DocumentSnapshot document){
      //                  return Card(
      //                    child: ListTile(
      //                       // leading: Text(document['name']),
      //                       title: Text(document['name']),
      //                       subtitle: Text(document['phone number'] ),
      //                       // trailing:Text(document['Pet_breed'] ),
      //                    ),
      //               //Container(child: Text(document['Pet_name'])),
      //               // Container(child: Text(document['Pet_breed'])),
      //             );
      //           }).toList(),
      //         );
      //         }
      //   }
      // )
      // StreamBuilder<DocumentSnapshot>(
      //       stream: Firestore.instance.collection('users').document('dogUserId').snapshots(),
      //       builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
      //         if (snapshot.hasError) {
      //           print('snapshot has error');
      //           return Text('error: ${snapshot.error}');
      //         }
      //         switch(snapshot.connectionState)
      //         {
      //           case ConnectionState.waiting:
      //           return Text('Loading');
      //           default:
      //           return ListView(
      //               children: snapshot.data.documents.map((DocumentSnapshot document){
      //                  return Card(
      //                    child: ListTile(
      //                       leading: Text(document['Pet_name']),
      //                       title: Text(document['Pet_age']),
      //                       subtitle: Text(document['Pet_breed'] ),
      //                       trailing:Text(document['Pet_breed'] ),
      //                    ),
      //               //Container(child: Text(document['Pet_name'])),
      //               // Container(child: Text(document['Pet_breed'])),
      //             );
      //           }).toList(),
      //         );
      //               }
      //       }) 

    );
  }
}