import 'package:flutter/material.dart';
import 'package:gymapp/models/plans.dart';

class SelectedPlanScreen extends StatelessWidget {
  const SelectedPlanScreen({super.key, required this.plan});
  final Plan plan;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Text(
        'Jakiś plan',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
