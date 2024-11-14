import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gymapp/models/subplan.dart';
import 'package:gymapp/providers/user_exercise_provider.dart';
import 'package:gymapp/screens/plans_screens/started_plan_screen.dart';
import 'package:provider/provider.dart';

class PlanDetailsScreen extends StatelessWidget {
  const PlanDetailsScreen({
    super.key,
    required this.subplan,
    required this.planId,
  });

  final SubPlan subplan;
  final String planId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          subplan.planTitle,
          style: const TextStyle(
            color: Color(0xffACA3A5),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 15),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Column(
                    children: [
                      Hero(
                        tag: subplan.image,
                        child: Container(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          width: 370,
                          height: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                              opacity: 0.6,
                              image: NetworkImage(subplan.image),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Stack(
                                  children: [
                                    Text(
                                      subplan.planTitle,
                                      style: GoogleFonts.poppins(
                                        fontSize: 30,
                                        fontWeight: FontWeight.w600,
                                        foreground: Paint()
                                          ..style = PaintingStyle.stroke
                                          ..strokeWidth = 6 // Grubość obrysu
                                          ..color =
                                              Colors.black, // Kolor obrysu
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    Text(
                                      subplan.planTitle,
                                      style: GoogleFonts.poppins(
                                        fontSize: 30,
                                        fontWeight: FontWeight.w600,
                                        color: const Color(
                                            0xff7632D0), // Kolor wypełnienia
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      DescriptionWidget(
                        description: subplan.description,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TimeWidget(
                        plan: subplan,
                      ),
                      PlanDetails(
                        subplan: subplan,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            StartButton(
              onClick: () {
                context
                    .read<UserExerciseProvider>()
                    .startExercise(planId: planId, subPlanIndex: subplan.index);

                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => StartedPlanScreen(
                      plan: subplan,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class TimeWidget extends StatelessWidget {
  TimeWidget({
    super.key,
    required this.plan,
  });
  final List<Color> gradientColors = [
    const Color(0xff5328D4).withOpacity(0.4),
    const Color(0xff7632D0).withOpacity(0.4),
  ];
  final SubPlan plan;
  String? time;

  @override
  Widget build(BuildContext context) {
    // var ex1;
    // var ex2;

    // var ex3;
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20),
      width: 370,
      height: 70,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(colors: gradientColors)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Icon(
                Icons.timer_outlined,
                color: Colors.white,
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                'Time',
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 25,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Row(
                children: [
                  Text(
                    '~ ${plan.time} min',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}

class PlanDetails extends StatelessWidget {
  const PlanDetails({super.key, required this.subplan});

  final SubPlan subplan;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 15,
          ),
          Text(
            'Exercises',
            style: GoogleFonts.poppins(
                color: const Color.fromARGB(255, 189, 183, 185),
                fontSize: 20,
                fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              for (final i in subplan.exercises)
                Text(
                  '- $i',
                  style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w300),
                )
            ],
          ),
        ],
      ),
    );
  }
}

class StartButton extends StatelessWidget {
  StartButton({
    super.key,
    required this.onClick,
  });
  final void Function() onClick;

  final List<Color> gradientColors = [
    const Color(0xff5328D4),
    const Color(0xff7632D0)
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        width: 85,
        height: 85,
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: gradientColors,
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft),
              borderRadius: BorderRadius.circular(50)),
          child: ElevatedButton(
            onPressed: onClick,
            style:
                ElevatedButton.styleFrom(backgroundColor: Colors.transparent),
            child: Text(
              'Start',
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class DescriptionWidget extends StatelessWidget {
  const DescriptionWidget({
    super.key,
    required this.description,
  });

  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Center(
              child: Text(
                description,
                style: GoogleFonts.poppins(
                  color: const Color(0xffACA3A5),
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          )
        ],
      ),
    );
  }
}
