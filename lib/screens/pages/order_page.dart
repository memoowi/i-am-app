import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:i_am/utils/theme.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: CustomColors.primaryColor.withOpacity(0.2),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Emergency',
            style: CustomTextStyles.secondaryMadimi.copyWith(
              fontWeight: FontWeight.w700,
              fontSize: 30.0,
            ),
          ),
          Text(
            'Order An Ambulance',
            style: CustomTextStyles.dark.copyWith(
              fontWeight: FontWeight.w700,
              fontSize: 16.0,
            ),
          ),
          SizedBox(height: 20.0),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/maps');
            },
            style: ElevatedButton.styleFrom(
              shape: CircleBorder(),
              padding: EdgeInsets.all(6),
              elevation: 8.0,
              shadowColor: CustomColors.secondaryColor,
            ),
            child: Container(
              padding: EdgeInsets.all(48.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  tileMode: TileMode.clamp,
                  colors: [
                    CustomColors.lightColor,
                    CustomColors.primaryColor.withOpacity(0.7),
                  ],
                  radius: 0.6,
                  stops: [0.6, 1.0],
                ),
              ),
              child: Container(
                padding: EdgeInsets.all(24),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: CustomColors.primaryColor,
                ),
                child: Icon(
                  CupertinoIcons.exclamationmark_triangle,
                  size: 64,
                  color: Colors.white,
                  shadows: [
                    Shadow(
                      color: CustomColors.lightColor,
                      blurRadius: 24.0,
                    ),
                    Shadow(
                      color: CustomColors.darkColor,
                      blurRadius: 12.0,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
