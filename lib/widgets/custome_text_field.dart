import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    this.maxLines = 1,
    this.onSaved,
    this.onChanged,
    this.initialValue,
  });
  final String hintText;
  final int maxLines;
  final void Function(String?)? onSaved;
  final void Function(String)? onChanged;
  final String? initialValue;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      onChanged: onChanged,
      onSaved: onSaved,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'Field is required';
        } else {
          return null;
        }
      },
      textInputAction: TextInputAction.done,
      cursorColor: Colors.lightBlue,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hintText,
        enabledBorder: styleBorder(color: Colors.white),
        focusedBorder: styleBorder(),
        errorBorder: styleBorder(color: Colors.redAccent),
        focusedErrorBorder: styleBorder(color: Colors.redAccent),
      ),
    );
  }

  OutlineInputBorder styleBorder({color}) {
    return OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(8)),
      borderSide: BorderSide(color: color ?? Colors.lightBlue),
    );
  }
}
