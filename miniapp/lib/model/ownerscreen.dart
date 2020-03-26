import 'dart:io';

import 'package:dbdummy/model/sqflite_model.dart';
import 'package:flutter/cupertino.dart';

TextEditingController petImage = TextEditingController();
TextEditingController petName = TextEditingController();
TextEditingController petAge = TextEditingController();
TextEditingController petBreed = TextEditingController();
TextEditingController petDescription = TextEditingController();
bool validateImage = false;
bool validateName = false;
bool validateAge = false;
bool validateBreed = false;
bool validateDescription = false;
var image;
File imagefiles;
Dog pet;
String uploadedURL;
var clickedImagePath;
List<File> imagesList= List();
List<String> imageUrls= List();
String url; 
int urlLength;
int imageListLengthBefore;
int imageListLengthAfter;


