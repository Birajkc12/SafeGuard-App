import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:safeguard_app/common/color_extension.dart';

typedef NotesCallback = void Function(String notes);
String notes = '';

extension StateExtension on State {
  void mdShowAlert(String title, String message, VoidCallback onPressed,
      {String buttonTitle = "Ok",
      TextAlign messageTextAlign = TextAlign.center}) {
    showDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: Text(
          title,
          style: TextStyle(color: TColor.primaryText),
        ),
        content: Text(
          message,
          style:
              TextStyle(color: TColor.primaryText, fontWeight: FontWeight.w500),
          textAlign: messageTextAlign,
        ),
        actions: [
          CupertinoDialogAction(
            isDefaultAction: true,
            child: Text(buttonTitle,
                style: TextStyle(
                    color: TColor.primary,
                    fontSize: 16,
                    fontWeight: FontWeight.w600)),
            onPressed: () {
              Navigator.pop(context);
              onPressed();
            },
          )
        ],
      ),
    );
  }

  void endEditing() {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  void mdshowIosDialog(BuildContext context, NotesCallback callback, title,
      subTitle, titleSuccess) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        FocusScope.of(context).requestFocus(FocusNode());
        return CupertinoAlertDialog(
          title: Text(title),
          content: Padding(
            padding: const EdgeInsets.all(8),
            child: CupertinoTextField(
              cursorColor: TColor.primary,
              decoration: BoxDecoration(
                color: CupertinoColors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.all(10),
              onChanged: (value) {
                callback(value);
              },
              placeholder: subTitle,
            ),
          ),
          actions: <Widget>[
            // CupertinoDialogAction(
            //   child: Text(titleFail,
            //       style: TextStyle(
            //           color: TColor.primary, fontWeight: FontWeight.w400)),
            //   onPressed: () {
            //     Navigator.of(context).pop();
            //   },
            // ),
            CupertinoDialogAction(
              child: Text(titleSuccess,
                  style: TextStyle(
                      color: TColor.primary, fontWeight: FontWeight.w400)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

extension StringExtension on String {
  bool get isEmail {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(this);
  }

  bool get isName {
    return RegExp(r'^[a-zA-Z]+$').hasMatch(this);
  }

  bool get isAddress {
    return RegExp(r'^[a-zA-Z]+$').hasMatch(this);
  }
}
