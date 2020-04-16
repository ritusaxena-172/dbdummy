
import 'package:dbdummy/components/appbar_decoration.dart';
import 'package:dbdummy/database/uploadImage.dart';
import 'package:dbdummy/model/ownerscreen_model.dart';
import 'package:dbdummy/model/sqflite_model.dart';
// import 'package:dbdummy/provider/owner.dart';
import 'package:dbdummy/routes/routes.dart';
import 'package:dbdummy/utils/color_services.dart';
import 'package:dbdummy/utils/decorations.dart';
import 'package:dbdummy/utils/string_services.dart';
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
  openCamera(BuildContext context) async {
    image = await ImagePicker.pickImage(source: ImageSource.camera);
    if (image != null) {
      setState(() {
        ownerScreenModel.imageFile = image;
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
               
               uploadFile(context, ownerScreenModel);
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
   
