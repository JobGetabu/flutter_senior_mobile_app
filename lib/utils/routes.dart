import 'package:flutter/material.dart';
import 'package:flutter_senior_mobile_app/screens/home_screen.dart';
import 'package:flutter_senior_mobile_app/screens/login_screen.dart';
import 'package:flutter_senior_mobile_app/screens/verification_screen.dart';
import 'package:flutter_senior_mobile_app/screens/welcome_screen.dart';

final GlobalKey<NavigatorState> navigationKey = GlobalKey<NavigatorState>();

final Map<String, WidgetBuilder> routes = {
  WelcomeScreen.routeName: (context) => WelcomeScreen(),
  LoginScreen.routeName: (context) => LoginScreen(),
  VerificationScreen.routeName: (context) => VerificationScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
};
