import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:i_am/utils/theme.dart';
import 'package:i_am/widgets/auth_brand_banner.dart';
import 'package:i_am/widgets/custom_filled_button.dart';
import 'package:i_am/widgets/custom_form_field.dart';
import 'package:i_am/widgets/custom_outline_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _showPassword = false;
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  void toggleShowPassword() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }

  String? validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter some text';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter some text';
    }
    return null;
  }

  void login() {
    if (_formKey.currentState!.validate()) {
      // Navigator.of(context).pushNamed(
      //   '/splash',
      // );
    }
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
            child: Column(
              children: [
                AuthBrandBanner(),
                Divider(thickness: 2.0),
                const SizedBox(height: 32.0),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Text(
                        'Sign In',
                        style: CustomTextStyles.lightMadimi.copyWith(
                          fontSize: 28.0,
                          fontWeight: FontWeight.w700,
                          shadows: [
                            Shadow(
                              color: CustomColors.secondaryColor,
                              offset: const Offset(1.4, 1.4),
                              blurRadius: 20.0,
                            ),
                            Shadow(
                              color: CustomColors.primaryColor,
                              blurRadius: 10.0,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24.0),
                      CustomFormField(
                        controller: _usernameController,
                        validator: validateUsername,
                        keyboardType: TextInputType.emailAddress,
                        labelText: 'Email / Phone Number',
                        prefixIcon: CupertinoIcons.person,
                      ),
                      const SizedBox(height: 20.0),
                      CustomFormField(
                        obscureText: !_showPassword,
                        controller: _passwordController,
                        validator: validatePassword,
                        keyboardType: TextInputType.visiblePassword,
                        labelText: 'Password',
                        prefixIcon: CupertinoIcons.lock,
                        suffixIcon: IconButton(
                          onPressed: toggleShowPassword,
                          icon: Icon(
                            _showPassword
                                ? CupertinoIcons.eye_slash_fill
                                : CupertinoIcons.eye_fill,
                          ),
                        ),
                      ),
                      const SizedBox(height: 32.0),
                      CustomFilledButton(
                        onPressed: login,
                        text: 'Sign In',
                      ),
                      const SizedBox(height: 20.0),
                      CustomOutlineButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacementNamed('/signup');
                        },
                        text: 'Sign Up',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
