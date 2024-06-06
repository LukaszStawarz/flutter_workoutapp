import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ExerciseScreen extends StatelessWidget {
  const ExerciseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //final ThemeData theme = Theme.of(context);
    return SizedBox.expand(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            ExpansionTile(
              tilePadding: const EdgeInsets.only(left: 30, right: 20),
              childrenPadding: const EdgeInsets.only(bottom: 20),
              collapsedBackgroundColor: Colors.black54,
              backgroundColor: Colors.black54,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              collapsedShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              title: const Text('Upper-body Exercises'),
              children: [
                ListComponent(onclick: () {}, name: 'Exercise example no.1'),
                const SizedBox(
                  height: 8,
                ),
                ListComponent(onclick: () {}, name: 'Exercise example no.2'),
                const SizedBox(
                  height: 8,
                ),
                ListComponent(onclick: () {}, name: 'Exercise example no.3'),
                const SizedBox(
                  height: 8,
                ),
                ListComponent(onclick: () {}, name: 'Exercise example no.4'),
                const SizedBox(
                  height: 8,
                ),
                ListComponent(onclick: () {}, name: 'Exercise example no.5'),
                const SizedBox(
                  height: 8,
                ),
                ListComponent(onclick: () {}, name: 'Exercise example no.6'),
                const SizedBox(
                  height: 8,
                ),
                ListComponent(onclick: () {}, name: 'Exercise example no.7'),
                const SizedBox(
                  height: 8,
                ),
                ListComponent(onclick: () {}, name: 'Exercise example no.8'),
                const SizedBox(
                  height: 8,
                ),
                ListComponent(onclick: () {}, name: 'Exercise example no.9'),
                const SizedBox(
                  height: 8,
                ),
                ListComponent(onclick: () {}, name: 'Exercise example no.10'),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            ExpansionTile(
              tilePadding: const EdgeInsets.only(left: 30, right: 20),
              childrenPadding: const EdgeInsets.only(bottom: 20),
              collapsedBackgroundColor: Colors.black54,
              backgroundColor: Colors.black54,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              collapsedShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              title: const Text('Lower-body Exercises'),
              children: [
                ListComponent(onclick: () {}, name: 'Exercise example no.1'),
                const SizedBox(
                  height: 8,
                ),
                ListComponent(onclick: () {}, name: 'Exercise example no.2'),
                const SizedBox(
                  height: 8,
                ),
                ListComponent(onclick: () {}, name: 'Exercise example no.3'),
                const SizedBox(
                  height: 8,
                ),
                ListComponent(onclick: () {}, name: 'Exercise example no.4'),
                const SizedBox(
                  height: 8,
                ),
                ListComponent(onclick: () {}, name: 'Exercise example no.5'),
                const SizedBox(
                  height: 8,
                ),
                ListComponent(onclick: () {}, name: 'Exercise example no.6'),
                const SizedBox(
                  height: 8,
                ),
                ListComponent(onclick: () {}, name: 'Exercise example no.7'),
                const SizedBox(
                  height: 8,
                ),
                ListComponent(onclick: () {}, name: 'Exercise example no.8'),
                const SizedBox(
                  height: 8,
                ),
                ListComponent(onclick: () {}, name: 'Exercise example no.9'),
                const SizedBox(
                  height: 8,
                ),
                ListComponent(onclick: () {}, name: 'Exercise example no.10'),
              ],
            ),
          ],
        ),
      ),
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
        padding: const EdgeInsets.symmetric(horizontal: 40),
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
