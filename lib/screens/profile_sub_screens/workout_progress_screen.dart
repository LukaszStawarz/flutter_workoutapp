import 'package:flutter/material.dart';

class WorkoutProgressScreen extends StatelessWidget {
  const WorkoutProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 13, 14, 14),
        title: const Text(
          'Workout Progress',
          style: TextStyle(color: Color(0xffACA3A5)),
        ),
      ),
    );
  }
}
