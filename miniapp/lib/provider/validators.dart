// import 'package:dbdummy/model/ownerscreen_model.dart';
import 'package:dbdummy/model/signuomodel.dart';
// import 'package:dbdummy/model/signup_model.dart';
import 'package:dbdummy/utils/string_services.dart';

String nameValidation(String value) {
  if (value != null && value.isEmpty)
    return nullname;
  else if (value.contains(new RegExp(r'^[0-9]'))) return 'Enter a valid name';
  return null;
}

String emailValidation(String value) {
  if (value != null && value.isEmpty)
    return nullemail;
  else if (!value.contains('@'))
    return validemail;
  else
    return null;
}

String passwordValidation(String value) {
  signuppassword = value;
  if (signuppassword != null && signuppassword.length < 8)
    return validpassword;
  else
    return null;
}

String confirmpassword(String value) {
  if (signuppassword != value)
    return matchpassword;
  else
    return null;
}

String numberValidation(String value) {
  if (value.length < 10)
    return validphone;
  else
    return null;
}

String descriptionValidation(String value) {
  if (value.length < 10) {
    return validatedescription;
  } else {
    return null;
  }
}
