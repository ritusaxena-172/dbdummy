import 'package:dbdummy/components/appbar_components.dart';
import 'package:dbdummy/model/firebasemodel.dart';
import 'package:dbdummy/model/ownerscreen.dart';
import 'package:dbdummy/model/signuomodel.dart';
import 'package:dbdummy/model/sqflite_model.dart';
import 'package:dbdummy/screens/homescreen.dart';
import 'package:dbdummy/services/firebasesignature.dart';
import 'package:dbdummy/services/sqflitehelper.dart';
import 'package:dbdummy/utils/color_service.dart';
import 'package:dbdummy/utils/string_services.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
class OwnerPage extends StatefulWidget {
  @override
  _OwnerPageState createState() => _OwnerPageState();
}
class _OwnerPageState extends State<OwnerPage> {
  int lengthBefore, lengthAfter, length;
  final kformKey = GlobalKey<FormState>();
void insertingDtaFirebase() async{
  Map<String, String> petInformation = <String, String>{
      "Pet_name": petName.text,
      "Pet_age": petAge.text,
      "Pet_breed":petBreed.text,
      "UID": uid,
      "ImageUrl": url,
    };
    petCollection.document(uid).setData(petInformation);
}
  openCamera(BuildContext context) async {
    image = await ImagePicker.pickImage(source: ImageSource.camera);
    if (image != null) {
      setState(() {
        imagefiles = image;
      }
      );
      print(lengthAfter);
    }
    else
    {
      length=imagesList.length; 
      print("can't click image");
      print(length);
    }
  }
Future uploadFile() async {    
    print('inside upload function');
    StorageReference reference = FirebaseStorage.instance.ref().child("user_input/${petName.text}");
    StorageUploadTask uploadTask = reference.putFile(imagefiles);  
    await uploadTask.onComplete;
    print('File uploaded');
    reference.getDownloadURL().then((fileURL){
      print('inside download url');
    setState(() {
      url=fileURL;
      print('url after downloading is $url');
    });
  });
 } 
//  Future uploadMultipleImages() async{
//    imageListLengthBefore=imagesList.length;//0//1
//    print('length is $imageListLengthBefore');//0//1
//    imagesList.add(imagefiles);//1//2
//    for(int i=imageListLengthBefore; i<imagesList.length; i++)
//    {
//      StorageReference reference = FirebaseStorage.instance.ref().child("user_input/$i");
//      StorageUploadTask uploadTask = reference.putFile(imagefiles);  
//      await uploadTask.onComplete;
//      reference.getDownloadURL().then((fileURL){
//        setState(() {
//          url=fileURL;
//        });
//        imageUrls.add(fileURL);
//        print(fileURL);
//      }
//      );
//    }
//  }
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
        body: Container(
          child: Form(
              key: kformKey,
              child: Column(children: <Widget>[
                Expanded(
                    child: Container(
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
                )),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(20),
                    child: TextFormField(
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(80),
                            borderSide: BorderSide(color: firstcolor)),
                        prefixIcon: Icon(
                          Icons.pets,
                          size: 20.0,
                          color: firstcolor,
                        ),
                        hintText: 'Enter your Pet\'s name',
                      ),
                      controller: petName,
                      autovalidate: validateName,
                      validator: (value) {
                        return value.isEmpty ? nullname : null;
                      },
                      onEditingComplete: () {
                        setState(() {
                          validateAge = true;
                        });
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(20),
                    child: TextFormField(
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(80),
                            borderSide: BorderSide(color: firstcolor)),
                        prefixIcon: Icon(
                          Icons.pets,
                          size: 20.0,
                          color: firstcolor,
                        ),
                        hintText: 'Enter your Pet\'s age',
                      ),
                      controller: petAge,
                      autovalidate: validateAge,
                      validator: (value) {
                        return value.isEmpty ? nullage : null;
                      },
                      onEditingComplete: () {
                        setState(() {
                          validateName = true;
                        });
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(20),
                    child: TextFormField(
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(80),
                            borderSide: BorderSide(color: firstcolor)),
                        prefixIcon: Icon(
                          Icons.pets,
                          size: 20.0,
                          color: firstcolor,
                        ),
                        hintText: 'Enter your Pets\'s breed',
                      ),
                      controller: petBreed,
                      autovalidate: validateBreed,
                      validator: (value) {
                        return value.isEmpty ? nullbreed : null;
                      },
                      onEditingComplete: () {
                        setState(() {
                          validateBreed = true;
                        });
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    width: 300,
                    height: 10,
                    margin: EdgeInsets.all(10),
                    child: RaisedButton(
                      color: firstcolor,
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(80.0),
                          side: BorderSide(color: light)),
                      onPressed: () {
                        if (kformKey.currentState.validate()) {
                          
                          uploadFile();
                         try {
                           insertingDtaFirebase();
                           } catch (e) {
                             print(e.message);
                             }
                            petName.clear();
                            petAge.clear();
                            petBreed.clear();
                              Navigator.push(
                              context,
                              MaterialPageRoute(
                              builder: (context) => HomeScreen()));
                        }
                      },
                      child: Text('Submit'),
                    ),
                  ),
                ),
             ])),
        ));
  }
}
