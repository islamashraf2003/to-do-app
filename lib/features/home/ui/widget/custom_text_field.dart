import 'package:flutter/material.dart';

class CutomTextFormFiled extends StatelessWidget {
  String? hintText;
  int? maxLines;
  void Function(String)? onChanged;
  void Function(String?)? onSaved;
  String? initialValue;
  CutomTextFormFiled(
      {this.hintText,
      this.onSaved,
      this.maxLines,
      this.onChanged,
      this.initialValue});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        validator: (value) {
          if (value?.isEmpty ?? true) {
            return 'Field is Required';
          } else {
            return null;
          }
        },
        initialValue: initialValue,
        maxLines: maxLines,
        onSaved: onSaved,
        onChanged: onChanged,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey[200],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide.none,
          ),
          hintText: hintText,
        ),
      ),
    );
  }
}
