import 'package:cloud_firestore/cloud_firestore.dart';
<<<<<<< HEAD
import 'package:dbdummy/components/appBar_style.dart';
import 'package:dbdummy/components/appbar_decoration.dart';
=======
import 'package:dbdummy/components/appbar.dart';
>>>>>>> 176096e... c_fina
import 'package:dbdummy/database/fetchPetDetails.dart';
import 'package:dbdummy/model/buyer_model.dart';
import 'package:dbdummy/model/general_model.dart';
import 'package:dbdummy/model/petDisplayModel.dart';
import 'package:dbdummy/screens/chatScreen.dart';
import 'package:dbdummy/screens/homescreen.dart';
<<<<<<< HEAD
import 'package:dbdummy/screens/petDisplay/petDisplayScreen.dart';
=======
import 'package:dbdummy/screens/petDisplayScreen.dart';
>>>>>>> 176096e... c_fina
import 'package:dbdummy/services/share.dart';
import 'package:dbdummy/utils/color_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
<<<<<<< HEAD
import 'package:flutter_share/flutter_share.dart';
=======
>>>>>>> 176096e... c_fina
class ConfirmAdoption extends StatefulWidget {
  ConfirmAdoption(BuildContext context, BuyerModel buyerModel, MediaQueryy mediaQuery);

  @override
  _ConfirmAdoptionState createState() => _ConfirmAdoptionState();
}
DocumentSnapshot documentSnapshot;
PetDisplayModel petDisplayModel= PetDisplayModel();
class _ConfirmAdoptionState extends State<ConfirmAdoption> {
<<<<<<< HEAD
Future share(String path) async {
      print('$path');
      await FlutterShare.shareFile(
        title: 'Example share',
        text: 'Example share text',
        filePath: path,
      );
    }


void initState() 
{
  print('inside initState');
=======
void initState() 
{
>>>>>>> 176096e... c_fina
  getDetailsOwner(buyerModel).then((result){
    setState(() {
      documentSnapshot=result;
    });
  });
  super.initState();
<<<<<<< HEAD
}
 

  QuerySnapshot queryySnapshot;
=======
} QuerySnapshot queryySnapshot;
>>>>>>> 176096e... c_fina
  var groupInfo;

  @override
  Widget build(BuildContext context) {
    mediaQuery.width= MediaQuery.of(context).size.width;
    mediaQuery.height= MediaQuery.of(context).size.height;
    return Scaffold(
<<<<<<< HEAD
      appBar: AppBar(
        title: Text(
          'Confirm Adoption ',
          style: style
        ),
        flexibleSpace: Container(
          decoration: boxDecoration,
        ),
      ),
      
=======
      appBar: func('Confirm Adoption'),
>>>>>>> 176096e... c_fina
      body: Card(
        child:Column(
          children: <Widget>[
            Container(
            padding: EdgeInsets.all(15),
            width: mediaQuery.width,
            height: mediaQuery.height*.4,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(imagEURL,width: mediaQuery.width, fit: BoxFit.fill)
              ),
            ),
            Container(
            decoration: BoxDecoration(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(40) , topRight:Radius.circular(40) )
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
<<<<<<< HEAD
                  margin: EdgeInsets.all(20),
                  child: Text('${buyerModel.petName} 🐾 ', style: TextStyle(
                  fontSize: 60,
=======
                  height: mediaQuery.height*.1,
                  margin: EdgeInsets.all(20),
                  child: Text('${buyerModel.petName} 🐾 ', style: TextStyle(
                  fontSize:mediaQuery.height*.065,
>>>>>>> 176096e... c_fina
                  fontStyle: FontStyle.italic,
                  color: secondcolor
                  )),
                ),
<<<<<<< HEAD
                Card(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                  Container(
                     child: Text('AGE \n ${buyerModel.petAge}',style: TextStyle(
                    fontWeight: FontWeight.bold,)),
                    ),
                 
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
                        height: mediaQuery.height*.1,
                        width: mediaQuery.width,
                        child: Center(
                          child: Text(' ${buyerModel.petDescription}',style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: secondcolor
                            )),
                        ),
                        ),
                   ],
=======
                Card(child: Container(
                    height: mediaQuery.height*.05,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                    Container(
                       child: Text('AGE \n ${buyerModel.petAge}',style: TextStyle(
                      fontWeight: FontWeight.bold,)),
                      ),
                 
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
                ),
               Card(
                 child: Container(
                   height: mediaQuery.height*.1,
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: <Widget>[
                       Container(
                         child: Text('Description:', style:TextStyle(
                           fontSize:20,
                         ))
                       ),
                       Center(
                         child: Text(' ${buyerModel.petDescription}',style: TextStyle(
                           fontWeight: FontWeight.bold,
                           fontSize: 20,
                           color: secondcolor
                           )),
                       ),
                     ],
                   ),
>>>>>>> 176096e... c_fina
                 ),
               ),
              ],
            )
<<<<<<< HEAD
                          ),
       
            Container(
=======
            ),
       Container(
         height: mediaQuery.height*.1,
>>>>>>> 176096e... c_fina
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.all(10),
              child: Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RaisedButton(
<<<<<<< HEAD
                  padding: EdgeInsets.all(15),
                  onPressed: ()
=======
                   onPressed: ()
>>>>>>> 176096e... c_fina
                  {
                    final api= ShareAPI();
                    api.onPressed(imagEURL);
                  },
<<<<<<< HEAD
                 
=======
>>>>>>> 176096e... c_fina
                  color: firstcolor,
                  child: Text('Share Me!'), 
                  ),
                  RaisedButton(
<<<<<<< HEAD
                  padding: EdgeInsets.all(15),
=======
>>>>>>> 176096e... c_fina
                  onPressed: (){
                    getDetailsOwner(buyerModel).then((result){
                  setState(() {
                    documentSnapshot=result;
                  });
                    });
<<<<<<< HEAD
                
=======
>>>>>>> 176096e... c_fina
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ChatScreen(
                                chatWithUid: documentSnapshot.data['uid'], chatWithName: documentSnapshot.data['name']),
                          ));
                    
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
