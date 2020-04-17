import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dbdummy/components/appbar_decoration.dart';
import 'package:dbdummy/model/buyer_model.dart';
import 'package:dbdummy/model/petDisplayModel.dart';
import 'package:dbdummy/screens/chatScreen.dart';
import 'package:dbdummy/screens/petDisplayScreen.dart';
import 'package:dbdummy/utils/color_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_share/flutter_share.dart';

class ConfirmAdoption extends StatefulWidget {
  ConfirmAdoption(BuildContext context, BuyerModel buyerModel);

  @override
  _ConfirmAdoptionState createState() => _ConfirmAdoptionState();
}

DocumentSnapshot documentSnapshot;

class _ConfirmAdoptionState extends State<ConfirmAdoption> {
  PetDisplayModel petDisplayModel = PetDisplayModel();
  // BuyerModel buyerModel= BuyerModel();
  Future share(String path) async {
    print('$path');
    await FlutterShare.shareFile(
      title: 'Example share',
      text: 'Example share text',
      filePath: path,
    );
  }

  void initState() {
    print('inside initState');
    getDetailsOwner().then((result) {
      setState(() {
        documentSnapshot = result;
      });
      print('here');
      print(
          'details are: ${documentSnapshot.data['name']}, ${documentSnapshot.data['uid']}');
// print('$uid');
    });
    super.initState();
  }

  getDetailsOwner() async {
    print('current uid  is ${buyerModel.petUID}');
    return await Firestore.instance
        .collection('users')
        .document(buyerModel.petUID)
        .get();
  }

  QuerySnapshot queryySnapshot;
  var groupInfo;
  @override
  Widget build(BuildContext context) {
    petDisplayModel.width = MediaQuery.of(context).size.width;
    petDisplayModel.height = MediaQuery.of(context).size.height;
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
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(15),
              width: petDisplayModel.width,
              height: petDisplayModel.height * .4,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(imagEURL,
                      width: petDisplayModel.width, fit: BoxFit.fill)),
            ),
            Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40))),
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.all(20),
                      child: Text('${buyerModel.petName} 🐾 ',
                          style: TextStyle(
                              fontSize: 60,
                              fontStyle: FontStyle.italic,
                              color: secondcolor)),
                    ),
                    Card(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(
                            child: Text('AGE \n ${buyerModel.petAge}',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                )),
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
                            child: Text('BREED \n ${buyerModel.petBreed}',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                          Container(
                            width: 2,
                            height: 35,
                            color: Colors.black,
                          ),
                          Container(
                            child: Text('Gender \n ${buyerModel.petGender}',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                        ],
                      ),
                    ),
                    Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                              child: Text('Description:',
                                  style: TextStyle(
                                    fontSize: 20,
                                  ))),
                          Container(
                            height: petDisplayModel.height * .1,
                            width: petDisplayModel.width,
                            child: Center(
                              child: Text(' ${buyerModel.petDescription}',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: secondcolor)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
            Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RaisedButton(
                    padding: EdgeInsets.all(15),
                    onPressed: () {
                      share(imagEURL);
                    },
                    color: firstcolor,
                    child: Text('Share Me!'),
                  ),
                  RaisedButton(
                    padding: EdgeInsets.all(15),
                    onPressed: () {
                      getDetailsOwner().then((result) {
                        setState(() {
                          documentSnapshot = result;
                        });
                      });

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ChatScreen(
                                chatWithUid: documentSnapshot.data['uid'],
                                chatWithName: documentSnapshot.data['name']),
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
