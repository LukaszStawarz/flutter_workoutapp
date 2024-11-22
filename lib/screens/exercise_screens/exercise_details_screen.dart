import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gymapp/models/exercises.dart';
import 'package:video_player/video_player.dart';

class ExerciseDetailsScreen extends StatefulWidget {
  const ExerciseDetailsScreen(
      {super.key,
      required this.title,
      required this.description,
      required this.howto,
      required this.videourl,
      required this.exercises});
  final String title;
  final String description;
  final String howto;
  final String videourl;
  final List<Exercises> exercises;
  @override
  State<ExerciseDetailsScreen> createState() => _ExerciseDetailsScreenState();
}

class _ExerciseDetailsScreenState extends State<ExerciseDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercise Details',
            style: TextStyle(color: Color(0xffACA3A5))),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/bg_example1.png'),
              fit: BoxFit.cover),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 10,
              ),
              Text(
                widget.title,
                style: GoogleFonts.poppins(
                  color: const Color.fromARGB(255, 136, 133, 134),
                  fontWeight: FontWeight.w500,
                  fontSize: 25,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Image.network(
                widget.videourl,
              ),
              const SizedBox(height: 15),
              Text(
                'Description',
                style: GoogleFonts.poppins(
                    color: const Color.fromARGB(255, 189, 183, 185),
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 15),
              Text(
                widget.description,
                style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w300),
              ),
              const SizedBox(height: 25),
              Text(
                'How to',
                style: GoogleFonts.poppins(
                    color: const Color.fromARGB(255, 189, 183, 185),
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 15),
              Text(
                widget.howto,
                style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w300),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
