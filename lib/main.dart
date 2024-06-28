import 'package:flutter/material.dart';
import 'package:gymapp/providers/exercise_provider.dart';
import 'package:gymapp/providers/plans_provider.dart';
import 'package:gymapp/screens/main_screen_widget.dart';
import 'package:gymapp/screens/login/start_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

// final theme = ThemeData(
//   useMaterial3: true,
//   colorScheme: ColorScheme.fromSeed(
//     seedColor: const Color.fromRGBO(42, 44, 56, 1),
//   ),
// );

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const GymApp());
}

class GymApp extends StatelessWidget {
  const GymApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => PlanProvider()..getPlans(),
        ),
        ChangeNotifierProvider(
          create: (_) => ExerciseProvider()..getExercises(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: const Color.fromRGBO(42, 44, 56, 1),
          colorScheme:
              const ColorScheme.dark().copyWith(background: Colors.red),
        ),
        home: //const MainScreenWidget(),
            //SignUpScreen(),
            const StartScreen(),
        //const HomeScreenWidget()
        //PlanScreen()
      ),
    );
  }
}
