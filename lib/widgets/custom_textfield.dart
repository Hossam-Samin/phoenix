import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  CustomTextField({
    Key? key,
     this.hintText,
    this.hintStyle,
    this.isObscureText = false,
    required this.controller,
    this.validation,
    this.prefixIcon,
    this.keyboardType,
    this.suffixIcon,
    required this.onChange,
    this.onSaved,
    this.maxLength,
    this.label,
  }) : super(key: key);
  final String? hintText;
  TextStyle? hintStyle;
  bool isObscureText;
  final TextEditingController controller;
  Function? validation;
  Widget? prefixIcon;
  Widget? suffixIcon;
  TextInputType? keyboardType;
  Function onChange;
  Function? onSaved;
 final int? maxLength;
  Widget? label;
  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: widget.isObscureText,
      validator: (value) => widget.validation!(value),
      onSaved: (value) => widget.onSaved!(value),
      onChanged: (value) => widget.onChange(value),
      keyboardType: widget.keyboardType,
      maxLength: widget.maxLength,
      decoration: InputDecoration(
          alignLabelWithHint: true,
          hintText: widget.hintText,
          hintStyle: const TextStyle(fontFamily: "Rubik", fontSize: 14),
          label:  widget.label,
          enabledBorder:  OutlineInputBorder(
            borderSide:   BorderSide(color: Colors.grey.withOpacity(.3)),
              borderRadius: BorderRadius.circular(16)
          ),
          prefixIcon: widget.prefixIcon,
          suffixIcon: widget.suffixIcon,
          contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          border: OutlineInputBorder(
            // borderSide: BorderSide.none,
            borderSide: const BorderSide(color: Colors.indigo),
              borderRadius: BorderRadius.circular(16))),
    );
  }
}