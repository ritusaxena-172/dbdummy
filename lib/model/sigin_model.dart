import 'package:flutter/material.dart';

class SignInModel {
  String _signinemail;
  String _uid;

  String _signinpassword;

  String _signinnewPassword;

  String _signinnewPasswordConfirm;

  bool _autovalidateemail = false;

  bool _autovalidatepassword = false;

  bool _autoconfirmpassword = false;

  bool _passwordVisible = true;

  bool _newPasswordVisible = true;

  bool _newConfirmPasswordVisible = true;

  bool _isLoading = false;

  final kalertformkey = GlobalKey<FormState>();

//getters and setters

String get uid => _uid;

  set uid(String uid) {
    this._uid = uid;
  }
  String get signinemail => _signinemail;

  set signinemail(String signinemail) {
    this._signinemail = signinemail;
  }

  String get signinpassword => _signinpassword;

  set signinpassword(String signinpassword) {
    this._signinpassword = signinpassword;
  }


  String get signinnewPassword => _signinnewPassword;

  set signinnewPassword(String signinnewPassword) {
    this._signinnewPassword = signinnewPassword;
  }

  String get signinnewPasswordConfirm => _signinnewPasswordConfirm;

  set signinnewPasswordConfirm(String signinnewPasswordConfirm) {
    this._signinnewPasswordConfirm = signinnewPasswordConfirm;
  }

  bool get autovalidateemail => _autovalidateemail;

  set autovalidateemail(bool autovalidateemail) {
    this._autovalidateemail = autovalidateemail;
  }

  bool get autovalidatepassword => _autovalidatepassword;

  set autovalidatepassword(bool autovalidatepassword) {
    this._autovalidatepassword = autovalidatepassword;
  }

  bool get autoconfirmpassword => _autoconfirmpassword;

  set autoconfirmpassword(bool autoconfirmpassword) {
    this._autoconfirmpassword = autoconfirmpassword;
  }

  bool get passwordVisible => _passwordVisible;

  set passwordVisible(bool passwordVisible) {
    this._passwordVisible = passwordVisible;
  }

  bool get newPasswordVisible => _newPasswordVisible;

  set newPasswordVisible(bool newPasswordVisible) {
    this._newPasswordVisible = newPasswordVisible;
  }

  bool get newConfirmPasswordVisible => _newConfirmPasswordVisible;

  set newConfirmPasswordVisible(bool newConfirmPasswordVisible) {
    this._newConfirmPasswordVisible = newConfirmPasswordVisible;
  }

  bool get isLoading => _isLoading;

  set isLoading(bool isLoading) {
    this._isLoading = isLoading;
  }

// //getters
//   String get email {
//     return signinemail;
//   }

//   String get password {
//     return signinpassword;
//   }

//   String get newPassword {
//     return signinnewPassword;
//   }

//   String get confirmNewPassword {
//     return signinnewPasswordConfirm;
//   }

//   bool get validateemail {
//     return autovalidateemail;
//   }

//   bool get validatepassword {
//     return autovalidatepassword;
//   }

//   bool get validateconfirmpassword {
//     return autoconfirmpassword;
//   }

//   bool get visiblePassword {
//     return passwordVisible;
//   }

//   bool get newVisiblePassword {
//     return newPasswordVisible;
//   }

//   bool get newConfirmVisiblePassword {
//     return newConfirmPasswordVisible;
//   }

//   bool get loading {
//     return isLoading;
//   }

// //setters
//   set email(String email) {
//     this.signinemail = email;
//   }

//   set password(String password) {
//     this.signinpassword = password;
//   }

//   set newPassword(String newPassword) {
//     this.signinnewPassword = newPassword;
//   }

//   set confirmNewPassword(String password) {
//     this.signinnewPasswordConfirm = password;
//   }

//   set validateemail(bool value) {
//     this.autovalidateemail = value;
//   }

//   set validatepassword(bool value) {
//     this.autovalidatepassword = value;
//   }

//   set validateconfirmpassword(bool value) {
//     this.autoconfirmpassword = value;
//   }

//   set visiblePassword(bool value) {
//     this.passwordVisible = value;
//   }

//   set newVisiblePassword(bool value) {
//     this.newPasswordVisible = value;
//   }

//   set newConfirmVisiblePassword(bool value) {
//     this.newConfirmPasswordVisible = value;
//   }

//   set loading(bool value) {
//     this.isLoading = value;
//   }
}
