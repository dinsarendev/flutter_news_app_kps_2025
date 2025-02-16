import 'package:flutter/material.dart';

class CustomTextFieldWidget extends StatefulWidget {
  String? title;
  Icon? prefixIcon, suffixIcon;
  TextEditingController? controller;
  CustomTextFieldWidget(
      {super.key,
      this.title,
      this.prefixIcon,
      this.suffixIcon,
      this.controller});
  @override
  State<CustomTextFieldWidget> createState() => _CustomTextFieldWidgetState();
}

class _CustomTextFieldWidgetState extends State<CustomTextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: TextFormField(
        controller: widget.controller,
        decoration: InputDecoration(
            label: Text(widget.title ?? ""),
            prefixIcon: widget.prefixIcon,
            suffixIcon: widget.suffixIcon,
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: Colors.indigo)),
            border: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: Colors.indigo))),
      ),
    );
  }
}
