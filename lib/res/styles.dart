import 'package:flutter/material.dart';

import 'colors.dart';

class KStyle {
  //---------------content text style---------------//
  static TextStyle content({
    double size = 12,
    double? lineHeight,
    double? letterSpace,
    FontWeight fontWeight = FontWeight.w500,
    Color color = kBlack,
    TextDecoration decoration = TextDecoration.none,
  }) {
    return TextStyle(
        color: color,
        fontSize: size,
        decoration: decoration,
        fontFamily: 'Poppins',
        fontWeight: fontWeight,
        height: lineHeight,
        
        letterSpacing: letterSpace,
        overflow: TextOverflow.ellipsis);
  }

//---------------title text style---------------//
  static TextStyle title({
    double size = 14,
    FontWeight fontWeight = FontWeight.w500,
    Color color = kBlack,
    double? lineHeight,
    double letterSpace = 0.2,
    TextDecoration decoration = TextDecoration.none,
  }) {
    return TextStyle(
        color: color,
        fontSize: size,
        decoration: decoration,
        fontFamily: 'Poppins',
        fontWeight: fontWeight,
        height: lineHeight,
        letterSpacing: letterSpace,
        overflow: TextOverflow.ellipsis);
  }

//---------------heading text style---------------//

  static TextStyle heading({
    double size = 18,
    FontWeight fontWeight = FontWeight.bold,
    Color color = kBlack,
    TextDecoration decoration = TextDecoration.none,
    double? lineHeight,
    double? letterSpace,
  }) {
    return TextStyle(
        color: color,
        fontSize: size,
        decoration: decoration,
        fontFamily: 'Poppins',
        fontWeight: fontWeight,
        height: lineHeight,
        letterSpacing: letterSpace,
        overflow: TextOverflow.ellipsis);
  }
}
