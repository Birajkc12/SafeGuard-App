// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../common/color_extension.dart';

class MobileNumberTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String hintText;

  const MobileNumberTextField({
    Key? key,
    this.controller,
    required this.hintText,
  }) : super(key: key);

  @override
  _MobileNumberTextFieldState createState() => _MobileNumberTextFieldState();
}

class _MobileNumberTextFieldState extends State<MobileNumberTextField> {
  late String _selectedCountry;
  final Map<String, String> _countryCodes = {
    'Australia': '+61',
    'Nepal': '+977',
  };

  final Map<String, String> _flagIcons = {
    'Australia': 'assets/img/australia.png',
    'Nepal': 'assets/img/nepal.png',
  };

  @override
  void initState() {
    super.initState();
    _selectedCountry = _countryCodes.keys.first;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: TColor.textfield,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: DropdownButton<String>(
              value: _selectedCountry,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedCountry = newValue!;
                });
              },
              items: _countryCodes.keys
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Row(
                    children: [
                      Image.asset(
                        _flagIcons[value]!,
                        width: 24,
                        height: 24,
                      ),
                      const SizedBox(width: 8),
                      Text(_countryCodes[value]!),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
          Expanded(
            child: TextField(
              cursorColor: TColor.primary,
              controller: widget.controller,
              keyboardType: TextInputType.phone,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(10),
              ],
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                hintText: widget.hintText,
                hintStyle: TextStyle(
                  color: TColor.placeholder,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
