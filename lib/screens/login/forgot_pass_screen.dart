import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gymapp/model/button_bp.dart';
import 'package:gymapp/model/textinput.dart';
import 'package:gymapp/screens/login/remind_pass_screen.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: const Color.fromRGBO(42, 44, 56, 1),
      resizeToAvoidBottomInset: false,
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(children: [
          const SizedBox(height: 100),
          Stack(
            children: [
              const SizedBox(
                width: 100,
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  'Forgot your password?',
                  style: GoogleFonts.poppins(
                      color: const Color.fromARGB(255, 136, 133, 134),
                      fontWeight: FontWeight.w600,
                      fontSize: 33),
                  textAlign: TextAlign.center,
                ),
              ),
              //SizedBox(width: 50),
            ],
          ),
          const SizedBox(height: 40),
          const Flexible(
            child: TextInputWidget(
              hintT: 'Name',
              backgroundColor: Color(0xff161818),
            ),
          ),
          const Flexible(
            child: TextInputWidget(
              hintT: 'Surname',
              backgroundColor: Color(0xff161818),
            ),
          ),
          const Flexible(
            child: TextInputWidget(
              hintT: 'Phone number',
              backgroundColor: Color(0xff161818),
            ),
          ),
          const Flexible(
            child: TextInputWidget(
              hintT: 'Email',
              backgroundColor: Color(0xff161818),
            ),
          ),
          Text(
            'If all your data are correct, you will recive a passward.',
            style: GoogleFonts.poppins(
                color: const Color.fromARGB(255, 136, 133, 134),
                fontWeight: FontWeight.w600,
                fontSize: 16),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 40,
          ),
          ButtonBP(
            onClick: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const RemindPassScreen(),
                ),
              );
            },
            buttonText: 'Send Email',
          ),
        ]),
      ),
    );
  }
}
