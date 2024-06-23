import 'package:flutter/material.dart';
import 'package:gymapp/models/plans.dart';
import 'package:gymapp/providers/plans_provider.dart';
import 'package:gymapp/screens/selected_plan_screen.dart';
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
      body: GridView(
        padding: const EdgeInsets.all(15),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          childAspectRatio: 5,
          mainAxisSpacing: 15,
        ),
        children: [
          ...planList.map((plan) => PlanWidget(
                onSelectPlan: () {
                  _selectPlan(context, plan);
                },
                plan: plan,
              )),
        ],
      ),
    );
  }
}
