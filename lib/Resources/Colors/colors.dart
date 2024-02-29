import 'package:flutter/material.dart';

class AppColors {
  static BoxDecoration buildGradientBoxDecoration() {
    return const BoxDecoration(
        gradient: LinearGradient(
      colors: [Color(0xFF130754), Color(0xFF3B2F80)],
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      stops: [0.0, 1.0],
      tileMode: TileMode.clamp,
    ));
  }
}
