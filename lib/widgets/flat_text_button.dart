import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FlatTextBtn extends StatelessWidget {
  const FlatTextBtn(
      {super.key, required this.buttonText, required this.onClick});

  final String buttonText;
  final void Function() onClick;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Text(
        buttonText,
        style: GoogleFonts.poppins(
            color: const Color.fromRGBO(118, 50, 208, 1),
            fontWeight: FontWeight.bold,
            fontSize: 16),
      ),
    );
  }
}
