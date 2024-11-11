import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gymapp/providers/user_data_getter_provider.dart';
import 'package:gymapp/providers/user_data_provider.dart';
import 'package:gymapp/screens/main_screen_widget.dart';
import 'package:gymapp/widgets/button_bp.dart';
import 'package:provider/provider.dart';

class SuDetailsScreen2 extends StatefulWidget {
  const SuDetailsScreen2({super.key});

  @override
  State<SuDetailsScreen2> createState() => _SuDetailsScreen2State();
}

class _SuDetailsScreen2State extends State<SuDetailsScreen2> {
  bool _isBetterShapePressed = false;
  bool _isLoseFatPressed = false;
  String enteredGoal = '';
  String enteredLevel1 = '';
  void _highLight(int index) {
    setState(() {
      if (index == 0) {
        _isBetterShapePressed = true;
        _isLoseFatPressed = false;
        enteredGoal = 'Better Shape';
      } else if (index == 1) {
        _isBetterShapePressed = false;
        _isLoseFatPressed = true;
        enteredGoal = 'Lose Fat';
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

  @override
  Widget build(BuildContext context) {
    final userDataGetterProvider = Provider.of<UserDataGetterProvider>(context);
    final Function(String?) onSaved;
    if (userDataGetterProvider.userData == null) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else {
      final userData = userDataGetterProvider.userData;
      if (userData?['gender'] == 'Male') {
        image1 = const AssetImage('assets/images/dude1.jpg');
        image2 = const AssetImage('assets/images/dude2.jpg');
      } else if (userData?['gender'] == 'Female') {
        image1 = const AssetImage('assets/images/lady1.jpg');
        image2 = const AssetImage('assets/images/lady2.jpg');
      }
      return Scaffold(
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
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
                        //print('Lewy');
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
                        //print('Prawy');
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
                RoundedCheckbox(
                  validator: (p0) {
                    if (p0 == null || p0.trim().isEmpty) {
                      return 'Please choose your goal.';
                    }
                    return null;
                  },
                  enteredLevel: (value) {
                    enteredLevel1 = value;
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                ButtonBP(
                  buttonText: 'Finish',
                  onClick: () {
                    if (enteredGoal.isEmpty || enteredLevel1.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content:
                              Text('Please select both your goal and level'),
                        ),
                      );
                    } else if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      userDataProvider.updateUserData2(
                        goal: enteredGoal,
                        level: enteredLevel1,
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
        ),
      );
    }
  }
}

class RoundedCheckbox extends StatefulWidget {
  RoundedCheckbox(
      {super.key, required this.enteredLevel, required this.validator});
  final ValueChanged<String> enteredLevel;
  final String? Function(String?)? validator;
  @override
  State<RoundedCheckbox> createState() => _RoundedCheckboxState();
}

class _RoundedCheckboxState extends State<RoundedCheckbox> {
  bool _isBeginner = false;
  bool _isAdvanced = false;
  bool _isPro = false;
  //String enteredLevel = '';
  void _highLight(int index) {
    setState(() {
      if (index == 0) {
        _isBeginner = true;
        _isAdvanced = false;
        _isPro = false;
        widget.enteredLevel('Beginner');
      } else if (index == 1) {
        _isBeginner = false;
        _isAdvanced = true;
        _isPro = false;
        widget.enteredLevel('Advanced');
      } else if (index == 2) {
        _isBeginner = false;
        _isAdvanced = false;
        _isPro = true;
        widget.enteredLevel('Pro');
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
                    color: _isPro
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
