import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:kkconferences/Screens/HomeScreen/home_screen.dart';
import 'package:kkconferences/api/FirbaseApi.dart';
import 'package:kkconferences/global/Global.dart';
import 'package:kkconferences/global/const_funcitons.dart';
import 'package:kkconferences/global/constants.dart';
import 'package:kkconferences/model/customer.dart';
import 'package:kkconferences/utils/preference.dart';
import 'package:kkconferences/utils/validation.dart';
import 'package:kkconferences/widgets/sign_up_user_radio_button.dart';

class SignInProvider extends ChangeNotifier {
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  GlobalKey<ScaffoldState> scaffoldkey;
  Function() onsuccessNavigateHome;
  BuildContext context;
  String defautUser=SignInAllUserRadioButton.CUSTOMER;

  void performSignIn() async {
    if (checkButtonEnable() == true) {
      disableButton();
      print("action started");
    } else {
      return;
    }

    if (emailController.text.isEmpty) {
      scaffoldkey.currentState
          .showSnackBar(new SnackBar(content: Text("Email is Undefined")));
      return;
    }
    if (passwordController.text.isEmpty) {
      scaffoldkey.currentState
          .showSnackBar(new SnackBar(content: Text("Password is Undefined")));
      return;
    }

    if (Validation().isEmailValid(emailController.text) == false) {
      scaffoldkey.currentState
          .showSnackBar(new SnackBar(content: Text("Email format Incorrect")));
      return;
    }

    if(defautUser==SignInAllUserRadioButton.CUSTOMER){
      signInCustomer();
    }


  }

  signInCustomer() async{
    Customer customer = Customer(
        email: emailController.text, password: passwordController.text);

    CustomerResult result = await FireBaseApi().signIn(customer);
    if (result.status == 1) {
      // on sucess

      showMessage(scaffoldkey, result.msg);
      Global.activeCustomer=result.customer;
      Navigator.of(context).pushNamedAndRemoveUntil(HomePage.classname, (route) => false);
      print("name of active customer is ${Global.activeCustomer.email}");
    } else if (result.status == 0) {
      // on failed
      showMessage(scaffoldkey, result.msg);
    }
  }

}
