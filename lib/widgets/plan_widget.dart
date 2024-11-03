import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gymapp/models/plans.dart';

class PlanWidget extends StatelessWidget {
  PlanWidget({
    super.key,
    required this.onSelectPlan,
    required this.plan,
  });

  final Plan plan;
  final void Function() onSelectPlan;
  // final String imagePath;

  final List<Color> gradientColors = [
    const Color(0xff5328D4),
    const Color(0xff7632D0)
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20),
      width: 370,
      height: 80,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(colors: gradientColors)),
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          onSelectPlan.call();
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              plan.title,
              style: GoogleFonts.poppins(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 30,
              ),
              textAlign: TextAlign.center,
            ),
            Flexible(
              child: Image.network(
                plan.dashboardImageUrl,
                height: 30,
                width: 40,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
