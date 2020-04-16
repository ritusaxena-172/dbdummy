import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dbdummy/components/appbar_decoration.dart';
import 'package:dbdummy/model/buyer_form.dart';
import 'package:dbdummy/provider/adopterScreen.dart';
// import 'package:dbdummy/routes/routes.dart';
// import 'package:dbdummy/screens/buyser2.dart';
// import 'package:dbdummy/screens/petDisplayScreen.dart';
import 'package:dbdummy/screens/signupsignin/widget/signup.dart';
import 'package:dbdummy/services/firebasestore.dart';
import 'package:dbdummy/services/formfilledCheck.dart';
import 'package:dbdummy/utils/color_services.dart';
import 'package:dbdummy/utils/string_services.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_formfield/dropdown_formfield.dart';
// import 'package:dropdownfield/dropdownfield.dart';
class AcceptorScreen extends StatefulWidget {
  @override
  _AcceptorScreenState createState() => _AcceptorScreenState();
}
final kFormKey = GlobalKey<FormState>();
BuyerForm buyerForm =BuyerForm();
class _AcceptorScreenState extends State<AcceptorScreen> {
 
 QuerySnapshot querySnapshot;
  DocumentSnapshot tempo;
  @override
  void initState() {
   
    super.initState();
    buyerForm.wfh = '';
    buyerForm.wfhResult = '';
    buyerForm.numberofPets='';
    buyerForm.numberofPetsRes='';
    buyerForm.userAge='';
  }
 
 
  @override
  Widget build(BuildContext context) {
    return 
    Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text(
            'User Registration form',
            style: TextStyle(color: light, fontWeight: FontWeight.bold),
          ),
          flexibleSpace: Container(
            decoration: boxDecoration,
          ),
        ),
        body: formFunction(),

//         
         
    );
  }
  
  Widget formFunction()
  {
   return  Form(
              key: kFormKey,
                   child: ListView(
                            children: <Widget>
                          [
                            Container(
                              padding: EdgeInsets.all(15),
                              child: DropDownFormField(
                               dataSource: [{
                               "display": "18-22",
                               "value": "18-22",
                                        },
                                        {
                               "display": "23-30",
                               "value": "23-30",
                                        },
                                        {
                               "display": "30-40",
                               "value": "30-40",
                                        },
                                        {
                               "display": "40-50",
                               "value": "40-50",
                                        },
                                        {
                               "display": "50-70",
                               "value": "50-70",
                                        },
                                        ],
                                        textField: 'display',
                                        valueField: 'value',
                                        value: buyerForm.userAge,
                                // onSaved: (value) {
                                //     setState(() {
                                //    _myActivity = value;
                                //     });
                                // },
                                onChanged: (value) {
                                        setState(() {
                               buyerForm.userAge = value;
                                        });
                                },
                               titleText: 'Select your age',
                               hintText: 'Please choose one',
                               
                                        ),
                            ),
                              Container(
                              padding: EdgeInsets.all(15),
                              child: DropDownFormField(
                               dataSource: [
                              
                                        {
                               "display": "Service",
                               "value": "Service",
                                        },
                                        {
                               "display": "Buisnessman",
                               "value": "Buisnessman",
                                        },
                                        {
                               "display": "Homemaker",
                               "value": "Homemaker",
                                        },
                                        ],
                                        textField: 'display',
                                        valueField: 'value',
                                        value: buyerForm.occupation,
                                // onSaved: (value) {
                                //     setState(() {
                                //    _myActivity = value;
                                //     });
                                // },
                                onChanged: (value) {
                                        setState(() {
                               buyerForm.occupation = value;
                                        });
                                },
                               titleText: 'Select your occupation',
                               hintText: 'Please choose one',
                               
                                        ),
                            ),

                            Container(
                              padding: EdgeInsets.all(15),
                              child: DropDownFormField(
                      // textField: 
             dataSource: [{
             "display": "Yes",
             "value": "Yes",
                      },
                      {
             "display": "No",
             "value": "No",
                      },],
                      textField: 'display',
                      valueField: 'value',
                      value: buyerForm.wfh,
                      // onSaved: (value) {
                      //     setState(() {
                      //    _myActivity = value;
                      //     });
                      // },
                      onChanged: (value) {
                      setState(() {
             buyerForm.wfh = value;
                      });
                      },
             titleText: 'Do you work from home?',
             hintText: 'Please choose one',
             
                      ),
                            ),


Container(
                              padding: EdgeInsets.all(15),
                                  child: DropDownFormField(
                               dataSource: [{
                              "display": "0",
             "value": "0",
                      },
                      {
             "display": "1",
             "value": "1",
                      },
                        {
             "display": "2",
             "value": "2",
                      },
                        {
             "display": "3",
             "value": "3",
                      },
                        {
             "display": "4",
             "value": "4",
                      },
                        {
             "display": "4+",
             "value": "4+",
                      },
                                        ],
                                        textField: 'display',
                                        valueField: 'value',
                                        value: buyerForm.familyMembers,
                                // onSaved: (value) {
                                //     setState(() {
                                //    _myActivity = value;
                                //     });
                                // },
                                onChanged: (value) {
                                        setState(() {
                               buyerForm.familyMembers = value;
                               
                                        });
                                },
                               titleText: 'How many people are their in your family?',
                               hintText: 'Please choose one',
                               
                                        ),
                            ),


                     
                            Container(
                              padding: EdgeInsets.all(15),
                                  child: DropDownFormField(
                               dataSource: [{
                              "display": "yes",
             "value": "yes",
                      },
                      {
             "display": "no",
             "value": "no",
                      },
                                        ],
                                        textField: 'display',
                                        valueField: 'value',
                                        value: buyerForm.numberofPets,
                                // onSaved: (value) {
                                //     setState(() {
                                //    _myActivity = value;
                                //     });
                                // },
                                onChanged: (value) {
                                        setState(() {
                               buyerForm.numberofPets = value;
                               if(value=='yes')
                               {
                                 buyerForm.enableField=true;
                               }
                               else{
                                 buyerForm.enableField=false;
                               }
                                        });
                                },
                               titleText: 'Do you have other pets also?',
                               hintText: 'Please choose one',
                               
                                        ),
                            ),
                            Container(
                              padding: EdgeInsets.all(15),
                                 child: TextFormField(
                                   
                                    enabled: buyerForm.enableField,
                                      decoration: InputDecoration(
                                        hintText: 'If Yes, enter your pet details',
                                      ),
                                      controller: userPetDetails,
                                      autovalidate: buyerForm.validatePetDetails,
                                      validator: (value) {
                                        return null;
                                      },
                                      onEditingComplete: () {
                                        setState(() {
                                          buyerForm.validatePetDetails = true;
                                        });
                                      },
                              ),
                            ),
                    
          // Row(
          //   children: <Widget>[
          //     Checkbox(
          //       activeColor: buyerForm.checkBox1 ? green: light,
          //       value: buyerForm.checkBox1,
          //       onChanged: (bool value) {
          //        setState(() {
          //          buyerForm.checkBox1=value;
          //        }); 
                  
          //       }, 
          //     ),
          //     Expanded(
          //       child: Container(
          //             padding: EdgeInsets.all(10),
          //             child: Text('$agreement',style: TextStyle(
          //         fontStyle: FontStyle.italic,
          //         color: Colors.black
          //             ),),
          //           ),
          //     ),
          //   ],
          // ),
          Row(
            children: <Widget>[
              Checkbox(
                activeColor: buyerForm.checkBox2 ? green: light,
                value: buyerForm.checkBox2,
                onChanged: (bool value) {
                 setState(() {
                   print(value);
                   buyerForm.checkBox2=value;

                 }); 
                  
                }, 
              ),
              Expanded(
                child: Container(
                      padding: EdgeInsets.all(10),
                      child: Text('$agreement1',style: TextStyle(
                        fontStyle: FontStyle.italic,
                        color: Colors.black
                      ),),
                    ),
              ),
            ],
          ),
         RaisedButton(
           child: Text('Submit'),
          onPressed: (){ 
            if(buyerForm.checkBox2==true)
            {
              getUID().then((_){
                      print(uid);
                      // saveForm();
                      onPressedSave(context, buyerForm);
            });}
            else{
              print('you need to abide by the tnc');            }
          },
          )
                          ]
                        ),
                                      );
    
  }
   
}
