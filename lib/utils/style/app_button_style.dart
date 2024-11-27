import 'package:flutter/material.dart';

class AppButtonStyle {
  static ButtonStyle curvedStyle({Color? backgroundColor, Color? foregroundColor, double radius = 15}) {
    return ElevatedButton.styleFrom(
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
    );
  }
}
