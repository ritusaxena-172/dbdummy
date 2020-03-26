import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dbdummy/components/appbar_components.dart';
import 'package:dbdummy/model/buyerScreen.dart';
// import 'package:dbdummy/model/firebasemodel.dart';
import 'package:dbdummy/model/ownerscreen.dart';
import 'package:dbdummy/model/signuomodel.dart';
import 'package:dbdummy/screens/contactDetails.dart';
// import 'package:dbdummy/model/signuomodel.dart';
// import 'package:dbdummy/components/appbar_decoration.dart';
import 'package:dbdummy/utils/color_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_share/flutter_share.dart';
// import 'package:dbdummy/utils/color_services.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ConfirmAdoption extends StatefulWidget {
  ConfirmAdoption(int indexx);

  @override
  _ConfirmAdoptionState createState() => _ConfirmAdoptionState();
}

class _ConfirmAdoptionState extends State<ConfirmAdoption> {
Future share(String path) async {
      print('$path');
      await FlutterShare.shareFile(
        title: 'Example share',
        text: 'Example share text',
        filePath: path,
      );
    }


// void initState() 
// {
//   print('inside initState');
//   super.initState();
//     var data =
//         await Firestore.instance.collection('users').document(dogUserId).get();
//     name = data.data['phone number'];
//     getData();
//     print(phone_number);
// }

  QuerySnapshot queryySnapshot;
  var groupInfo;
// getOwnerInformation() async{
//   return await Firestore.instance.collection('users').document('dogUserId').get(); 
//   }
// getData() async {
//   Firestore.instance
//         .collection('users')
//         .document('dogUserId')
//         .get()
//         .then((DocumentSnapshot ds) {
//       // use ds as a snapshot
//       return ListTile(
//         title: new Text(ds['name']),
//         subtitle: new Text(ds['phone number']),
//       );
//      });
//   }
  
  // Widget getOwnerInformation()
  // {
  //   print('inside getFunction');
  //  ownerInformation().then((results){
  //    setState(() {
  //      queryySnapshot=results;
  //    });
  //  });
  //  if(queryySnapshot!=null)
  //  {
  //    return ;
  //  }
  // }
  // Widget getData()
  // {
    
  // }
  // createAlertDialogueBox(BuildContext context) async
  // {
  //   print('inside alert box');
  //   return showDialog(context: context,builder: (context)
  //   {
  //      return Dialog(
  //      child: getDetails(),
       
  //        );
  //   }
  //   );
  // }
  @override
  Widget build(BuildContext context) {
    width= MediaQuery.of(context).size.width;
    height= MediaQuery.of(context).size.height;
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
      body: Column(
          children: <Widget>[
            Container(
      padding: EdgeInsets.all(15),
      width: width,
      height: height*.5,
      child: Image.network(imageURL),
            ),
            Container(
            child: Center(child: Text(name, style: TextStyle(
             fontSize: 60,
             fontStyle: FontStyle.italic,
            ))),
            ),
            Container(
              // padding: EdgeInsets.all(15),
            child: Center(child: Text(age )),
            ),
            Container(
              // padding: EdgeInsets.all(15),
            child: Center(child: Text(breed)),
            ),
            Row(
              children: <Widget>[
                RaisedButton(
                padding: EdgeInsets.all(15),
                onPressed: (){
                   share(image.path);
                },
                child: Text('Share Me!'), 
                ),
                RaisedButton(
                padding: EdgeInsets.all(15),
                onPressed: (){
                   Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                    builder: (context) =>
                    ContactOwner())
                   );
                },
                child: Text('Adopt Me!'), 
                ),
              ],
            ),
          ],
        ),
    );
  }
}
