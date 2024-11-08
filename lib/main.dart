import 'package:flutter/material.dart';
import 'package:gymapp/create_db_script.dart';
import 'package:gymapp/models/plans.dart';
import 'package:gymapp/models/subplan.dart';
import 'package:gymapp/providers/exercise_provider.dart';
import 'package:gymapp/providers/plans_provider.dart';
import 'package:gymapp/providers/user_data_getter_provider.dart';
import 'package:gymapp/providers/user_data_provider.dart';
import 'package:gymapp/providers/user_exercise_provider.dart';
import 'package:gymapp/providers/user_workout_provider.dart';
import 'package:gymapp/screens/login/sign_up_details_screen.dart';
import 'package:gymapp/screens/login/sign_up_screen.dart';
import 'package:gymapp/screens/login/su_details_screen2.dart';
import 'package:gymapp/screens/main_screen_widget.dart';
import 'package:gymapp/screens/login/start_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:gymapp/screens/plans_screens/plan_details.dart';
import 'package:gymapp/screens/plans_screens/plan_screen.dart';
import 'package:gymapp/screens/todo_screens/history_screen.dart';
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
  // setup();
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
        ChangeNotifierProvider(
          create: (_) => UserDataProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => UserDataGetterProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => UserExerciseProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => UserWorkoutProvider(),
        )
      ],
      child: MaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: const Color.fromRGBO(42, 44, 56, 1),
          colorScheme:
              const ColorScheme.dark().copyWith(background: Colors.red),
        ),
        home: //const MainScreenWidget(),
            SignUpScreen(),
        //const StartScreen(),
        //SuDetailsScreen2(),
        //const SignUpDetailsScreen(),
        //const HomeScreenWidget()
        //PlanScreen(),
        //HistoryScreen(),
      ),
    );
  }
}
