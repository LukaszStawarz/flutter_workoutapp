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
    final List<Yoga> yoga = exerciseProvider.yogaList;
    final List<Breathing> breathing = exerciseProvider.breathingList;
    final List<Cardio> cardio = exerciseProvider.cardioList;
    final List<WarmUp> warmup = exerciseProvider.warmUpList;
    final List<Strength> strength = exerciseProvider.strengthList;

    //final ThemeData theme = Theme.of(context);
    return SizedBox.expand(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ExpansionTileWidget(
                title: 'Breathing Exercises',
                lista: [
                  ...breathing
                      .map(
                        (e) => ListComponent(
                            onclick: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ExerciseDetailsScreen(
                                    title: e.title,
                                    description: e.description,
                                    howto: e.howto,
                                  ),
                                ),
                              );
                            },
                            name: e.title),
                      )
                      .toList()
                    ..sort(((a, b) => a.name.compareTo(b.name)))
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              ExpansionTileWidget(
                title: 'Cardio Exercises',
                lista: [
                  ...cardio
                      .map(
                        (e) => ListComponent(
                            onclick: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ExerciseDetailsScreen(
                                    title: e.title,
                                    description: e.description,
                                    howto: e.howto,
                                  ),
                                ),
                              );
                            },
                            name: e.title),
                      )
                      .toList()
                    ..sort(((a, b) => a.name.compareTo(b.name)))
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              ExpansionTileWidget(
                title: 'Strength Exercises',
                lista: [
                  ...strength
                      .map(
                        (e) => ListComponent(
                          onclick: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ExerciseDetailsScreen(
                                  title: e.title,
                                  description: e.description,
                                  howto: e.howto,
                                ),
                              ),
                            );
                          },
                          name: e.title,
                        ),
                      )
                      .toList()
                    ..sort(((a, b) => a.name.compareTo(b.name)))
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              ExpansionTileWidget(
                title: 'Warm-up Exercises',
                lista: [
                  ...warmup
                      .map(
                        (e) => ListComponent(
                            onclick: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ExerciseDetailsScreen(
                                    title: e.title,
                                    description: e.description,
                                    howto: e.howto,
                                  ),
                                ),
                              );
                            },
                            name: e.title),
                      )
                      .toList()
                    ..sort(((a, b) => a.name.compareTo(b.name)))
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              ExpansionTileWidget(
                title: 'Yoga Exercises',
                lista: [
                  ...yoga
                      .map(
                        (e) => ListComponent(
                            onclick: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ExerciseDetailsScreen(
                                    title: e.title,
                                    description: e.description,
                                    howto: e.howto,
                                  ),
                                ),
                              );
                            },
                            name: e.title),
                      )
                      .toList()
                    ..sort(((a, b) => a.name.compareTo(b.name)))
                ],
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ExpansionTileWidget extends StatelessWidget {
  const ExpansionTileWidget({required this.title, required this.lista});
  final String title;
  final List<Widget> lista;
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      tilePadding: const EdgeInsets.only(left: 30, right: 20),
      childrenPadding: const EdgeInsets.only(bottom: 20),
      collapsedBackgroundColor: Colors.black54,
      backgroundColor: Colors.black54,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      collapsedShape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      title: Text(title),
      children: lista,
    );
  }
}

class ListComponent extends StatelessWidget {
  const ListComponent({
    super.key,
    required this.onclick,
    required this.name,
  });

  final Function() onclick;
  final String name;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        onclick.call();
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        child: Row(
          children: [
            Image.asset('assets/images/Exercise_example_image.png'),
            const SizedBox(
              width: 20,
            ),
            Text(
              name,
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
