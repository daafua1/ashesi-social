// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../utils/text_styles.dart';

// This is a form widget which is used for showing textfield in the app
class FormWidget extends StatefulWidget {
  // A controller for an editable text field.
  TextEditingController controller;
  // A label text for the textfield
  final String lableText;
  // A style for the error text
  final TextStyle? errorStyle;
  // A validator for the textfield
  final Function(String)? validator;
  // Whether the text field is enabled
  final bool? enabled;
  // A hint text for the textfield
  final String? hintText;
  // A textstyle for the textfield
  final TextStyle? textStyle;
  FormWidget(
      {required this.controller,
      required this.lableText,
      this.enabled,
      this.hintText,
      this.textStyle,
      this.errorStyle,
      this.validator,
      super.key});

  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: widget.enabled ?? true,
      onChanged: (val) {
        setState(() {
          widget.controller.text = val;
          widget.controller.selection =
              TextSelection.collapsed(offset: widget.controller.text.length);
        });
      },
      controller: widget.controller,
      textAlign: TextAlign.start,
      maxLines: 1,
     validator: widget.validator as dynamic,
      style:widget.textStyle ??  TextStyles.body,
      decoration: InputDecoration(
        errorText: widget.validator == null
          ? null
          : widget.validator!(widget.controller.text),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.0),
          borderSide: const BorderSide(color: Color(0xff9e9e9e), width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.0),
          borderSide: const BorderSide(color: Color(0xff9e9e9e), width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.0),
          borderSide: const BorderSide(color: Color(0xff9e9e9e), width: 1),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.0),
          borderSide: const BorderSide(color: Colors.red, width: 1),
        ),
         focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.0),
          borderSide: const BorderSide(color: Colors.red, width: 1),
        ),
        labelText: widget.lableText,
        hintText: widget.hintText,
        hintStyle: const TextStyle(
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
          fontSize: 14,
          color: Color(0xff9e9e9e),
        ),
        labelStyle: const TextStyle(
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
          fontSize: 16,
          color: Color(0xff9e9e9e),
        ),
        errorStyle:widget.errorStyle ?? const TextStyle(
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
          fontSize: 12,
          color: Color(0xff9e9e9e),
        ) ,
        filled: true,
        fillColor: const Color(0x00ffffff),
        isDense: false,
        contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      ),
    );
  }
}

