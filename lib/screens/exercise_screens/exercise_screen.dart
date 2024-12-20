import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gymapp/models/breathing.dart';
import 'package:gymapp/models/cardio.dart';
import 'package:gymapp/models/exercises.dart';
import 'package:gymapp/models/strength.dart';
import 'package:gymapp/models/warmup.dart';
import 'package:gymapp/models/yoga.dart';
import 'package:gymapp/providers/exercise_provider.dart';
import 'package:gymapp/screens/exercise_screens/exercise_details_screen.dart';
import 'package:provider/provider.dart';

class ExerciseScreen extends StatelessWidget {
  const ExerciseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final exerciseProvider = context.watch<ExerciseProvider>();
    final List<Exercises> yoga = exerciseProvider.exercisesList
        .where(
          (element) => element.type == 'Yoga',
        )
        .toList();
    final List<Exercises> breathing = exerciseProvider.exercisesList
        .where(
          (element) => element.type == 'Breathing',
        )
        .toList();
    final List<Exercises> cardio = exerciseProvider.exercisesList
        .where(
          (element) => element.type == 'Cardio',
        )
        .toList();
    final List<Exercises> warmup = exerciseProvider.exercisesList
        .where(
          (element) => element.type == 'Warmup',
        )
        .toList();
    final List<Exercises> strength = exerciseProvider.exercisesList
        .where(
          (element) => element.type == 'Strength',
        )
        .toList();
    final Exercises exercise;

    return Scaffold(
      body: exerciseProvider.isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/bg_example2.png'),
                    fit: BoxFit.cover),
              ),
              child: Stack(children: [
                Scrollbar(
                  interactive: true,
                  thickness: 8,
                  thumbVisibility: true,
                  trackVisibility: true,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(
                                    color: const Color.fromARGB(
                                        255, 138, 135, 136))),
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
                                ...breathing
                                    .map(
                                      (e) => ListComponent(
                                        onclick: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  ExerciseDetailsScreen(
                                                title: e.title,
                                                description: e.description,
                                                howto: e.howto,
                                                videourl: e.videourl,
                                                exercises: breathing,
                                              ),
                                            ),
                                          );
                                        },
                                        name: e.title,
                                        videourl: e.videourl,
                                      ),
                                    )
                                    .toList()
                                  ..sort(
                                    ((a, b) => a.name.compareTo(b.name)),
                                  ),
                                const SizedBox(
                                  height: 8,
                                )
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
                                    color: const Color.fromARGB(
                                        255, 138, 135, 136))),
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
                                ...cardio
                                    .map(
                                      (e) => ListComponent(
                                        onclick: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  ExerciseDetailsScreen(
                                                title: e.title,
                                                description: e.description,
                                                howto: e.howto,
                                                videourl: e.videourl,
                                                exercises: cardio,
                                              ),
                                            ),
                                          );
                                        },
                                        name: e.title,
                                        videourl: e.videourl,
                                      ),
                                    )
                                    .toList()
                                  ..sort(((a, b) => a.name.compareTo(b.name))),
                                const SizedBox(
                                  height: 8,
                                ),
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
                                    color: const Color.fromARGB(
                                        255, 138, 135, 136))),
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
                                ...strength
                                    .map(
                                      (e) => ListComponent(
                                        onclick: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  ExerciseDetailsScreen(
                                                title: e.title,
                                                description: e.description,
                                                howto: e.howto,
                                                videourl: e.videourl,
                                                exercises: strength,
                                              ),
                                            ),
                                          );
                                        },
                                        name: e.title,
                                        videourl: e.videourl,
                                      ),
                                    )
                                    .toList()
                                  ..sort(((a, b) => a.name.compareTo(b.name))),
                                const SizedBox(
                                  height: 8,
                                ),
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
                                    color: const Color.fromARGB(
                                        255, 138, 135, 136))),
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
                                ...warmup
                                    .map(
                                      (e) => ListComponent(
                                        onclick: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  ExerciseDetailsScreen(
                                                title: e.title,
                                                description: e.description,
                                                howto: e.howto,
                                                videourl: e.videourl,
                                                exercises: warmup,
                                              ),
                                            ),
                                          );
                                        },
                                        name: e.title,
                                        videourl: e.videourl,
                                      ),
                                    )
                                    .toList()
                                  ..sort(((a, b) => a.name.compareTo(b.name))),
                                const SizedBox(
                                  height: 8,
                                ),
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
                                    color: const Color.fromARGB(
                                        255, 138, 135, 136))),
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
                                ...yoga
                                    .map(
                                      (e) => ListComponent(
                                        onclick: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  ExerciseDetailsScreen(
                                                title: e.title,
                                                description: e.description,
                                                howto: e.howto,
                                                videourl: e.videourl,
                                                exercises: yoga,
                                              ),
                                            ),
                                          );
                                        },
                                        name: e.title,
                                        videourl: e.videourl,
                                      ),
                                    )
                                    .toList()
                                  ..sort(((a, b) => a.name.compareTo(b.name))),
                                const SizedBox(
                                  height: 8,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ]),
            ),
    );
  }
}

class ListComponent extends StatefulWidget {
  const ListComponent({
    super.key,
    required this.onclick,
    required this.name,
    required this.videourl,
  });

  final Function() onclick;
  final String name;
  final String videourl;

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
            SizedBox(
              height: 40,
              width: 60,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  widget.videourl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Image.network(
            //   widget.videourl,
            //   height: 40,
            //   width: 60,
            // ),
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
          ],
        ),
      ),
    );
  }
}
