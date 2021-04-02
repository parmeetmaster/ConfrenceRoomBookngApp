

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kkconferences/Screens/SignInScreen/signin.dart';
import 'package:kkconferences/providers/booking_screen_provider.dart';
import 'package:kkconferences/providers/home_screen_provider.dart';
import 'package:kkconferences/providers/sign_in_provider.dart';
import 'package:kkconferences/utils/preference.dart';
import 'package:provider/provider.dart';


import 'Screens/BookingScreen/booking_screen.dart';
import 'Screens/HomeDetail/hotel_detail_page.dart';
import 'Screens/SignUp/signup.dart';

import 'Screens/HomeScreen/home_screen.dart';
import 'Screens/splash_screen.dart';
import 'global/constants.dart';
import 'model/customer.dart';
import 'providers/sign_up_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Preference.load();

  runApp(
    MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (ctx) => SignUpProvider()),
          ChangeNotifierProvider(create: (ctx) => SignInProvider()),
          ChangeNotifierProvider(create: (ctx) => HomeScreenProvider()),
          ChangeNotifierProvider(create: (ctx) => BookingScreenProvider()),
        ],
        child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: main_color,
        primarySwatch: Colors.green,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashScreen(title: 'Flutter Demo Home Page'),
      initialRoute: SplashScreen.classname,
      routes: {
        SplashScreen.classname:(context)=>SplashScreen(),
        HomePage.classname:(context)=>HomePage(),
        SignUpScreen.classname:(context) =>SignUpScreen(),
        SignInPage.classname:(context) =>SignInPage(),
        HotelDetailPage.classname:(context) =>HotelDetailPage(),
        BookingScreen.classname:(context)=>BookingScreen()
      },
    );
  }
}

