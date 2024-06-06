// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gymapp/gen/assets.gen.dart';
import 'package:gymapp/model/button_bp.dart';
import 'package:gymapp/screens/login/log_in_screen.dart';
import 'package:gymapp/screens/profile_sub_screens/achievements_screen.dart';
import 'package:gymapp/screens/profile_sub_screens/contact_us_screen.dart';
import 'package:gymapp/screens/profile_sub_screens/personal_data_screen.dart';
import 'package:gymapp/screens/profile_sub_screens/privacy_policy_screen.dart';
import 'package:gymapp/screens/profile_sub_screens/workout_progress_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // final List<Color> gradientColors = [
    //   const Color(0xff5328D4),
    //   const Color(0xff7632D0)
    // ];
    //const Color greyTextColor = Color.fromARGB(255, 136, 133, 134);
// final void Function() onSelectScreen;

    void _selectedContactUsScreen() {
      Navigator.push(context,
          MaterialPageRoute(builder: (ctx) => const ContactUsScreen()));
    }

    void _selectedPersonalDataScreen() {
      Navigator.push(context,
          MaterialPageRoute(builder: (ctx) => const PersonalDataScreen()));
    }

    void _selectedAchievementsScreen() {
      Navigator.push(context,
          MaterialPageRoute(builder: (ctx) => const AchievementsScreen()));
    }

    void _selectedWorkoutProgressScreen() {
      Navigator.push(context,
          MaterialPageRoute(builder: (ctx) => const WorkoutProgressScreen()));
    }

    void _selectedPrivacyPolicyScreen() {
      Navigator.push(context,
          MaterialPageRoute(builder: (ctx) => const PrivacyPolicyScreen()));
    }

    void _selectedLogOutButton() {
      Navigator.push(
          context, MaterialPageRoute(builder: (ctx) => const LogInScreen()));
    }

    return SizedBox.expand(
        child: Column(
      children: [
        const SizedBox(height: 30),
        CircleAvatar(
          radius: 100,
          child: Image.asset('assets/images/profile_image.png'),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          '<name> <surname>',
          style: GoogleFonts.poppins(
            color: const Color.fromARGB(255, 136, 133, 134),
            fontWeight: FontWeight.w500,
            fontSize: 25,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          width: 330,
          //color: const Color.fromARGB(255, 44, 46, 59),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Account',
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 10,
              ),
              ProfileButton(
                name: 'Personal Data',
                svgPath: Assets.svg.personalDataIcon,
                onclick: () {
                  _selectedPersonalDataScreen();
                },
              ),
              const SizedBox(
                height: 7,
              ),
              ProfileButton(
                name: 'Achievements',
                svgPath: Assets.svg.achievementIcon,
                onclick: () {
                  _selectedAchievementsScreen();
                },
              ),
              const SizedBox(
                height: 7,
              ),
              ProfileButton(
                name: 'Workout Progress',
                svgPath: Assets.svg.workoutProgressIcon,
                onclick: () {
                  _selectedWorkoutProgressScreen();
                },
              ),
              const SizedBox(
                height: 40,
              ),
              Text(
                'Other',
                style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 20),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 10,
              ),
              ProfileButton(
                name: 'Contact Us',
                svgPath: Assets.svg.contactUsIcon,
                onclick: () {
                  _selectedContactUsScreen();
                },
              ),
              const SizedBox(
                height: 7,
              ),
              ProfileButton(
                name: 'Privacy Policy',
                svgPath: Assets.svg.privacyPolicyIcon,
                onclick: () {
                  _selectedPrivacyPolicyScreen();
                },
              ),
              const SizedBox(
                height: 80,
              ),
              Center(
                child: ButtonBP(
                  buttonText: 'Log Out',
                  onClick: () {
                    _selectedLogOutButton();
                  },
                  isBig: false,
                ),
              ),
              // ButtonBP.smallRed(buttonText: 'ButtonText', onClick: () {}),
              // ButtonBP.bigRed(buttonText: 'ButtonText', onClick: () {}),
            ],
          ),
        ),
      ],
    ));
  }
}

class ProfileButton extends StatelessWidget {
  const ProfileButton({
    super.key,
    required this.svgPath,
    required this.name,
    required this.onclick,
  });

  static const Color greyTextColor = Color.fromARGB(255, 136, 133, 134);
  final String svgPath;
  final String name;
  final Function() onclick;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        onclick.call();
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SvgPicture.asset(svgPath),
              const SizedBox(
                width: 10,
              ),
              Text(
                name,
                style: GoogleFonts.poppins(
                  color: const Color.fromARGB(255, 136, 133, 134),
                  fontWeight: FontWeight.w300,
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          const Icon(
            Icons.arrow_forward_ios_rounded,
            size: 20,
            color: greyTextColor,
          ),
        ],
      ),
    );

    //   child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
    //     SvgPicture.asset(svgPath),
    //     const SizedBox(
    //       width: 10,
    //     ),
    //     Text(
    //       name,
    //       style: GoogleFonts.poppins(
    //           color: const Color.fromARGB(255, 136, 133, 134),
    //           fontWeight: FontWeight.w300,
    //           fontSize: 16),
    //       textAlign: TextAlign.center,
    //     ),
    //     const Icon(
    //       Icons.arrow_forward_ios_rounded,
    //       size: 20,
    //       color: greyTextColor,
    //     )
    //   ]),
    // );
  }
}
