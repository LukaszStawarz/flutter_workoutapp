import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gymapp/widgets/button_bp.dart';
import 'package:gymapp/widgets/flat_text_button.dart';
import 'package:gymapp/widgets/textinput.dart';
import 'package:gymapp/screens/login/forgot_pass_screen.dart';
import 'package:gymapp/screens/login/log_in_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

final _firebase = FirebaseAuth.instance;

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _form = GlobalKey<FormState>();
  var _enteredName = '';
  var _enteredLastName = '';
  var _enteredEmail = '';
  var _enteredPhoneNumber = '';
  var _enteredPassword = '';

  void _submit() async {
    final isValid = _form.currentState!.validate();
    print(isValid);

    if (!isValid) {
      return;
    }

    _form.currentState!.save();
    print(_enteredName);
    print(_enteredLastName);
    print(_enteredEmail);
    print(_enteredPhoneNumber);
    print(_enteredPassword);
    if (isValid) {
      try {
        final userCredentials = await _firebase.createUserWithEmailAndPassword(
            email: _enteredEmail, password: _enteredPassword);
        await FirebaseFirestore.instance
            .collection('users')
            .doc(userCredentials.user!.uid)
            .set(
          {
            'user name': _enteredName,
            'user lastname': _enteredLastName,
            'user email': _enteredEmail,
            'user phone number': _enteredPhoneNumber,
          },
        );
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const LogInScreen()));
      } on FirebaseAuthException catch (error) {
        if (error.code == 'email-already-in-use') {
          //...
        }
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(error.message ?? 'Authentication failed.'),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      //backgroundColor: const Color.fromRGBO(42, 44, 56, 1),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: Form(
          key: _form,
          child: Column(
            children: [
              const SizedBox(height: 60),
              Stack(
                children: [
                  const SizedBox(
                    width: 100,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Sign Up',
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
              const SizedBox(height: 20),
              Flexible(
                child: TextInputWidget(
                  hintT: 'Name',
                  backgroundColor: const Color(0xff161818),
                  keyboardType: TextInputType.name,
                  hideText: false,
                  validator: (p0) {
                    print('check $p0');
                    if (p0 == null || p0.trim().isEmpty) {
                      return 'Please enter your name.';
                    }
                    return null;
                  },
                  onSaved: ((p0) {
                    _enteredName = p0!;
                  }),
                ),
              ),
              Flexible(
                child: TextInputWidget(
                  hintT: 'Last name',
                  backgroundColor: const Color(0xff161818),
                  keyboardType: TextInputType.name,
                  hideText: false,
                  validator: (p0) {
                    if (p0 == null || p0.trim().isEmpty) {
                      return 'Please enter your last name.';
                    }
                    return null;
                  },
                  onSaved: ((p0) {
                    _enteredLastName = p0!;
                  }),
                ),
              ),
              Flexible(
                child: TextInputWidget(
                  hintT: 'Phone number',
                  backgroundColor: const Color(0xff161818),
                  keyboardType: TextInputType.phone,
                  hideText: false,
                  validator: (p0) {
                    if (p0 == null || p0.isEmpty) {
                      return 'Please enter your phone number.';
                    }
                    return null;
                  },
                  onSaved: ((p0) {
                    _enteredPhoneNumber = p0!;
                  }),
                ),
              ),
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
                      _enteredEmail = p0!;
                    })),
              ),
              Flexible(
                child: TextInputWidget(
                  hintT: 'Password',
                  backgroundColor: const Color(0xff161818),
                  keyboardType: TextInputType.text,
                  hideText: true,
                  validator: (p0) {
                    if (p0 == null || p0.trim().length < 6) {
                      return 'Password must be at least 6 characters long.';
                    }
                    return null;
                  },
                  onSaved: ((p0) {
                    _enteredPassword = p0!;
                  }),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CheckBoxWidget(),
                    Flexible(
                      child: Text(
                          style: TextStyle(color: Color(0xffACA3A5)),
                          'By continuing you accept our Privacy Policy and Term of Use'),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              ButtonBP(
                onClick: () {
                  _submit();
                },
                buttonText: 'Sign Up',
              ),
              Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  FlatTextBtn(
                    onClick: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LogInScreen()),
                      );
                    },
                    buttonText: 'You have an account? Login.',
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
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CheckBoxWidget extends StatefulWidget {
  const CheckBoxWidget({super.key});

  @override
  State<CheckBoxWidget> createState() => _CheckBoxWidgetState();
}

class _CheckBoxWidgetState extends State<CheckBoxWidget> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return const Color(0xffACA3A5);
    }

    return Checkbox(
      checkColor: const Color.fromRGBO(118, 50, 208, 1),
      fillColor: MaterialStateProperty.resolveWith((getColor)),
      value: isChecked,
      onChanged: (bool? value) {
        setState(() {
          isChecked = value!;
        });
      },
    );
  }
}
