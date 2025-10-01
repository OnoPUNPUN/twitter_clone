import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone/features/auth/controller/auth_controller.dart';
import 'package:twitter_clone/features/auth/view/login_view.dart';

import '../../../common/rounded_small_button.dart';
import '../../../constants/constants.dart';
import '../../../theme/pallete.dart';
import '../widgets/auth_field.dart';

class SignupView extends ConsumerStatefulWidget {
  const SignupView({super.key});

  static const String name = '/signUp-view';

  @override
  ConsumerState<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends ConsumerState<SignupView> {
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  final appBar = UiConstants.appBar();

  @override
  void dispose() {
    super.dispose();
    _emailTEController.dispose();
    _passwordTEController.dispose();
  }

  void onSignUp() {
    ref
        .read(authControllerProvider.notifier)
        .signUp(
          email: _emailTEController.text,
          password: _passwordTEController.text,
          context: context,
        );
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
                Align(
                  alignment: Alignment.topRight,
                  child: RoundedSmallButton(onTap: onSignUp, label: 'Done'),
                ),
                const SizedBox(height: 40),
                // TextPan
                RichText(
                  text: TextSpan(
                    text: "Already Have Account?",
                    style: TextStyle(fontSize: 16),
                    children: [
                      TextSpan(
                        text: " Log In",
                        style: TextStyle(
                          color: Pallete.blueColor,
                          fontSize: 16,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pushReplacementNamed(
                              context,
                              LoginView.name,
                            );
                          },
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
