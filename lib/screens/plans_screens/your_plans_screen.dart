import 'package:flutter/material.dart';
import 'package:gymapp/screens/plans_screens/create_plan_screen.dart';

class YourPlansScreen extends StatelessWidget {
  const YourPlansScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Plans'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.center,
            child: IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => CreatePlanScreen(),
                    ),
                  );
                },
                icon: const Icon(
                  Icons.add,
                  size: 44,
                )),
          )
        ],
      ),
    );
  }
}
