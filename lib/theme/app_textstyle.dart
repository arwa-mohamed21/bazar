import 'package:flutter/material.dart';
import 'app_color.dart';

class AppTextStyle {
  // العناوين الكبيرة (Onboarding, Welcome Back)
  static const TextStyle title = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColor.textDark,
  );

  // النص الرمادي الصغير تحت العناوين، وhint في الـ textfield
  static const TextStyle subtitle = TextStyle(
    fontSize: 14,
    color: AppColor.textGrey,
  );

  // نص الأزرار البنفسجي (CustomButtonWidget)
  static const TextStyle button = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );

  // عنوان الحقل فوق الـ textfield (Email, Password)
  static const TextStyle label = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColor.textDark,
  );

  // لوجو Bazar. في الـ Splash
  static const TextStyle logo = TextStyle(
    color: Colors.white,
    fontSize: 36,
    fontWeight: FontWeight.bold,
  );

  // روابط زي Skip و Sign in
  static const TextStyle link = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: AppColor.primary,
  );
}
