// create routes
import 'package:flutter/material.dart';
import 'package:phoenix/screens/app_layout.dart';
import 'package:phoenix/screens/login_screen.dart';
import 'package:phoenix/screens/onboarding_screens.dart';
import 'package:phoenix/screens/splash_screen.dart';


var routes= <String, WidgetBuilder>{
  "/": (BuildContext context) =>  const SplashScreen(),
  "/OnBoardingScreen": (BuildContext context) =>  const OnBoardingScreen(),
  "/LoginScreen": (BuildContext context) =>  const LoginScreen(),
  "/AppLayout": (BuildContext context) =>  const AppLayout(),
};