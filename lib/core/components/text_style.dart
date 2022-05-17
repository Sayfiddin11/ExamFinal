import 'package:flutter/rendering.dart';

import '../constants/color_consts.dart';

class AppTextStyle {
  static TextStyle textStyleBold({color,size}){
    return TextStyle(
      fontSize: size,
      fontWeight: FontWeight.w700,
      color:color?? ConsColor.black,
    );
  }
   static TextStyle textStyleNormal({color,size}){
    return TextStyle(
      fontSize: size,
      fontWeight: FontWeight.w500,
      color:color?? ConsColor.black,
    );
  }
   static TextStyle textStyle({size}){
    return TextStyle(
      fontSize: size,
      fontWeight: FontWeight.w400,
      color: ConsColor.grey,
    );
  }
}