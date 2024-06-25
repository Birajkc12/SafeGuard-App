import 'package:flutter/material.dart';
import 'package:safeguard_app/common/color_extension.dart';
import 'package:safeguard_app/common_widget/mobile_number_field.dart';
import 'package:safeguard_app/common_widget/password_field.dart';
import 'package:safeguard_app/common_widget/round_button.dart';
import 'package:safeguard_app/view/login/login_view.dart';
import '../../common_widget/round_textfield.dart';

class SignUpView extends StatefulWidget {
  // ignore: use_key_in_widget_constructors
  const SignUpView({Key? key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  TextEditingController txtName = TextEditingController();
  final TextEditingController _mobileNumberController = TextEditingController();
  TextEditingController txtAddress = TextEditingController();
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  TextEditingController txtConfirmPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 64,
              ),
              Text(
                "Sign Up",
                style: TextStyle(
                    color: TColor.primaryText,
                    fontSize: 30,
                    fontWeight: FontWeight.w800),
              ),
              Text(
                "Add your details to sign up",
                style: TextStyle(
                    color: TColor.secondaryText,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 25,
              ),
              RoundTextfield(
                hintText: "Name",
                controller: txtName,
              ),
              const SizedBox(
                height: 25,
              ),
              RoundTextfield(
                hintText: "Email",
                controller: txtEmail,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 25,
              ),
              MobileNumberTextField(
                hintText: "Mobile Number",
                controller: _mobileNumberController,
              ),
              const SizedBox(
                height: 25,
              ),
              RoundTextfield(
                hintText: "Address",
                controller: txtAddress,
              ),
              const SizedBox(
                height: 25,
              ),
              PasswordField(
                hintText: "Password",
                controller: txtPassword,
                obscureText: true,
                minLength: 6, // Minimum password length
              ),
              const SizedBox(
                height: 25,
              ),
              PasswordField(
                hintText: "Confirm Password",
                controller: txtConfirmPassword,
                obscureText: true,
                minLength: 6, // Minimum password length
              ),
              const SizedBox(
                height: 25,
              ),
              RoundButton(
                  title: "Sign Up",
                  onPressed: () {
                    btnSignUp();
                  }),
              const SizedBox(
                height: 30,
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginView(),
                    ),
                  );
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Already have an Account? ",
                      style: TextStyle(
                          color: TColor.secondaryText,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "Login",
                      style: TextStyle(
                          color: TColor.primary,
                          fontSize: 14,
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void btnSignUp() {
    // if (txtName.text.isEmpty) {
    //   mdShowAlert(Globs.appName, MSG.enterName, () {});
    //   return;
    // }

    // if (!txtName.text.isName) {
    //   mdShowAlert(Globs.appName, MSG.validName, () {});
    //   return;
    // }

    // if (txtEmail.text.isEmpty) {
    //   mdShowAlert(Globs.appName, MSG.emptyEmail, () {});
    //   return;
    // }

    // if (!txtEmail.text.isEmail) {
    //   mdShowAlert(Globs.appName, MSG.enterEmail, () {});
    //   return;
    // }

    // if (_mobileNumberController.text.isEmpty) {
    //   mdShowAlert(Globs.appName, MSG.enterMobile, () {});
    //   return;
    // }
    // //todo: validate mobile number  for australia

    // if (txtAddress.text.isEmpty) {
    //   mdShowAlert(Globs.appName, MSG.enterAddress, () {});
    //   return;
    // }

    // if (!txtAddress.text.isAddress) {
    //   mdShowAlert(Globs.appName, MSG.validAddress, () {});
    //   return;
    // }

    // if (txtPassword.text.isEmpty) {
    //   mdShowAlert(Globs.appName, MSG.emptyPassword, () {});
    //   return;
    // }

    // if (txtPassword.text.length < 6) {
    //   mdShowAlert(Globs.appName, MSG.enterPassword, () {});
    //   return;
    // }

    // if (txtPassword.text != txtConfirmPassword.text) {
    //   mdShowAlert(Globs.appName, MSG.enterPasswordNotMatch, () {});
    //   return;
    // }

    // endEditing();

    // serviceCallSignUp({
    //   "name": txtName.text,
    //   "mobile": _mobileNumberController.text,
    //   "email": txtEmail.text,
    //   "address": txtAddress.text,
    //   "password": txtPassword.text,
    //   "push_token": "",
    //   "userType": "user",
    //   // "device_type": Platform.isAndroid ? "A" : "I"
    // });
  }

  void serviceCallSignUp(Map<String, dynamic> parameter) {
    // LoadingUtils.showHUD(context);

    // ServiceCall.post(parameter, SVKey.svSignUp,
    //     withSuccess: (responseObj) async {
    //   LoadingUtils.hideHUD();
    //   if (responseObj[KKey.status] == "1") {
    //     Navigator.push(
    //         context,
    //         MaterialPageRoute(
    //             builder: (context) =>
    //                 AfterSignUpOTPView(email: txtEmail.text)));
    //   } else {
    //     mdShowAlert(Globs.appName,
    //         responseObj[KKey.message] as String? ?? MSG.fail, () {});
    //   }
    // }, failure: (err) async {
    //   LoadingUtils.hideHUD();
    //   mdShowAlert(Globs.appName, err.toString(), () {});
    // });
  }

  void endEditing() {
    // Close keyboard
    FocusScope.of(context).unfocus();
  }
}
