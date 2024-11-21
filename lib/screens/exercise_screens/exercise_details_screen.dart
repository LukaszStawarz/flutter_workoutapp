import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ExerciseDetailsScreen extends StatelessWidget {
  const ExerciseDetailsScreen(
      {super.key,
      required this.title,
      required this.description,
      required this.howto});
  final String title;
  final String description;
  final String howto;
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
                title,
                style: GoogleFonts.poppins(
                  color: const Color.fromARGB(255, 136, 133, 134),
                  fontWeight: FontWeight.w500,
                  fontSize: 25,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Image.asset(
                'assets/images/Exercise_example_video.png',
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
                description,
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
                howto,
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
