import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gymapp/models/plans.dart';
import 'package:gymapp/screens/plans_screens/started_plan_screen.dart';

class PlanDetailsScreen extends StatelessWidget {
  const PlanDetailsScreen(
      {super.key,
      required this.planTitle,
      required this.image,
      required this.plan});

  final String planTitle;
  final String image;
  final Plan plan;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text(planTitle, style: const TextStyle(color: Color(0xffACA3A5))),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            Hero(
              tag: image,
              child: Container(
                padding: const EdgeInsets.only(left: 20, right: 20),
                width: 370,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: NetworkImage(image),
                    fit: BoxFit.cover,
                  ),
                ),
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
            ),
            PlanDetails(
              plan: plan,
              planTitle: planTitle,
            ),
            const SizedBox(
              height: 20,
            ),
            TimeWidget(
              planTitle: planTitle,
              plan: plan,
            ),
            const SizedBox(
              height: 30,
            ),
            StartButton(onClick: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => StartedPlanScreen(
                    plan: plan,
                    planTitle: planTitle,
                  ),
                ),
              );
            }),
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
    required this.planTitle,
    required this.plan,
  });
  final List<Color> gradientColors = [
    const Color(0xff5328D4),
    const Color(0xff7632D0)
  ];
  final String planTitle;
  final Plan plan;
  String? time;
  @override
  Widget build(BuildContext context) {
    // var ex1;
    // var ex2;

    // var ex3;
    return Container(
        padding: const EdgeInsets.only(left: 20, right: 20),
        width: 370,
        height: 80,
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
                if (planTitle == plan.wk_plan1)
                  Row(
                    children: [
                      Text(
                        '~ ${plan.time1} min',
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                if (planTitle == plan.wk_plan2)
                  Row(
                    children: [
                      Text(
                        '~ ${plan.time2} min',
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                if (planTitle == plan.wk_plan3)
                  Row(
                    children: [
                      Text(
                        '~ ${plan.time3} min',
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  )
              ],
            )
          ],
        ));
  }
}

class PlanDetails extends StatelessWidget {
  const PlanDetails({super.key, required this.planTitle, required this.plan});
  final String planTitle;

  final Plan plan;
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
          if (planTitle == plan.wk_plan1)
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                for (final i in plan.wk_ex1)
                  Text(
                    '- $i',
                    style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w300),
                  )
              ],
            ),
          if (planTitle == plan.wk_plan2)
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                for (final i in plan.wk_ex2)
                  Text(
                    '- $i',
                    style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w300),
                  )
              ],
            ),
          if (planTitle == plan.wk_plan3)
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                for (final i in plan.wk_ex3)
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
        width: 100,
        height: 100,
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
                fontSize: 18,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
