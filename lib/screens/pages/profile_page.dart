import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_am/bloc/auth_bloc.dart';
import 'package:i_am/utils/theme.dart';
import 'package:i_am/widgets/custom_filled_button.dart';
import 'package:i_am/widgets/custom_outline_button.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    void logout() {
      context.read<AuthBloc>().add(Signout(context: context));
    }

    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is UnauthenticatedState) {
          Navigator.pushNamedAndRemoveUntil(
            context,
            '/login',
            (route) => false,
          );
        }
      },
      builder: (context, state) {
        final user = state is AuthenticatedState ? state.user : null;
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
                    foregroundImage: AssetImage('assets/profile-2.png'),
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
                        user?.name ?? 'Loading...',
                        style: CustomTextStyles.secondaryMadimi.copyWith(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: 6),
                      Text(
                        '(${user?.phoneNumber})',
                        style: CustomTextStyles.grey.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 6),
                      Text(
                        user?.email ?? 'Loading...',
                        style: CustomTextStyles.dark.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      Spacer(),
                      CustomOutlineButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              title: Text('Are you sure you want to logout?'),
                              titleTextStyle:
                                  CustomTextStyles.darkMadimi.copyWith(
                                fontSize: 20,
                              ),
                              actions: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: CustomOutlineButton(
                                        text: 'Cancel',
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Expanded(
                                      child: CustomFilledButton(
                                        text: 'Yes',
                                        onPressed: (state is AuthLoadingState)
                                            ? null
                                            : logout,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          );
                        },
                        text: 'Logout',
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
