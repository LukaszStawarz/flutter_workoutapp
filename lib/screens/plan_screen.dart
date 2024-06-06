import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:google_fonts/google_fonts.dart';

class PlanScreen extends StatelessWidget {
  const PlanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
        child: Column(
      children: [
        SizedBox(
          height: 20,
        ),
        CategoryWidget(
          onclick: () {},
          name: 'Strength',
          imagePath: 'assets/images/category_str.png',
        ),
      ],
    ));
  }
}

class CategoryWidget extends StatelessWidget {
  CategoryWidget(
      {super.key,
      required this.onclick,
      required this.imagePath,
      required this.name});

  final Function() onclick;
  final String imagePath;
  final String name;
  final List<Color> gradientColors = [
    const Color(0xff5328D4),
    const Color(0xff7632D0)
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20),
      width: 370,
      height: 80,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(colors: gradientColors)),
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          onclick.call();
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              name,
              style: GoogleFonts.poppins(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 30,
              ),
              textAlign: TextAlign.center,
            ),
            Image.asset(
              imagePath,
              height: 40,
              width: 40,
            ),
          ],
        ),
      ),
    );
  }
}
