import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gymapp/model/button_bp.dart';
import 'package:gymapp/model/flat_text_button.dart';
import 'package:gymapp/screens/main_screen_widget.dart';
import 'package:gymapp/model/textinput.dart';
import 'package:gymapp/screens/login/forgot_pass_screen.dart';
import 'package:gymapp/screens/login/sign_up_screen.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //backgroundColor: const Color.fromRGBO(42, 44, 56, 1),
        resizeToAvoidBottomInset: false,
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              const SizedBox(height: 100),
              Stack(
                children: [
                  const SizedBox(
                    width: 100,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Log In',
                      style: GoogleFonts.poppins(
                          color: const Color.fromARGB(255, 136, 133, 134),
                          fontWeight: FontWeight.w600,
                          fontSize: 40),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  //SizedBox(width: 50),
                ],
              ),
              const SizedBox(height: 40),
              const Flexible(
                child: TextInputWidget(
                  hintT: 'Email',
                  backgroundColor: Color(0xff161818),
                ),
              ),
              const Flexible(
                child: TextInputWidget(
                  hintT: 'Password',
                  backgroundColor: Color(0xff161818),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              ButtonBP(
                onClick: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MainScreenWidget()));
                },
                buttonText: 'Login',
              ),
              Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  FlatTextBtn(
                    onClick: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignUpScreen(),
                        ),
                      );
                    },
                    buttonText: 'Create an account.',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  FlatTextBtn(
                    onClick: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ForgotPasswordScreen()),
                      );
                    },
                    buttonText: 'Forgot your password?',
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
