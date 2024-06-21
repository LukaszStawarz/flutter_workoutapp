import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gymapp/model/button_bp.dart';
import 'package:gymapp/model/textinput.dart';
import 'package:gymapp/screens/login/remind_pass_screen.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _form = GlobalKey<FormState>();
  var _enteretName = '';
  var _enteretLastName = '';
  var _enteretEmail = '';
  var _enteretPhoneNumber = '';

  void _submit() {
    final isValid = _form.currentState!.validate();
    print(isValid);

    if (isValid) {
      _form.currentState!.save();
      print(_enteretName);
      print(_enteretLastName);
      print(_enteretEmail);
      print(_enteretPhoneNumber);
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
            Flexible(
              child: TextInputWidget(
                hintT: 'Name',
                backgroundColor: Color(0xff161818),
                keyboardType: TextInputType.name,
                hideText: false,
                validator: (p0) {
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
                onSaved: (p0) {
                  _enteretLastName = p0!;
                },
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
                onSaved: (p0) {
                  _enteretPhoneNumber = p0!;
                },
              ),
            ),
            Flexible(
              child: TextInputWidget(
                hintT: 'Email',
                backgroundColor: Color(0xff161818),
                keyboardType: TextInputType.emailAddress,
                hideText: false,
                validator: (p0) {
                  if (p0 == null || p0.trim().isEmpty || !p0.contains('@')) {
                    return 'Please enter valid email address.';
                  }
                  return null;
                },
                onSaved: (p0) {
                  _enteretEmail = p0!;
                },
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
                _submit();
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => const RemindPassScreen(),
                //   ),
                // );
              },
              buttonText: 'Send Email',
            ),
          ]),
        ),
      ),
    );
  }
}
