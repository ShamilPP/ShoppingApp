import 'package:eommerce_app/constants/app_colors.dart';
import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onPressed;
  final LinearGradient? gradient;
  final double? height, width;
  final double radius;

  const GradientButton({
    super.key,
    required this.child,
    required this.onPressed,
    this.gradient = AppColors.greenGradient,
    this.height,
    this.width,
    this.radius = 10,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Ink(
        width: width,
        height: height,
        decoration: BoxDecoration(gradient: gradient, borderRadius: BorderRadius.circular(radius)),
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(radius),
          child: child,
        ),
      ),
    );
  }
}
