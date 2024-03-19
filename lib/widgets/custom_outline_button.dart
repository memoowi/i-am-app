import 'package:flutter/material.dart';
import 'package:i_am/utils/theme.dart';

class CustomOutlineButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  const CustomOutlineButton({
    super.key,
    this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        foregroundColor: CustomColors.secondaryColor,
        disabledBackgroundColor: CustomColors.lightColor,
        disabledForegroundColor: CustomColors.secondaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
          side:
              BorderSide(color: CustomColors.secondaryColor),
        ),
        minimumSize: const Size.fromHeight(50.0),
        elevation: 0.0,
      ),
      child: Text(
        text,
        style: CustomTextStyles.secondary.copyWith(
          fontSize: 18.0,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}