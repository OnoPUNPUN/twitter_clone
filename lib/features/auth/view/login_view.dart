import 'package:flutter/material.dart';
import 'package:twitter_clone/constants/ui_constants.dart';
import 'package:twitter_clone/features/auth/widgets/auth_field.dart';
import 'package:twitter_clone/theme/pallete.dart';

import '../../../common/rounded_small_button.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  final appBar = UiConstants.appBar();

  @override
  void dispose() {
    super.dispose();
    _emailTEController.dispose();
    _passwordTEController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                // TextField 1
                AuthField(
                  controller: _emailTEController,
                  hintText: "Email",
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 25),
                // TestField 2
                AuthField(
                  controller: _passwordTEController,
                  hintText: "Password",
                  textInputAction: TextInputAction.done,
                ),
                const SizedBox(height: 40),
                // button
                RoundedSmallButton(
                  onTap: () {},
                  label: 'Done',
                ),
                // TextPan
              ],
            ),
          ),
        ),
      ),
    );
  }
}
