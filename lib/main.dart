import 'package:flutter/material.dart';
import 'package:gymapp/screens/login/sign_up_screen.dart';
import 'package:gymapp/screens/main_screen_widget.dart';
import 'package:gymapp/screens/login/start_screen.dart';

// final theme = ThemeData(
//   useMaterial3: true,
//   colorScheme: ColorScheme.fromSeed(
//     seedColor: const Color.fromRGBO(42, 44, 56, 1),
//   ),
// );

void main() {
  runApp(const GymApp());
}

class GymApp extends StatelessWidget {
  const GymApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromRGBO(42, 44, 56, 1),
        colorScheme: const ColorScheme.dark().copyWith(background: Colors.red),
      ),
      home: const MainScreenWidget(), //SignUpScreen()
    );
  }
}
