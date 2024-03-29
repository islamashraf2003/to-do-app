import 'package:flutter/material.dart';

class customElevetedButton extends StatelessWidget {
  VoidCallback? onPressed;

  Color? backgroundColor;
  Color? foregroundColor;
  Color? color;
  customElevetedButton(
      {this.onPressed,
      required this.textName,
      this.backgroundColor,
      this.foregroundColor,
      this.color});
  String? textName;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          fixedSize: const Size(450, 50),
          backgroundColor: backgroundColor,
          elevation: 0.0,
          foregroundColor: foregroundColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          side: const BorderSide(color: Color.fromARGB(255, 6, 70, 180)),
        ),
        onPressed: onPressed,
        child: Text(
          '$textName',
          style: TextStyle(
            color: color,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
