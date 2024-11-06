import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gymapp/main.dart';
import 'package:gymapp/models/plans.dart';
import 'package:gymapp/models/subplan.dart';
import 'package:gymapp/models/user_exercise.dart';
import 'package:gymapp/providers/plans_provider.dart';
import 'package:gymapp/providers/user_workout_provider.dart';
import 'package:provider/provider.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        context.read<UserWorkoutProvider>().getUserWorkout();
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userWorkoutProvider = context.watch<UserWorkoutProvider>();
    final plans = context.read<PlanProvider>().plans;
    final List<UserExercise> workoutList = userWorkoutProvider.userWorkoutList;
    //!Sortowanie po dacie
    workoutList.sort(
      (a, b) => b.startDate.compareTo(a.startDate),
    );

    return Scaffold(
      body: userWorkoutProvider.isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Column(
                children: [
                  ...workoutList.map(
                    (userExercise) {
                      return HistoryContainerWidget(
                        plan: plans
                            .where(
                              (element) => element.id == userExercise.planId,
                            )
                            .first,
                        userExercise: userExercise,
                      );
                    },
                  )
                ],
              ),
            ),
    );
  }
}

class HistoryContainerWidget extends StatelessWidget {
  const HistoryContainerWidget({
    super.key,
    required this.plan,
    required this.userExercise,
  });
  final Plan plan;
  final UserExercise userExercise;

  @override
  Widget build(BuildContext context) {
    //!subPlan: Pobiera odpowiedni SubPlan z listy plan.subplan na podstawie userExercise.subPlanIndex.
    //!subPlan.planTitle: Wyświetla planTitle z wybranego SubPlan.
    final SubPlan subPlan = plan.subplan[userExercise.subPlanIndex];
    final String image = plan.dashboardImageUrl;

    // final SubExercise subExercise;
    String convertedDateTime =
        "${userExercise.startDate.year.toString()}-${userExercise.startDate.month.toString().padLeft(2, '0')}-${userExercise.startDate.day.toString().padLeft(2, '0')} ${userExercise.startDate.hour.toString().padLeft(2, '0')}:${userExercise.startDate.minute.toString().padLeft(2, '0')}";
    int totalExercises = subPlan.exercises.length;
    int finishedExercises = userExercise.subExercises
        .where(
          (element) => !element.wasSkipped,
        )
        .length;
    return Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.grey[900],
            border: Border.all(
                color: const Color.fromARGB(118, 162, 67, 206), width: 2),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.network(
                      image,
                      scale: 2,
                      color: const Color.fromARGB(226, 192, 86, 241),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      plan.title,
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 22,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5.0),
                Text(
                  subPlan.planTitle,
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    color: Colors.blueGrey[100],
                  ),
                ),
                Row(
                  children: [
                    const Icon(Icons.calendar_today,
                        color: Color.fromARGB(226, 192, 86, 241), size: 16),
                    const SizedBox(width: 8),
                    Text(
                      'Date: $convertedDateTime',
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: Colors.grey[400],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5.0,
                ),
                Text(
                  'Finished exercises: ${finishedExercises} / ${totalExercises}',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
                ExpansionTile(
                  title: Text(
                    'Exercises: ',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: userExercise.subExercises.map(
                    (exercise) {
                      //final subPlan = plan.subplan[userExercise.subPlanIndex];
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: Row(
                          children: [
                            Icon(
                              exercise.wasSkipped
                                  ? Icons.cancel
                                  : Icons.check_circle,
                              color: exercise.wasSkipped
                                  ? Colors.redAccent
                                  : Colors.greenAccent,
                              size: 16,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              subPlan.exercises[exercise.subExerciseIndex],
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ).toList(),
                ),
                // Text('Exercises: ${userExercise.subExercises.map(
                //   (e) {
                // final subPlan =
                //     plan.subplan.elementAt(userExercise.subPlanIndex);
                //     return subPlan.exercises.elementAt(e.subExerciseIndex);
                //   },
                // )}')
              ],
            ),
          ),
        ));
  }
}
