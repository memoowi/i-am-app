import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:i_am/utils/theme.dart';
import 'package:i_am/widgets/custom_outline_button.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Column(
              children: [
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.25,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.white,
                        CustomColors.primaryColor,
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(100),
                        bottomRight: Radius.circular(100)),
                  ),
                ),
                SizedBox(height: 64),
              ],
            ),
            CircleAvatar(
              radius: 64,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: 60,
                backgroundColor: CustomColors.lightColor,
                foregroundImage: AssetImage('assets/profile.jpg'),
              ),
            ),
          ],
        ),
        Expanded(
          child: SafeArea(
            child: Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 32, vertical: 10),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              decoration: BoxDecoration(
                color: CustomColors.lightColor,
                borderRadius: BorderRadius.all(Radius.circular(16)),
                boxShadow: [
                  BoxShadow(
                    color: CustomColors.darkColor.withOpacity(0.2),
                    blurRadius: 20.0,
                    offset: Offset(0, 10.0),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Text(
                    'John Doe',
                    style: CustomTextStyles.secondaryMadimi.copyWith(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    '(0888-8888-8888)',
                    style: CustomTextStyles.grey.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    'john.doe@me.com',
                    style: CustomTextStyles.dark.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  Spacer(),
                  CustomOutlineButton(
                    onPressed: () {},
                    text: 'Logout',
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
