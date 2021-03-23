import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

bool shouldButtonEnabled = true;

getUuid() {
  return Uuid().v4();
}

showMessage(GlobalKey<ScaffoldState> key, String msg) {
  key.currentState.showSnackBar(SnackBar(content: Text("" + msg)));
}

disableButton() {
  //step 2
  shouldButtonEnabled = false;
  Timer(Duration(seconds: 5), () => shouldButtonEnabled = true);
}

checkButtonEnable() {
  // step 1
  return shouldButtonEnabled;
}

