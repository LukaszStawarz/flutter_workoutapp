import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gymapp/models/plans.dart';
import 'package:gymapp/models/subplan.dart';
import 'package:gymapp/screens/plans_screens/plan_details.dart';

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
              ...plan.subplan.map(
                (subplan) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: WorkoutPlanWidget(
                      subplan: subplan,
                      planId: plan.id,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class WorkoutPlanWidget extends StatelessWidget {
  const WorkoutPlanWidget({
    super.key,
    required this.subplan,
    required this.planId,
  });

  final SubPlan subplan;
  final String planId;

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
        image: DecorationImage(
            image: NetworkImage(subplan.image), fit: BoxFit.cover),
      ),
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => PlanDetailsScreen(
                subplan: subplan,
                planId: planId,
              ),
            ),
          );
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              subplan.planTitle,
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
