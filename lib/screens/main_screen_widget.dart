import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gymapp/gen/assets.gen.dart';
import 'package:gymapp/screens/exercise_screen.dart';
import 'package:gymapp/screens/history_screen.dart';
import 'package:gymapp/screens/home_screen.dart';
import 'package:gymapp/screens/plan_screen.dart';
import 'package:gymapp/screens/profile_screen.dart';

class MainScreenWidget extends StatefulWidget {
  const MainScreenWidget({super.key});

  @override
  State<MainScreenWidget> createState() => _MainScreenWidgetState();
}

class _MainScreenWidgetState extends State<MainScreenWidget> {
  int currentPageIndex = 2;
  final List<Color> gradientColors = [
    const Color(0xff5328D4),
    const Color(0xff7632D0)
  ];
  @override
  Widget build(BuildContext context) {
    //final ThemeData theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 13, 14, 14),
        title: const Text(
          'Home',
          style: TextStyle(color: Color(0xffACA3A5)),
        ),
      ),
      bottomNavigationBar: NavigationBar(
        backgroundColor: const Color(0xff161818),
        destinations: <Widget>[
          BottomNavItem(
            svgAssetPath: Assets.svg.profileIcon,
            nazwa: 'Profile',
            onclick: () {
              setState(() {
                currentPageIndex = 0;
              });
            },
            isClicked: currentPageIndex == 0,
          ),
          BottomNavItem(
            //icon: Icon(Icons.access_time_rounded),
            svgAssetPath: Assets.svg.historyIcon,
            nazwa: 'History',
            onclick: () {
              setState(() {
                currentPageIndex = 1;
              });
            },
            isClicked: currentPageIndex == 1,
          ),
          BottomNavItem(
            svgAssetPath: Assets.svg.homeIcon,
            nazwa: 'Home',
            onclick: () {
              setState(() {
                currentPageIndex = 2;
              });
            },
            isClicked: currentPageIndex == 2,
          ),
          BottomNavItem(
            svgAssetPath: Assets.svg.plansIcon,
            nazwa: 'Plans',
            onclick: () {
              setState(() {
                currentPageIndex = 3;
              });
            },
            isClicked: currentPageIndex == 3,
          ),
          BottomNavItem(
            svgAssetPath: Assets.svg.exerciseIcon,
            nazwa: 'Exercise',
            onclick: () {
              setState(() {
                currentPageIndex = 4;
              });
            },
            isClicked: currentPageIndex == 4,
          ),
        ],
      ),
      body: <Widget>[
        const ProfileScreen(),
        const HistoryScreen(),
        const HomeScreen(),
        const PlanScreen(),
        const ExerciseScreen(),
      ][currentPageIndex],
    );
  }
}

class BottomNavItem extends StatelessWidget {
  const BottomNavItem({
    super.key,
    required this.svgAssetPath,
    required this.nazwa,
    required this.onclick,
    required this.isClicked,
  });

  final bool isClicked;
  final String svgAssetPath;
  final String nazwa;
  final Function() onclick;

  // warunek bool ? prawdziwe to -> colors.red : fałszywe to Colors.black;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        onclick.call();
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ShaderBuilder(
            childW: SvgPicture.asset(
              svgAssetPath,
            ),
            shouldShade: isClicked,
          ),
          const SizedBox(
            height: 5,
          ),
          ShaderBuilder(
            childW: Text(
              nazwa,
              style: const TextStyle(
                color: Color(0xff868495),
              ),
            ),
            shouldShade: isClicked,
          ),
        ],
      ),
    );
  }
}

class ShaderBuilder extends StatelessWidget {
  const ShaderBuilder({
    super.key,
    required this.childW,
    required this.shouldShade,
    this.gradientColors = const [Color(0xff5328D4), Color(0xff7632D0)],
  });

  final Widget childW;
  final bool shouldShade;
  final List<Color> gradientColors;

  @override
  Widget build(BuildContext context) {
    return shouldShade
        ? ShaderMask(
            blendMode: BlendMode.srcIn,
            shaderCallback: (Rect bounds) {
              return LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: gradientColors)
                  .createShader(bounds);
            },
            child: childW,
          )
        : childW;
  }
}
