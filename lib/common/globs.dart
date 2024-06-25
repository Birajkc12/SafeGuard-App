// import 'dart:convert';
// import 'package:flutter/services.dart';
// // import 'package:flutter_timezone/flutter_timezone.dart';
// import 'package:safeguard_app/main.dart';

// class Globs {
//   static const appName = "SafeGuard";

//   static const userPayload = "user_payload";
//   static const userLogin = "user_login";

//   static void udSet(dynamic data, String key) {
//     var jsonStr = json.encode(data);
//     prefs?.setString(key, jsonStr);
//   }

//   static void udStringSet(String data, String key) {
//     prefs?.setString(key, data);
//   }

//   static void udBoolSet(bool data, String key) {
//     prefs?.setBool(key, data);
//   }

//   static void udIntSet(int data, String key) {
//     prefs?.setInt(key, data);
//   }

//   static void udDoubleSet(double data, String key) {
//     prefs?.setDouble(key, data);
//   }

//   static dynamic udValue(String key) {
//     // return json.decode(prefs?.get(key) as String? ?? "{}");
//     var value = json.decode(prefs?.get(key) as String? ?? "{}");
//     return value;
//   }

//   static String udValueString(String key) {
//     return prefs?.get(key) as String? ?? "";
//   }

//   static bool udValueBool(String key) {
//     return prefs?.get(key) as bool? ?? false;
//   }

//   static bool udValueTrueBool(String key) {
//     return prefs?.get(key) as bool? ?? true;
//   }

//   static int udValueInt(String key) {
//     return prefs?.get(key) as int? ?? 0;
//   }

//   static double udValueDouble(String key) {
//     return prefs?.get(key) as double? ?? 0.0;
//   }

//   static void udRemove(String key) {
//     prefs?.remove(key);
//   }

//   static Future<String> timeZone() async {
//     try {
//       return await FlutterTimezone.getLocalTimezone();
//     } on PlatformException {
//       return "";
//     }
//   }
// }

// class SVKey {
//   // static const mainUrl = "http://192.168.0.103:3000";
//   // static const mainUrl = "http://192.168.1.191:3000";
//   // static const mainUrl = "http://193.203.161.79:3535";
//   static const mainUrl = 'http://localhost:3000';
//   static const baseUrl = '$mainUrl/api/';
//   static const nodeUrl = mainUrl;

//   static const svLogin = '${baseUrl}auth/login';
//   static const svSignUp = '${baseUrl}auth/signup';
//   static const svForgotPasswordRequest = '${baseUrl}auth/userforgotpassword';
//   static const svForgotPasswordVerify =
//       '${baseUrl}auth/userforgotpasswordverify';
//   static const svForgotPasswordSetNew = '${baseUrl}auth/userresetpassword';
//   static const svVerifyEmailRequest = '${baseUrl}auth/userverifyemailotp';
//   static const svVerifyEmail = '${baseUrl}auth/verifyuser';
//   static const svChangePassword = '${baseUrl}auth/userchangepassword';
//   static const svChangeMobile = '${baseUrl}auth/userchangemobile';
//   static const svUpdateProfile = '${baseUrl}auth/updateprofile';
//   static const svToggleFavourite = '${baseUrl}item/togglefavourite';
//   static const svAddToCart = '${baseUrl}item/cart/addupdate';
//   static const svRemoveFromCart = '${baseUrl}item/cart/remove';
//   static const svSendOrder = '${baseUrl}item/order';
//   static const svSendReviews = '${baseUrl}ratings';
//   static const svMyNotifications = '${baseUrl}notifications/getUnseenCount';
//   static const svUpdateDeviceToken = '${baseUrl}auth/userdevicetoken';
// }

// class KKey {
//   static const payload = "payload";
//   static const status = "status";
//   static const message = "message";
//   static const authToken = "auth_token";
//   static const name = "name";
//   static const email = "email";
//   static const mobile = "mobile";
//   static const address = "address";
//   static const userType = "userType";
//   static const userId = "user_id";
//   static const resetCode = "";
//   static const emailVerifyCode = "";
//   static const forgotPasswordToken = "forgotPasswordToken";
//   static const orderId = "orderId";

//   // static const  = "";
// }

// class MSG {
//   static const enterEmail = "Please enter your valid email address";
//   static const emptyEmail = "Email is required";
//   static const enterName = "Name is required";
//   static const validName = "Enter a valid name";
//   static const enterCode = "Please enter valid reset code";
//   static const enterMobile = "Please enter your valid mobile number";
//   static const enterAddress = "Address is required";
//   static const validAddress = "Enter valid address";
//   static const enterPassword = "Password must be at least 6 characters";
//   static const emptyPassword = "Password is required";
//   static const enterPasswordNotMatch = "Password do not match";
//   static const emptyCode = "OTP is required";
//   static const success = "success";
//   static const fail = "fail";
// }
