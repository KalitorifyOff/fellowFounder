import 'package:ecommerce_app_login/constants/resources.dart';
import 'package:flutter/material.dart';

class AppStyles {
  AppStyles._();

  static List<BoxShadow>? boxShadow;
  static LinearGradient? linearGradient;

  static void init() {
    boxShadow = [
      const BoxShadow(
        blurRadius: 4,
        offset: Offset(0, 2),
        color: Color.fromARGB(90, 117, 119, 121),
      ),
    ];

    linearGradient = const LinearGradient(
      colors: [AppColors.gradientColor1, AppColors.gradientColor2],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );
  }
}
