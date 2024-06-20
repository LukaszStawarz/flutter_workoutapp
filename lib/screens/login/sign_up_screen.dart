import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gymapp/model/button_bp.dart';
import 'package:gymapp/model/flat_text_button.dart';
import 'package:gymapp/model/textinput.dart';
import 'package:gymapp/screens/login/forgot_pass_screen.dart';
import 'package:gymapp/screens/login/log_in_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _form = GlobalKey<FormState>();
  var _enteretName = '';
  var _enteretLastName = '';
  var _enteretEmail = '';
  var _enteretPhoneNumber = '';
  var _enteretPassword = '';

  void _submit() {
    final isValid = _form.currentState!.validate();
    print(isValid);

    if (isValid) {
      _form.currentState!.save();
      print(_enteretName);
      print(_enteretLastName);
      print(_enteretEmail);
      print(_enteretPhoneNumber);
      print(_enteretPassword);
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
                  backgroundColor: Color(0xff161818),
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
                    _enteretName = p0!;
                  }),
                ),
              ),
              Flexible(
                child: TextInputWidget(
                  hintT: 'Last name',
                  backgroundColor: Color(0xff161818),
                  keyboardType: TextInputType.name,
                  hideText: false,
                  validator: (p0) {
                    if (p0 == null || p0.trim().isEmpty) {
                      return 'Please enter your last name.';
                    }
                    return null;
                  },
                  onSaved: ((p0) {
                    _enteretLastName = p0!;
                  }),
                ),
              ),
              Flexible(
                child: TextInputWidget(
                  hintT: 'Phone number',
                  backgroundColor: Color(0xff161818),
                  keyboardType: TextInputType.phone,
                  hideText: false,
                  validator: (p0) {
                    if (p0 == null || p0.isEmpty) {
                      return 'Please enter your phone number.';
                    }
                    return null;
                  },
                  onSaved: ((p0) {
                    _enteretPhoneNumber = p0!;
                  }),
                ),
              ),
              Flexible(
                child: TextInputWidget(
                    hintT: 'Email',
                    backgroundColor: Color(0xff161818),
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
                    })),
              ),
              Flexible(
                child: TextInputWidget(
                  hintT: 'Password',
                  backgroundColor: Color(0xff161818),
                  keyboardType: TextInputType.text,
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
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => const LogInScreen()));
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
