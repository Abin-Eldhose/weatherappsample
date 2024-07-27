import 'package:flutter/material.dart';

class AppTextFieldTheme {
  static InputDecorationTheme theme = const InputDecorationTheme(
    suffixIconColor: Colors.white,
    labelStyle: TextStyle(color: Color(0xFF807F7F), fontSize: 16),
    hintStyle: TextStyle(color: Color(0xFF888787), fontSize: 16),
    floatingLabelStyle: TextStyle(color: Colors.white, fontSize: 16),
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(width: 3, color: Colors.white),
    ),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(width: 3, color: Colors.white),
    ),
  );
}
