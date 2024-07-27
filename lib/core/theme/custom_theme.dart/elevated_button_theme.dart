import 'package:flutter/material.dart';

class AppElevatedButtonTheme {
  static final theme = ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          elevation: 2,
          foregroundColor: Colors.white,
          backgroundColor: const Color(0xFFD58617),
          padding: const EdgeInsets.symmetric(vertical: 18),
          textStyle: const TextStyle(
              fontSize: 17, fontWeight: FontWeight.bold, color: Colors.white)));
}
