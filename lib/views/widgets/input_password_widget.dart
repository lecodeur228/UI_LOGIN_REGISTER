import 'package:flutter/material.dart';
import 'package:ui_login_register/constants.dart';

class InputPasswordWidget extends StatefulWidget {
  final TextEditingController controller;
  bool isVisible = false;
  final String error_validate;
  
  InputPasswordWidget(
      {super.key,
      required this.controller,
      isVisible,
      required this.error_validate});

  @override
  State<InputPasswordWidget> createState() => _InputPasswordWidgetState();
}

class _InputPasswordWidgetState extends State<InputPasswordWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return widget.error_validate;
        }
        return null;
      },
      controller: widget.controller,
      decoration: InputDecoration(
          prefixIcon: const Icon(Icons.lock_outline),
          suffixIcon: InkWell(
            onTap: () {
              setState(() {
                widget.isVisible = !widget.isVisible;
              });
            },
            child: Icon(widget.isVisible
                ? Icons.remove_red_eye_outlined
                : Icons.visibility_off),
          ),
          labelText: "Password",
          fillColor: Constants.input_color,
          filled: true,
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              borderSide: BorderSide.none)),
    );
  }
}
