import 'package:flutter/material.dart';

class CustomColors {
  static const Color primaryColor = Color(0xFFE50914);
  static const Color secondaryColor = Color(0xFFB81D24);
  static const Color darkColor = Color(0xFF221F1F);
  static const Color lightColor = Color(0xFFF5F5F1);
  static const Color greyColor = Color(0xFF9B9B9B);
}

class CustomTextStyles {
  static const TextStyle dark = TextStyle(
    color: CustomColors.darkColor,
  );

  static const TextStyle light = TextStyle(
    color: CustomColors.lightColor,
  );

  static const TextStyle grey = TextStyle(
    color: CustomColors.greyColor,
  );

  static const TextStyle primary = TextStyle(
    color: CustomColors.primaryColor,
  );

  static const TextStyle secondary = TextStyle(
    color: CustomColors.secondaryColor,
  );

  static const TextStyle darkMadimi = TextStyle(
    color: CustomColors.darkColor,
    fontFamily: 'Madimi One',
  );

  static const TextStyle lightMadimi = TextStyle(
    color: CustomColors.lightColor,
    fontFamily: 'Madimi One',
  );

  static const TextStyle greyMadimi = TextStyle(
    color: CustomColors.greyColor,
    fontFamily: 'Madimi One',
  );

  static const TextStyle primaryMadimi = TextStyle(
    color: CustomColors.primaryColor,
    fontFamily: 'Madimi One',
  );

  static const TextStyle secondaryMadimi = TextStyle(
    color: CustomColors.secondaryColor,
    fontFamily: 'Madimi One',
  );
}
