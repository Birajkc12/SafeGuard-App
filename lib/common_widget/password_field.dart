import 'package:flutter/material.dart';
import '../common/color_extension.dart';

class PasswordField extends StatefulWidget {
  final TextEditingController? controller;
  final String hintText;
  final Color? bgColor;
  final Widget? left;
  final bool obscureText; // Add the obscureText parameter
  final int minLength; // Add the minLength parameter

  const PasswordField({
    super.key,
    required this.hintText,
    this.controller,
    this.bgColor,
    this.left,
    this.obscureText = true,
    required this.minLength, // Set default value to true
  });

  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText =
        widget.obscureText; // Initialize _obscureText with widget value
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: widget.bgColor ?? TColor.textfield,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        children: [
          if (widget.left != null)
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: widget.left!,
            ),
          Expanded(
            child: TextField(
              cursorColor: TColor.primary,
              autocorrect: false,
              controller: widget.controller,
              obscureText: _obscureText,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.fromLTRB(
                    20, 12, 50, 14), // Adjust top and bottom padding
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                hintText: widget.hintText,
                hintStyle: TextStyle(
                  color: TColor.placeholder,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility_off : Icons.visibility,
                    color: TColor.primaryText,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                ),
              ),
              onChanged: (value) {
                if (value.length < widget.minLength) {
                  // If password length is less than minLength, show error
                  // You can add your error handling logic here
                  // ignore: avoid_print
                  print(
                      'Password must be at least ${widget.minLength} characters long.');
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
