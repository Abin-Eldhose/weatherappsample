import 'package:flutter/material.dart';

class AppTextTheme {
  static TextTheme theme = TextTheme(
    headlineLarge: const TextStyle().copyWith(
        fontSize: 85, fontWeight: FontWeight.bold, color: Colors.white),
    headlineMedium: const TextStyle().copyWith(
        fontSize: 30, fontWeight: FontWeight.w400, color: Colors.white),
    headlineSmall:
        const TextStyle().copyWith(fontSize: 16, color: Colors.white),
    titleLarge: const TextStyle().copyWith(
        fontSize: 40, fontWeight: FontWeight.w700, color: Colors.white),
    titleMedium: const TextStyle().copyWith(
        fontSize: 26, fontWeight: FontWeight.w700, color: Colors.white),
    titleSmall: const TextStyle().copyWith(
        fontSize: 18, fontWeight: FontWeight.normal, color: Colors.white),
    bodyLarge: const TextStyle().copyWith(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: const Color(0xFF010000)),
  );
}
