import 'package:dbdummy/utils/string_services.dart';
<<<<<<< HEAD

=======
>>>>>>> 176096e... c_fina
String store;
String nameValidation(String value) {
  if (value != null && value.isEmpty)
    return nullname;
  else if (value.contains(new RegExp(r'^[0-9]'))) return 'Enter a valid name';
  return null;
}

String emailValidation(String value) {
  if (value != null && value.isEmpty)
    return nullemail;
<<<<<<< HEAD
  else if (!value.contains('@'))
    return validemail;
=======
  else if (!value.contains(RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$'
)))
    return validemail;
    
>>>>>>> 176096e... c_fina
  else
    return null;
}

String passwordValidation(String value) {
  if (value != null && value.length < 8)
    return validpassword;
  else {
    store = value;
    return null;
  }
}

String confirmpassword(String value) {
  if (store != value)
    return matchpassword;
  else
    return null;
}

String numberValidation(String value) {
<<<<<<< HEAD
  if (value.length < 10)
=======
  if (value.length!=10)
>>>>>>> 176096e... c_fina
    return validphone;
  else
    return null;
}
<<<<<<< HEAD

String descriptionValidation(String value) {
  if (value.length < 10) {
    return validatedescription;
  } else {
    return null;
  }
}
=======
>>>>>>> 176096e... c_fina
