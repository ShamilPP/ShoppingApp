import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryColor = Color(0xff4FB15E);
  static const Color lightGreen = Color(0xffD7FFEA);
  static const Color backgroundColor = Color(0xffF8F8F8);
  static const Color greyColor = Color(0xffF1F1F1);
  static const Color textColorPrimary = Color(0XFF1A1A1A);
  static const Color textColorSecondary = Color(0XFF7A7A7A);
  static const Color cartButtonColor = Color(0XFFFF6B4A);

  static const LinearGradient greenGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [Color(0xFF5FCD70), Color(0xFF0E826B)],
    stops: [0.0732, 0.974],
  );
}
