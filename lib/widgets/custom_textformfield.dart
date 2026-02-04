import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final FormFieldValidator validator;
  final String? hint;
  final bool? obscureText;
  const CustomTextFormField(
      {super.key,
      required this.controller,
      required this.label,
      required this.validator,
      this.hint,
      this.obscureText});

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 6, bottom: 16),
        child: TextFormField(
          obscureText: widget.obscureText ?? false,
          decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              errorStyle: const TextStyle(fontSize: 12, height: 0.2),
              labelText: widget.label,
              floatingLabelBehavior: FloatingLabelBehavior.always,
              labelStyle: const TextStyle(
                color: Colors.black,
                fontSize: 24,
              ),
              hintText: widget.hint ?? "",
              border: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black,
                  width: 1.0,
                ),
              )),
          controller: widget.controller,
          validator: widget.validator
        ));
  }
}
