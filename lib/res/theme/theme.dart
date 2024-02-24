import 'package:flutter/material.dart';

import '../colors.dart';

//this class contain project themedata we can change anything in here
//here we can change any type of text color and any components have set unique color like bottom navigation bar, appbar and scaffold
//we can add dark mode and light mode
//this private varial going with help of get method
//because get method treat with variables in flutter
class KTheme {
  final ThemeData _themeData = ThemeData(
//--------------text theme ---------------//colors<<<<<<<<<<<//

//--------------compponents color code---------------//
    scaffoldBackgroundColor: kWhite,
    appBarTheme: const AppBarTheme(backgroundColor: kWhite),
    visualDensity: VisualDensity.adaptivePlatformDensity,

//--------------font family---------------//
    fontFamily: 'Poppins',
  );

  ThemeData get theme => _themeData;
}
