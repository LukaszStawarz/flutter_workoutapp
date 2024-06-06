import 'package:flutter/material.dart';
import 'package:gymapp/model/button_bp.dart';
import 'package:gymapp/screens/login/log_in_screen.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

// void _nextScreen(BuildContext context){
//     Navigator.push(context, MaterialPageRoute(builder: (ctx)=> const LogInScreen()));
//   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        //color: const Color.fromRGBO(42, 44, 56, 1),
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 220),
              Image.asset('assets/images/Logo.png'),
              const SizedBox(height: 80),
              const SizedBox(
                height: 200,
              ),
              ButtonBP(
                buttonText: 'Get Started',
                onClick: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LogInScreen(),
                    ),
                  );
                },
              )
            ],
            //backgroundColor: Color.fromRGBO(42, 44, 56, 1),
          ),
        ),
      ),
    );
  }
}
//color: Color.fromRGBO(42, 44, 56, 1)
