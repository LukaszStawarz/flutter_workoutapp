import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonBP extends StatelessWidget {
  ButtonBP({
    super.key,
    required this.buttonText,
    required this.onClick,
    this.color,
    this.isBig = true,
  });

  final String buttonText;
  final void Function() onClick;
  final Color? color;
  final bool isBig;
  final List<Color> gradientColors = [
    const Color(0xff5328D4),
    const Color(0xff7632D0)
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        width: isBig ? double.infinity : null,
        height: 56,
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: gradientColors,
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter),
              borderRadius: BorderRadius.circular(30)),
          child: ElevatedButton(
            onPressed: onClick,
            style:
                ElevatedButton.styleFrom(backgroundColor: Colors.transparent),
            child: Text(
              buttonText,
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
//Color(0xff5428d4),