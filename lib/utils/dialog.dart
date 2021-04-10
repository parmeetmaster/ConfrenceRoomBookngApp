

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class DialogUtil {
  BuildContext context;
  String message;
  String title;
  String buttontext;

  DialogUtil({this.context, this.message, this.title, this.buttontext="Ok"});

  showErrorDialog() {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.ERROR,
      animType: AnimType.BOTTOMSLIDE,
      title: title,
      desc: message,
      btnCancelOnPress: () {},
      btnOkOnPress: () {},
    )..show();
  }

  showSuccessDialog() {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.ERROR,
      animType: AnimType.BOTTOMSLIDE,
      title: title,
      desc: message,
      btnCancelOnPress: () {},
      btnOkOnPress: () {},
    )..show();
  }
}
