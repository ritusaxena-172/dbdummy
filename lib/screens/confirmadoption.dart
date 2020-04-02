import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dbdummy/components/appbar_decoration.dart';
// import 'package:dbdummy/main.dart';
import 'package:dbdummy/model/buyer_model.dart';
import 'package:dbdummy/model/ownerscreen_model.dart';
import 'package:dbdummy/model/petDisplayModel.dart';
import 'package:dbdummy/screens/petDisplayScreen.dart';
import 'package:dbdummy/utils/color_services.dart';
// import 'package:dbdummy/components/appbar_components.dart';
// import 'package:dbdummy/model/buyerScreen.dart';
// import 'package:dbdummy/model/firebasemodel.dart';
// import 'package:dbdummy/model/ownerscreen.dart';
// import 'package:dbdummy/model/signuomodel.dart';
// import 'package:dbdummy/screens/contactDetails.dart';
// import 'package:dbdummy/model/signuomodel.dart';
// import 'package:dbdummy/components/appbar_decoration.dart';
// import 'package:dbdummy/utils/color_service.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter_share/flutter_share.dart';
// import 'package:dbdummy/utils/color_services.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_share/flutter_share.dart';

class ConfirmAdoption extends StatefulWidget {
  ConfirmAdoption(BuildContext context, BuyerModel buyerModel);

  @override
  _ConfirmAdoptionState createState() => _ConfirmAdoptionState();
}

class _ConfirmAdoptionState extends State<ConfirmAdoption> {

// void initState()
// {
//   super.initState();
//   print(object);
// }

  PetDisplayModel petDisplayModel= PetDisplayModel();
  // BuyerModel buyerModel= BuyerModel();
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
    petDisplayModel.width= MediaQuery.of(context).size.width;
    petDisplayModel.height= MediaQuery.of(context).size.height;
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
      body: Card(
        child:Column(
          children: <Widget>[
            Container(
            padding: EdgeInsets.all(15),
            width: petDisplayModel.width,
            height: petDisplayModel.height*.4,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(imagEURL,width: petDisplayModel.width, fit: BoxFit.fill)
              ),
            ),
            Container(
            decoration: BoxDecoration(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(40) , topRight:Radius.circular(40) )
            ),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(20),
                  child: Text('${buyerModel.petName} 🐾 ', style: TextStyle(
                  fontSize: 60,
                  fontStyle: FontStyle.italic,
                  color: secondcolor
                  )),
                ),
                Card(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                  Container(
                     child: Text('AGE \n ${buyerModel.petAge}',style: TextStyle(
                    fontWeight: FontWeight.bold,)),
                    ),
                  // VerticalDivider(
                  //   color: Colors.black,
                  //   thickness: 5.0,
                  // ),
                  Container(
                  width: 2,
                  height: 35,
                  color: Colors.black,
                   ),
                  Container(
                  child: Text('BREED \n ${buyerModel.petBreed}',style: TextStyle(
                    fontWeight: FontWeight.bold,)),
                  ),
                   Container(
                  width: 2,
                  height: 35,
                  color: Colors.black,
                   ),
                  Container(
                  child: Text('Gender \n ${buyerModel.petGender}',style: TextStyle(
                    fontWeight: FontWeight.bold,)),
                  ),

                                    ],
                                  ),
                ),
               Card(
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: <Widget>[
                     Container(
                       child: Text('Description:', style:TextStyle(
                         fontSize:20,
                       ))
                     ),
                     Container(
                        height: petDisplayModel.height*.1,
                        width: petDisplayModel.width,
                        child: Center(
                          child: Text(' ${buyerModel.petDescription}',style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: secondcolor
                            )),
                        ),
                        ),
                   ],
                 ),
               ),
              ],
            )
                          ),
       
            Container(
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.all(10),
              child: Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RaisedButton(
                  padding: EdgeInsets.all(15),
                  onPressed: (){
                     share(image.path);
                  },
                  color: firstcolor,
                  child: Text('Share Me!'), 
                  ),
                  RaisedButton(
                  padding: EdgeInsets.all(15),
                  onPressed: (){
                    //  Navigator.pushReplacement(
                    //   context,
                    //   MaterialPageRoute(
                    //   builder: (context) =>
                    //   ContactOwner())
                    //  );
                  },
                  color: secondcolor,
                  child: Text('Adopt Me!'), 
                  ),
                ],
              ),
            ),
          ],
        ),
         ),
    );
  }
}
