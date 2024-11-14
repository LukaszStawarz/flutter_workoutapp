import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gymapp/models/breathing.dart';
import 'package:gymapp/models/cardio.dart';
import 'package:gymapp/models/strength.dart';
import 'package:gymapp/models/warmup.dart';
import 'package:gymapp/models/yoga.dart';
import 'package:gymapp/providers/exercise_provider.dart';
import 'package:provider/provider.dart';

class CreatePlanScreen extends StatelessWidget {
  const CreatePlanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final exerciseProvider = context.watch<ExerciseProvider>();
    final List<Yoga> yoga = exerciseProvider.yogaList;
    final List<Breathing> breathing = exerciseProvider.breathingList;
    final List<Cardio> cardio = exerciseProvider.cardioList;
    final List<WarmUp> warmup = exerciseProvider.warmUpList;
    final List<Strength> strength = exerciseProvider.strengthList;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add exercises',
        ),
      ),
      body: exerciseProvider.isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.all(12.0),
              child: Scrollbar(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(
                                color:
                                    const Color.fromARGB(255, 138, 135, 136))),
                        child: Column(
                          children: [
                            Text(
                              'Breathing Exercises',
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 20,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            ...breathing.map((e) =>
                                ListComponent(onclick: () {}, name: e.title)),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(
                                color:
                                    const Color.fromARGB(255, 138, 135, 136))),
                        child: Column(
                          children: [
                            Text(
                              'Cardio Exercises',
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 20,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            ...cardio.map((e) =>
                                ListComponent(onclick: () {}, name: e.title)),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(
                                color:
                                    const Color.fromARGB(255, 138, 135, 136))),
                        child: Column(
                          children: [
                            Text(
                              'Strength Exercises',
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 20,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            ...strength.map((e) =>
                                ListComponent(onclick: () {}, name: e.title)),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(
                                color:
                                    const Color.fromARGB(255, 138, 135, 136))),
                        child: Column(
                          children: [
                            Text(
                              'Warm-up Exercises',
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 20,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            ...warmup.map((e) =>
                                ListComponent(onclick: () {}, name: e.title)),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(
                                color:
                                    const Color.fromARGB(255, 138, 135, 136))),
                        child: Column(
                          children: [
                            Text(
                              'Yoga Exercises',
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 20,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            ...yoga.map((e) =>
                                ListComponent(onclick: () {}, name: e.title)),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}

class ListComponent extends StatefulWidget {
  const ListComponent({
    super.key,
    required this.onclick,
    required this.name,
  });

  final Function() onclick;
  final String name;

  @override
  State<ListComponent> createState() => _ListComponentState();
}

class _ListComponentState extends State<ListComponent> {
  bool? isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          widget.onclick.call();
        },
        child: Row(
          children: [
            Image.asset('assets/images/Exercise_example_image.png'),
            const SizedBox(
              width: 20,
            ),
            Text(
              widget.name,
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontWeight: FontWeight.w300,
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: Checkbox(
                  shape: const CircleBorder(),
                  value: isChecked,
                  activeColor: Colors.purple,
                  onChanged: (newBool) {
                    setState(() {
                      isChecked = newBool;
                    });
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}