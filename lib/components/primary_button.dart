import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final Size size;
  VoidCallback onPressed;

  PrimaryButton({super.key, required this.text, required this.size, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black54,
        elevation: 2,
        fixedSize: size,
      ),
      child: Text(text),
    );
  }
}
