/**
 * Contains all text styles used in the applications 
 * @author Emmanuel Ogbwe
 */
import 'package:flutter/material.dart';
import 'colors.dart';

class Styles{

  /* ---- Welcome page ---- */
  static TextStyle requestsStyle = TextStyle(
    color: ColorConstant.textGreenColor,
    fontSize: 15.0,
     fontFamily: 'Avenir',
    fontWeight: FontWeight.w500
  );
  /* ---- Chat page ---- */
  static TextStyle chatTexfieldPlaceholderColor = TextStyle(
    color: Colors.grey.shade400,
    fontSize: 18.0,
     fontFamily: 'Avenir',
    fontWeight: FontWeight.w300
  );
  static TextStyle chatTexfieldColor = TextStyle(
    color: Colors.white,
    fontSize: 18.0,
     fontFamily: 'Avenir',
    fontWeight: FontWeight.w300
  );
  static TextStyle chatBubbleTextColor = TextStyle(
    color: Colors.white,
    fontSize: 16.0,
     fontFamily: 'Avenir',
    fontWeight: FontWeight.w400
  );
   static TextStyle chatBubbleRequestText = TextStyle(
    color: ColorConstant.textGreenColor,
    fontSize: 16.0,
     fontFamily: 'Avenir',
    fontWeight: FontWeight.w400
  );
    /* ---- Requests page ---- */
    static TextStyle requestsHeader = TextStyle(
    color: Colors.white,
    fontSize: 45.0,
     fontFamily: 'Avenir',
    fontWeight: FontWeight.w600
  );
}