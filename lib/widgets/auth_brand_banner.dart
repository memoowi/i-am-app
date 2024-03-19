import 'package:flutter/material.dart';
import 'package:i_am/utils/theme.dart';

class AuthBrandBanner extends StatelessWidget {
  final bool isLoginScreen;
  const AuthBrandBanner({
    super.key,
    this.isLoginScreen = true,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      textDirection: isLoginScreen ? TextDirection.ltr : TextDirection.rtl,
      children: [
        Image.asset(
          'assets/logo.png',
          scale: 0.8,
        ),
        const SizedBox(width: 20.0),
        Expanded(
          child: Column(
            crossAxisAlignment: isLoginScreen
                ? CrossAxisAlignment.start
                : CrossAxisAlignment.end,
            children: [
              Text(
                'I-Am',
                style: CustomTextStyles.secondaryMadimi.copyWith(
                  fontSize: 36.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                isLoginScreen
                    ? 'Your Free Lifeline in Emergencies.'
                    : 'Free Help.\nFast Response.',
                style: CustomTextStyles.dark.copyWith(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: isLoginScreen ? TextAlign.start : TextAlign.end,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
