import 'package:flutter/material.dart';
import 'package:flutter_senior_mobile_app/constants/colors.dart';

var defaultAppBar = AppBar(
  backgroundColor: Colors.white,
  elevation: 0.0,
  iconTheme: IconThemeData(
    color: tdGrey,
  ),
);

var homeAppBar = AppBar(
  backgroundColor: Colors.white,
  elevation: 0.0,
  leading: Icon(Icons.menu_outlined, color: tdRed,),
  leadingWidth: 56,
  iconTheme: IconThemeData(
    color: tdGrey,
  ),
);
