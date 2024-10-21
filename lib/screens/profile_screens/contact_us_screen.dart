import 'package:flutter/material.dart';
import 'package:flutter_social_button/flutter_social_button.dart';
import 'package:google_fonts/google_fonts.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 13, 14, 14),
        title: const Text(
          'Contact Us',
          style: TextStyle(color: Color(0xffACA3A5)),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/contact_bg.png'),
              fit: BoxFit.cover),
        ),
        child: const InfoWidget(),
      ),
    );
  }
}

class InfoWidget extends StatelessWidget {
  const InfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: double.infinity,
      padding: const EdgeInsets.all(70),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'Contact Informations',
            style:
                GoogleFonts.poppins(fontWeight: FontWeight.w500, fontSize: 24),
          ),
          Container(
            height: 50,
            child: const SizedBox(
              height: 50,
            ),
          ),
          const Icon(
            Icons.phone_in_talk,
            size: 32,
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            '+48 123 123 123',
            style: GoogleFonts.poppins(fontSize: 16),
          ),
          const SizedBox(
            height: 30,
          ),
          const Icon(
            Icons.mail_rounded,
            size: 32,
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            'hymel.jadwiga@gmail.com',
            style: GoogleFonts.poppins(fontSize: 16),
          ),
          const SizedBox(
            height: 30,
          ),
          const Icon(
            Icons.location_on,
            size: 32,
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            'Lipinki Łożyckie, ul. Łączna 43, koło poczty objazd tutaj',
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: 16,
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/twiter.png',
                scale: 1.2,
              ),
              const SizedBox(
                width: 30,
              ),
              Image.asset(
                'assets/images/instagram.png',
                scale: 1.2,
              ),
              const SizedBox(
                width: 30,
              ),
              Image.asset(
                'assets/images/discord.png',
                scale: 1.2,
              ),
            ],
          )
        ],
      ),
    );
  }
}
