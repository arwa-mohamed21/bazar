import 'package:flutter/material.dart';
import 'app_color.dart';

class AppTheme {
  static final ThemeData light = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: AppColor.background,
    primaryColor: AppColor.primary,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColor.primary,
      primary: AppColor.primary,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColor.background,
      elevation: 0,
      foregroundColor: AppColor.textDark,
    ),
  );
}
