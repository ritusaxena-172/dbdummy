<<<<<<< HEAD

import 'package:dbdummy/components/appBar_style.dart';
import 'package:dbdummy/components/appbar_decoration.dart';
import 'package:dbdummy/database/uploadImage.dart';
import 'package:dbdummy/model/ownerscreen_model.dart';
import 'package:dbdummy/model/sqflite_model.dart';
import 'package:dbdummy/routes/routes.dart';
=======
import 'package:dbdummy/components/appbar.dart';
import 'package:dbdummy/database/uploadImage.dart';
import 'package:dbdummy/model/ownerscreen_model.dart';
import 'package:dbdummy/model/sqflite_model.dart';
>>>>>>> 176096e... c_fina
import 'package:dbdummy/utils/color_services.dart';
import 'package:dbdummy/utils/decorations.dart';
import 'package:dbdummy/utils/string_services.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
Pet pet;

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
<<<<<<< HEAD
        print('image is clicked');
      });
    } else {
      print("can't click image");
=======
      });
    } else {
>>>>>>> 176096e... c_fina
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
<<<<<<< HEAD
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Pet Registration form',
            style: style
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
=======
        appBar: func('Pet Registration Form'),
        body: fillForm(),
        );
  }
   fillForm(  )
   {
>>>>>>> 176096e... c_fina
   return  Form(
         key: kformKey,
         child: ListView(children: <Widget>[
           Container(
             margin: EdgeInsets.all(20),
             child: IconButton(
           iconSize: 50,
           onPressed: () {
             openCamera(context);
           },
           icon: Icon(Icons.camera_alt),
             ),
<<<<<<< HEAD

             // ),
=======
>>>>>>> 176096e... c_fina
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
<<<<<<< HEAD
                 return value.isEmpty ? nullname : null;
=======
                 return value.isEmpty ? nullgender : null;
>>>>>>> 176096e... c_fina
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
<<<<<<< HEAD
                 return value.isEmpty ? nullbreed : null;
=======
                 return value.isEmpty ? validatedescription : null;
>>>>>>> 176096e... c_fina
               },
               onEditingComplete: () {
                 setState(() {
                   ownerScreenModel.validateDescription = true;
                 });
               },
             ),
           ),
           
           Builder(builder: (context)=> RaisedButton(
             color: firstcolor,
             shape: buttonborder,
             onPressed: () {
<<<<<<< HEAD
               Scaffold.of(context).showSnackBar(
                 SnackBar(content: Center(child: CircularProgressIndicator()),)
               );
=======
              //  Scaffold.of(context).showSnackBar(
              //    SnackBar(content: Center(child: CircularProgressIndicator()),)
              //  );
>>>>>>> 176096e... c_fina
               uploadFile(context, ownerScreenModel);
               },
             child: Text('Submit'),
           ),
         )
          
         
         ]));
      
   } 
   }
   
