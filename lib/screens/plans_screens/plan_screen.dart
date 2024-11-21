import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gymapp/models/plans.dart';
import 'package:gymapp/providers/plans_provider.dart';
import 'package:gymapp/screens/plans_screens/selected_plan_screen.dart';
import 'package:gymapp/screens/plans_screens/your_plans_screen.dart';
import 'package:gymapp/widgets/plan_widget.dart';
import 'package:provider/provider.dart';

class PlanScreen extends StatelessWidget {
  const PlanScreen({super.key});

  _selectPlan(BuildContext context, Plan plan) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => SelectedPlanScreen(plan: plan),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final planProvider = context.watch<PlanProvider>();
    final List<Plan> planList = planProvider.plans;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/bg_example5.png'),
              fit: BoxFit.cover),
        ),
        child: SafeArea(
          child: GridView(
            padding: const EdgeInsets.all(15),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              childAspectRatio: 5,
              mainAxisSpacing: 15,
            ),
            children: [
              ...planList.map(
                (plan) => PlanWidget(
                  onSelectPlan: () {
                    _selectPlan(context, plan);
                  },
                  plan: plan,
                ),
              ),
              YourPlansWidget(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => YourPlansScreen(),
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

class YourPlansWidget extends StatelessWidget {
  YourPlansWidget({super.key, required this.onTap});
  void Function() onTap;
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
        onTap: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Your Plans',
              style: GoogleFonts.poppins(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 30,
              ),
              textAlign: TextAlign.center,
            ),
            const Flexible(
              child: Icon(
                Icons.add_box_outlined,
                color: Colors.black,
                size: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
