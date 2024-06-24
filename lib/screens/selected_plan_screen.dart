import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gymapp/models/plans.dart';

class SelectedPlanScreen extends StatelessWidget {
  const SelectedPlanScreen({super.key, required this.plan});

  final Plan plan;
  @override
  Widget build(BuildContext context) {
    final String title = plan.title;

    return Scaffold(
      appBar: AppBar(
        title: Text(title, style: const TextStyle(color: Color(0xffACA3A5))),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Center(
          child: Column(
            children: [
              WorkoutPlanWidget(
                image: plan.image_easy,
                planTitle: plan.wk_plan1,
                plan: plan,
              ),
              const SizedBox(
                height: 20,
              ),
              WorkoutPlanWidget(
                image: plan.image_med,
                planTitle: plan.wk_plan2,
                plan: plan,
              ),
              const SizedBox(
                height: 20,
              ),
              WorkoutPlanWidget(
                image: plan.image_hard,
                planTitle: plan.wk_plan3,
                plan: plan,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class WorkoutPlanWidget extends StatelessWidget {
  const WorkoutPlanWidget(
      {super.key,
      required this.plan,
      required this.planTitle,
      required this.image});
  final Plan plan;
  final String planTitle;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      // Image.asset(
      //   'assets/images/plan_background_image.jpg',
      //),
      padding: const EdgeInsets.only(left: 20, right: 20),
      width: 370,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(image: NetworkImage(image), fit: BoxFit.cover),
      ),
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              planTitle,
              style: GoogleFonts.poppins(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 30,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
