import 'package:flutter/material.dart';
import 'package:safeguard_app/common/color_extension.dart';
import 'package:safeguard_app/common_widget/password_field.dart';
import 'package:safeguard_app/common_widget/round_button.dart';
import 'package:safeguard_app/common_widget/round_icon_button.dart';
import 'package:safeguard_app/common_widget/round_textfield.dart';
import 'package:safeguard_app/view/login/reset_password_view.dart';
import 'package:safeguard_app/view/login/sign_up_view.dart';
import 'package:safeguard_app/view/main_tabview/main_tabview.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 64),
                Text(
                  "Login",
                  style: TextStyle(
                    color: TColor.primaryText,
                    fontSize: 30,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "Add your details to login",
                  style: TextStyle(
                    color: TColor.secondaryText,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 25),
                RoundTextfield(
                  hintText: "Your Email",
                  controller: txtEmail,
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 25),
                PasswordField(
                  hintText: "Password",
                  controller: txtPassword,
                  minLength: 6,
                ),
                const SizedBox(height: 25),
                RoundButton(
                  title: "Login",
                  onPressed: () {
                    btnLogin();
                  },
                ),
                const SizedBox(height: 10),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ResetPasswordView(),
                      ),
                    );
                  },
                  child: Text(
                    "Forgot your password?",
                    style: TextStyle(
                      color: TColor.secondaryText,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "or Login With",
                  style: TextStyle(
                    color: TColor.secondaryText,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 30),
                RoundIconButton(
                  icon: "assets/img/facebook_logo.png",
                  title: "Login with Facebook",
                  color: const Color(0xff367FC0),
                  onPressed: () {},
                ),
                const SizedBox(height: 25),
                RoundIconButton(
                  icon: "assets/img/google_logo.png",
                  title: "Login with Google",
                  color: const Color(0xffDD4B39),
                  onPressed: () {},
                ),
                const SizedBox(height: 80),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignUpView(),
                      ),
                    );
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Don't have an Account? ",
                        style: TextStyle(
                          color: TColor.secondaryText,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        "Sign Up",
                        style: TextStyle(
                          color: TColor.primary,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
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

  void btnLogin() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => MainTabView()),
    );
    // Implement login logic
  }
}
