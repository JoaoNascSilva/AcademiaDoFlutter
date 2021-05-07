import 'package:flutter/material.dart';

class TextFormFieldComponent extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final Icon icon;
  final bool obscureText;
  final Function(String value) validate;

  const TextFormFieldComponent({
    Key key,
    this.controller,
    this.hint,
    this.icon,
    this.obscureText = false,
    this.validate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: this.controller,
      textAlignVertical: TextAlignVertical.bottom,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: this.hint,
        border: OutlineInputBorder(),
        prefixIcon: this.icon,
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red[800],
          ),
        ),
      ),
      validator: validate,
    );
  }
}
