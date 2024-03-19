import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:i_am/utils/theme.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          color: CustomColors.lightColor,
        ),
        SafeArea(
          child: Container(
            margin: const EdgeInsets.only(bottom: 10.0),
            child: FloatingActionButton.extended(
              onPressed: () {},
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(60.0),
              ),
              backgroundColor: CustomColors.primaryColor,
              foregroundColor: CustomColors.lightColor,
              extendedTextStyle: CustomTextStyles.light.copyWith(
                fontWeight: FontWeight.w700,
                fontSize: 16.0,
              ),
              icon: Icon(
                CupertinoIcons.exclamationmark_triangle,
              ),
              label: Text('Emergency'),
            ),
          ),
        )
      ],
    );
  }
}
