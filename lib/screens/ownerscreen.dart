import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dbdummy/components/appbar_decoration.dart';
import 'package:dbdummy/model/ownerscreen_model.dart';
import 'package:dbdummy/model/sqflite_model.dart';
// import 'package:dbdummy/provider/owner.dart';
import 'package:dbdummy/routes/routes.dart';
// import 'package:dbdummy/screens/donorFavScreen.dart';
import 'package:dbdummy/screens/signupsignin/widget/signup.dart';
import 'package:dbdummy/services/firebasestore.dart';
import 'package:dbdummy/services/formfilledCheck.dart';
import 'package:dbdummy/utils/color_services.dart';
import 'package:dbdummy/utils/decorations.dart';
import 'package:dbdummy/utils/string_services.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:path/path.dart';

Pet pet;
// DbPet _dbPet;
// DocumentSnapshot _documentSnapshot;


final kformKey = GlobalKey<FormState>();
OwnerScreenModel ownerScreenModel = OwnerScreenModel();

class OwnerScreen extends StatefulWidget {
  @override
  _OwnerScreenState createState() => _OwnerScreenState();
}
class _OwnerScreenState extends State<OwnerScreen> {
void insertingDtaFirebase(BuildContext context) async {
  // upload
  print('Inside insertingDtaFirebase');
  print('uid is still $uid');
  Map<String, String> petInformation = <String, String>{
    "uid": uid,
    "petName": petName.text,
    "petAge": petAge.text,
    "petBreed": petBreed.text,
    "petGender": petGender.text,
    "petDescription": petDescription.text,
    "ImageUrl": imageUrl,
  };
  
  petCollection.document(uid).setData(petInformation).then((_){
     print('data set ${petName.text}');
      // showDialog(
      //      context: context,
      //                       builder: (context) {
      //                         return contentAlert(context);
      //                       }
      // );
                            
                            petName.clear();
                            petAge.clear();
                            petBreed.clear();
                            petGender.clear();
                            petDescription.clear();
                            
       Navigator.pushReplacementNamed(context, Routes().petDisplay);                      
  });
}
Future uploadFile(BuildContext context) async {    
    print('inside upload function');
    StorageReference reference = FirebaseStorage.instance.ref().child("user_input/${petName.text}");
    StorageUploadTask uploadTask = reference.putFile(imageFile);  
    await uploadTask.onComplete;
    print('File uploaded');
    reference.getDownloadURL().then((fileURL){
      print('inside download url');
      setState(() {
      imageUrl=fileURL;
      print('url after downloading is $imageUrl');
    });
    try {
      getUID().then((_){insertingDtaFirebase(context);});
         } catch (e) {
          print(e.message);
         }
  });
 } 



  openCamera(BuildContext context) async {
    image = await ImagePicker.pickImage(source: ImageSource.camera);
    if (image != null) {
      setState(() {
        imageFile = image;
        print('image is clicked');
      });
    } else {
      print("can't click image");
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Pet Registration form',
            style: TextStyle(color: light, fontWeight: FontWeight.bold),
          ),
          flexibleSpace: Container(
            decoration: boxDecoration,
          ),
        ),
        body: fillForm(),
       
      
        );
 
  }
   fillForm(  )
   {
     print('here');
   return  Form(
         key: kformKey,
         child: ListView(children: <Widget>[
           Container(
             margin: EdgeInsets.all(20),
             child: IconButton(
           iconSize: 50,
           onPressed: () {
             openCamera(context);
             // Image.file(imagefiles);
           },
           icon: Icon(Icons.camera_alt),
             ),

             // ),
           ),
           Container(
             margin: EdgeInsets.all(20),
             child: TextFormField(
               decoration: InputDecoration(
                 enabledBorder: outlineTextFiled,
                 prefixIcon: Icon(
                   Icons.pets,
                   size: 20.0,
                   color: firstcolor,
                 ),
                 hintText: 'Enter your Pet\'s name',
               ),
               controller: petName,
               autovalidate: ownerScreenModel.validateName,
               validator: (value) {
                 return value.isEmpty ? nullname : null;
               },
               onEditingComplete: () {
                 setState(() {
                   ownerScreenModel.validateName = true;
                   
                 });
               },
             ),
           ),
           Container(
             margin: EdgeInsets.all(20),
             child: TextFormField(
               decoration: InputDecoration(
                 enabledBorder: outlineTextFiled,
                 prefixIcon: Icon(
                   Icons.pets,
                   size: 20.0,
                   color: firstcolor,
                 ),
                 hintText: 'Enter your Pet\'s age',
               ),
               controller: petAge,
               autovalidate: ownerScreenModel.validateAge,
               validator: (value) {
                 return value.isEmpty ? nullage : null;
               },
               onEditingComplete: () {
                 setState(() {
                   ownerScreenModel.validateAge = true;
                 });
               },
             ),
           ),
           Container(
             margin: EdgeInsets.all(20),
             child: TextFormField(
               decoration: InputDecoration(
                 enabledBorder: outlineTextFiled,
                 prefixIcon: Icon(
                   Icons.pets,
                   size: 20.0,
                   color: firstcolor,
                 ),
                 hintText: 'Enter your Pet\'s gender',
               ),
               controller: petGender,
               autovalidate: ownerScreenModel.validateGender,
               validator: (value) {
                 return value.isEmpty ? nullname : null;
               },
               onEditingComplete: () {
                 setState(() {
                   ownerScreenModel.validateGender = true;
                 });
               },
             ),
           ),
           Container(
             margin: EdgeInsets.all(20),
             child: TextFormField(
               decoration: InputDecoration(
                 enabledBorder: outlineTextFiled,
                 prefixIcon: Icon(
                   Icons.pets,
                   size: 20.0,
                   color: firstcolor,
                 ),
                 hintText: 'Enter your Pets\'s breed',
               ),
               controller: petBreed,
               autovalidate: ownerScreenModel.validateBreed,
               validator: (value) {
                 return value.isEmpty ? nullbreed : null;
               },
               onEditingComplete: () {
                 setState(() {
                   ownerScreenModel.validateBreed = true;
                 });
               },
             ),
           ),
           Container(
             margin: EdgeInsets.all(20),
             child: TextFormField(
               decoration: InputDecoration(
                 enabledBorder: outlineTextFiled,
                 prefixIcon: Icon(
                   Icons.description,
                   size: 20.0,
                   color: firstcolor,
                 ),
                 hintText: 'Enter your Pets\'s description',
               ),
               controller: petDescription,
               autovalidate: ownerScreenModel.validateDescription,
               validator: (value) {
                 return value.isEmpty ? nullbreed : null;
               },
               onEditingComplete: () {
                 setState(() {
                   ownerScreenModel.validateDescription = true;
                 });
               },
             ),
           ),
           RaisedButton(
             color: firstcolor,
             shape: buttonborder,
             onPressed: () {
               
               uploadFile(context);
               // onPressOwner(context);
               // _dbDog.deleteTable();
               //Navigator.pushNamed(context, Routes().homeScreen);
               // onPressOwner2(context);
             },
             child: Text('Submit'),
           ),
           // Image.asset(imagefiles.toString())
         ]));
      
   }
  //  contentAlert(BuildContext context)
  //  {
  //   Builder(builder: (BuildContext context){

  //  return AlertDialog(
  //                             title: Text('Thank You'),
  //                             content: Text(alertContent),
  //                             shape: RoundedRectangleBorder(
  //                             borderRadius: BorderRadius.circular(20),

  //                             ),
  //                             actions: <Widget>[
  //                               RaisedButton(
  //                                 child: Text('Ok'),
  //                                 onPressed: (){ Navigator.pushReplacementNamed(context, Routes().homeScreen);}),
  //                               RaisedButton(
  //                                 child: Text('Display Pets'),
  //                                 onPressed: (){
  //                                   Navigator.pushReplacementNamed(context, Routes().petDisplay);   
  //                                 })
  //                             ],
  //                           );
     
  //    }
  //     );
  //       }
        contentAlert(BuildContext context) {
 
  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
     title: Text('Thank You'),
                              content: Text(alertContent),
                              shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),

                              ),
                              actions: <Widget>[
                                RaisedButton(
                                  child: Text('Ok'),
                                  onPressed: (){ Navigator.pushReplacementNamed(context, Routes().homeScreen);}),
                                RaisedButton(
                                  child: Text('Display Pets'),
                                  onPressed: (){
                                    Navigator.pushReplacementNamed(context, Routes().petDisplay);   
                                  })
                              ],
                            );
  

  // show the dialog
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return alert;
                          },
                        );
}

     
   }
   
