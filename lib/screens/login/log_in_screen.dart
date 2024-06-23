import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gymapp/widgets/button_bp.dart';
import 'package:gymapp/widgets/flat_text_button.dart';
import 'package:gymapp/screens/main_screen_widget.dart';
import 'package:gymapp/widgets/textinput.dart';
import 'package:gymapp/screens/login/forgot_pass_screen.dart';
import 'package:gymapp/screens/login/sign_up_screen.dart';

final _firebase = FirebaseAuth.instance;

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final _form = GlobalKey<FormState>();

  var _enteretEmail = '';
  var _enteretPassword = '';

  void _submit() async {
    final isValid = _form.currentState!.validate();

    if (!isValid) {
      return;
    }

    _form.currentState!.save();

    if (isValid) {
      try {
        final userCredentials = await _firebase.signInWithEmailAndPassword(
          email: _enteretEmail,
          password: _enteretPassword,
        );
        print(userCredentials);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeScreenWidget(),
          ),
        );
      } on FirebaseAuthException catch (error) {
        String errorMessage;

        if (error.code == 'invalid-email') {
          errorMessage = 'Entered email is invalid.';
        } else if (error.code == 'user-not-found') {
          errorMessage = 'No user found for that email.';
        } else if (error.code == 'wrong-password') {
          errorMessage = 'Wrong password provided.';
        } else {
          errorMessage = 'An error occurred. Please try again.';
        }

        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(errorMessage),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //backgroundColor: const Color.fromRGBO(42, 44, 56, 1),
        resizeToAvoidBottomInset: false,
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: Form(
            key: _form,
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
                Flexible(
                  child: TextInputWidget(
                    hintT: 'Email',
                    backgroundColor: const Color(0xff161818),
                    keyboardType: TextInputType.emailAddress,
                    hideText: false,
                    validator: (p0) {
                      if (p0 == null ||
                          p0.trim().isEmpty ||
                          !p0.contains('@')) {
                        return 'Please enter valid email address.';
                      }
                      return null;
                    },
                    onSaved: ((p0) {
                      _enteretEmail = p0!;
                    }),
                  ),
                ),
                Flexible(
                  child: TextInputWidget(
                    hintT: 'Password',
                    backgroundColor: const Color(0xff161818),
                    keyboardType: TextInputType.visiblePassword,
                    hideText: true,
                    validator: (p0) {
                      if (p0 == null || p0.trim().length < 6) {
                        return 'Password must be at least 6 characters long.';
                      }
                      return null;
                    },
                    onSaved: ((p0) {
                      _enteretPassword = p0!;
                    }),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                ButtonBP(
                  onClick: () {
                    _submit();
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
                              builder: (context) =>
                                  const ForgotPasswordScreen()),
                        );
                      },
                      buttonText: 'Forgot your password?',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
