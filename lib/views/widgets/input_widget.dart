import 'package:flutter/material.dart';
import 'package:ui_login_register/constants.dart';

class InputWidget extends StatelessWidget {
  final TextEditingController controller;
  final String placeholder;
  final IconData icon;
  final String error_validate;
  const InputWidget(
      {super.key,
      required this.placeholder,
      required this.controller,
      required this.error_validate, required this.icon});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return error_validate;
        }
        return null;
      },
      controller: controller,
      decoration: InputDecoration(
          prefixIcon:  Icon(icon),
          labelText: placeholder,
          fillColor: Constants.input_color,
          filled: true,
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              borderSide: BorderSide.none)),
    );
  }
}
