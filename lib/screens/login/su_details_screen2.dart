import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gymapp/providers/user_data_getter_provider.dart';
import 'package:gymapp/providers/user_data_provider.dart';
import 'package:gymapp/screens/main_screen_widget.dart';
import 'package:gymapp/widgets/button_bp.dart';
import 'package:provider/provider.dart';

class SuDetailsScreen2 extends StatefulWidget {
  @override
  State<SuDetailsScreen2> createState() => _SuDetailsScreen2State();
}

class _SuDetailsScreen2State extends State<SuDetailsScreen2> {
  bool _isBetterShapePressed = false;
  bool _isLoseFatPressed = false;
  void _highLight(int index) {
    setState(() {
      if (index == 0) {
        _isBetterShapePressed = true;
        _isLoseFatPressed = false;
      } else if (index == 1) {
        _isBetterShapePressed = false;
        _isLoseFatPressed = true;
      }
    });
  }

  late ImageProvider<Object> image1;
  late ImageProvider<Object> image2;
  late final UserDataProvider userDataProvider;
  @override
  void initState() {
    super.initState();
    userDataProvider = context.read<UserDataProvider>();
  }

  final _formKey = GlobalKey<FormState>();
  String _enteredGoal = '';
  String _enteredLevel = '';

  @override
  Widget build(BuildContext context) {
    final userDataGetterProvider = Provider.of<UserDataGetterProvider>(context);

    if (userDataGetterProvider.userData == null) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else {
      final userData = userDataGetterProvider.userData;
      if (userData?['gender'] == 'Male') {
        image1 = AssetImage('assets/images/dude1.jpg');
        image2 = AssetImage('assets/images/dude2.jpg');
      } else if (userData?['gender'] == 'Female') {
        image1 = AssetImage('assets/images/lady1.jpg');
        image2 = AssetImage('assets/images/lady2.jpg');
      }
      return Scaffold(
        body: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(
                height: 70,
              ),
              Text(
                'What is your goal?',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  color: const Color.fromARGB(176, 255, 255, 255),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      _highLight(0);
                      print('Lewy');
                    },
                    child: Column(
                      children: [
                        Container(
                          height: 400,
                          width: 140,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                image: image1,
                              ),
                              border: Border.all(width: 2),
                              borderRadius: BorderRadius.circular(20)),
                        ),
                        Text(
                          'Better Shape',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                            color: _isBetterShapePressed
                                ? const Color(0xff7632D0)
                                : const Color.fromARGB(176, 255, 255, 255),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                  GestureDetector(
                    onTap: () {
                      _highLight(1);
                      print('Prawy');
                    },
                    child: Column(
                      children: [
                        Container(
                          height: 400,
                          width: 140,
                          decoration: BoxDecoration(
                              image: DecorationImage(image: image2),
                              border: Border.all(width: 2),
                              borderRadius: BorderRadius.circular(20)),
                        ),
                        Text(
                          'Lose Fat',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                            color: _isLoseFatPressed
                                ? const Color(0xff7632D0)
                                : const Color.fromARGB(176, 255, 255, 255),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              Text(
                'How advanced are you?',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  color: const Color.fromARGB(176, 255, 255, 255),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const RoundedCheckbox(),
              const SizedBox(
                height: 30,
              ),
              ButtonBP(
                buttonText: 'Finish',
                onClick: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    userDataProvider.updateUserData2(
                      goal: _enteredGoal.toString(),
                      level: _enteredLevel.toString(),
                    );
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeScreenWidget(),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      );
    }
  }
}

class RoundedCheckbox extends StatefulWidget {
  const RoundedCheckbox({super.key});

  @override
  State<RoundedCheckbox> createState() => _RoundedCheckboxState();
}

class _RoundedCheckboxState extends State<RoundedCheckbox> {
  bool _isBeginner = false;
  bool _isAdvanced = false;
  bool _isMaster = false;

  void _highLight(int index) {
    setState(() {
      if (index == 0) {
        _isBeginner = true;
        _isAdvanced = false;
        _isMaster = false;
      } else if (index == 1) {
        _isBeginner = false;
        _isAdvanced = true;
        _isMaster = false;
      } else if (index == 2) {
        _isBeginner = false;
        _isAdvanced = false;
        _isMaster = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              GestureDetector(
                onTap: () {
                  _highLight(0);
                },
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: _isBeginner
                        ? const Color(0xff7632D0)
                        : const Color.fromARGB(20, 244, 67, 54),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Icon(
                    Icons.circle_outlined,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
              ),
              Text(
                'Beginner',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: const Color.fromARGB(176, 255, 255, 255),
                ),
              ),
            ],
          ),
          Column(
            children: [
              GestureDetector(
                onTap: () {
                  _highLight(1);
                },
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: _isAdvanced
                        ? const Color(0xff7632D0)
                        : const Color.fromARGB(20, 244, 67, 54),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Icon(
                    Icons.circle_outlined,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
              ),
              Text(
                'Advanced',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: const Color.fromARGB(176, 255, 255, 255),
                ),
              ),
            ],
          ),
          Column(
            children: [
              GestureDetector(
                onTap: () {
                  _highLight(2);
                },
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: _isMaster
                        ? const Color(0xff7632D0)
                        : const Color.fromARGB(20, 244, 67, 54),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Icon(
                    Icons.circle_outlined,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
              ),
              Text(
                'Pro',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: const Color.fromARGB(176, 255, 255, 255),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
