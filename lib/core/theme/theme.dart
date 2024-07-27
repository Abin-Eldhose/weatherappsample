import 'package:flutter/material.dart';
import 'package:weather_app/core/theme/custom_theme.dart/elevated_button_theme.dart';
import 'package:weather_app/core/theme/custom_theme.dart/text_theme.dart';
import 'package:weather_app/core/theme/custom_theme.dart/textfield_theme.dart';

class AppTheme {
  static ThemeData theme = ThemeData(
      useMaterial3: true,
      textTheme: AppTextTheme.theme,
      inputDecorationTheme: AppTextFieldTheme.theme,
      elevatedButtonTheme: AppElevatedButtonTheme.theme);
}
