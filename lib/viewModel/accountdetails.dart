import 'package:flutter/material.dart';

assignVales(accountScreenModel) {
  accountScreenModel.editName =
      TextEditingController(text: accountScreenModel.name);
<<<<<<< HEAD
  // selection: accountScreenModel.editName.selection);
=======
>>>>>>> 176096e... c_fina
  accountScreenModel.editPhone.value = TextEditingValue(
      text: accountScreenModel.phone,
      selection: accountScreenModel.editPhone.selection);
  var cursorPos = accountScreenModel.editName.selection;
  if (cursorPos.start > accountScreenModel.editName.text.length) {
    cursorPos = new TextSelection.fromPosition(
        new TextPosition(offset: accountScreenModel.editName.text.length));
  }
  accountScreenModel.editName.selection = cursorPos;
}
