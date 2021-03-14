import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class SignUpProvider extends ChangeNotifier {
  var firestoreInstance = FirebaseFirestore.instance;
  TextEditingController firstnamecontroller = new TextEditingController();
  TextEditingController lastnamecontroller = new TextEditingController();
  TextEditingController emailcontroller = new TextEditingController();
  TextEditingController phonecontroller = new TextEditingController();
  TextEditingController passwordcontroller = new TextEditingController();
  final GlobalKey<ScaffoldState> scaffoldkey_signup = new GlobalKey<ScaffoldState>();
  BuildContext context;

  setContext(BuildContext mcontext) {
    context = mcontext;
  }

  bool performBasicValidation() {
    bool iserror = false;
    if (firstnamecontroller.text.isEmpty) {
      scaffoldkey_signup.currentState
          .showSnackBar(new SnackBar(content: Text("FirstName is Undefined")));
      iserror = true;
    }

    if (emailcontroller.text.isEmpty) {
      scaffoldkey_signup.currentState
          .showSnackBar(new SnackBar(content: Text("Email is Undefined")));
      iserror = true;
    }
    if (phonecontroller.text.isEmpty) {
      scaffoldkey_signup.currentState.showSnackBar(
          new SnackBar(content: Text("Phone Number is Undefined")));
      iserror = true;
    }
    if (passwordcontroller.text.isEmpty) {
      scaffoldkey_signup.currentState
          .showSnackBar(new SnackBar(content: Text("Password is Undefined")));
      iserror = true;
    }

    bool emailValid = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(emailcontroller.text);

    if (emailValid == false) {
      scaffoldkey_signup.currentState
          .showSnackBar(new SnackBar(content: Text("Email Format Incorrect")));
      iserror = true;
    }
    return iserror;
  }

  Future<void> addNewUser() async {

  }
}
