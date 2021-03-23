import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:kkconferences/Screens/SignInScreen/signin.dart';
import 'package:kkconferences/global/Global.dart';
import 'package:kkconferences/global/constants.dart';
import 'package:kkconferences/model/customer.dart';
import 'package:kkconferences/utils/preference.dart';

import 'SignUp/signup.dart';
import 'HomeScreen/home_screen.dart';

class SplashScreen extends StatefulWidget {
  static const classname="/SplashScreen";
  SplashScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      performNavigate();
    });
  }

  performNavigate() async {
    if(Preference.getString(login_credentials) == null){
      print("user not logged in yet");
      Navigator.pushReplacementNamed(context, SignInPage.classname);
    }else{
      Global.activeCustomer=Customer.fromJson(jsonDecode(Preference.getString(login_credentials)));
      Navigator.of(context).pushNamedAndRemoveUntil(HomePage.classname, (route) => false);
      print("name of active customer is ${Global.activeCustomer.email}");
    }

    //FireBaseApi().checkUserExist(Customer(email: "abc@gmail.com"));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      //    color: main_color,
        color: Colors.white,
        child: Image.asset('assets/logo.png'));
  }
}
