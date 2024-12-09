import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gymapp/providers/user_data_getter_provider.dart';
import 'package:provider/provider.dart';

import 'package:fl_chart/fl_chart.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  // if (userDataGetterProvider.userData == null) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: const Text('Profil Użytkownika'),
  //     ),
  //     body: const Center(
  //       child: CircularProgressIndicator(),
  //     ),
  //   );
  @override
  Widget build(BuildContext context) {
    final Map<int, int> exerciseData = {
      1: 3,
      2: 5,
      5: 2,
      10: 7,
      15: 4,
      20: 6,
      25: 8,
    };
    final userDataGetterProvider = Provider.of<UserDataGetterProvider>(context);
    final userData = userDataGetterProvider.userData;
    return userDataGetterProvider.userData == null
        ? Scaffold(
            appBar: AppBar(
              title: const Text('Profil Użytkownika'),
            ),
            body: const Center(
              child: CircularProgressIndicator(),
            ),
          )
        : SizedBox.expand(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Welcome ${userData!['user_name']}',
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xff7632D0), // Kolor wypełnienia
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Last time you finished:',
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xff7632D0), // Kolor wypełnienia
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: 140,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              Card(
                                child: SizedBox(
                                  width: 200,
                                  child: Image.asset(
                                    'assets/images/plan_background_image.jpg',
                                  ),
                                ),
                              ),
                              Card(
                                child: SizedBox(
                                  width: 200,
                                  child: Image.asset(
                                    'assets/images/plan_background_image.jpg',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ), //
                    Column(
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        Text(
                          'Recommended plans for today ',
                          style: GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xff7632D0), // Kolor wypełnienia
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        SizedBox(
                          height: 140,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              Card(
                                child: SizedBox(
                                  width: 200,
                                  child: Image.asset(
                                    'assets/images/plan_background_image.jpg',
                                  ),
                                ),
                              ),
                              Card(
                                child: SizedBox(
                                  width: 200,
                                  child: Image.asset(
                                    'assets/images/plan_background_image.jpg',
                                  ),
                                ),
                              ),
                              Card(
                                child: SizedBox(
                                  width: 200,
                                  child: Image.asset(
                                    'assets/images/plan_background_image.jpg',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: ExerciseChart(exerciseData: exerciseData),
                    )
                  ],
                ),
              ),
            ),
          );
  }
}

class ExerciseChart extends StatelessWidget {
  final Map<int, int>
      exerciseData; // Klucz: dzień miesiąca, Wartość: liczba ćwiczeń

  const ExerciseChart({Key? key, required this.exerciseData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<BarChartGroupData> barGroups = exerciseData.entries
        .map(
          (entry) => BarChartGroupData(
            x: entry.key, // Dzień miesiąca
            barRods: [
              BarChartRodData(
                toY: entry.value.toDouble(), // Liczba ćwiczeń
                color: Colors.purple,
                width: 8,
                borderRadius: BorderRadius.circular(4),
              ),
            ],
          ),
        )
        .toList();

    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Exercise Progress',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 20),
            AspectRatio(
              aspectRatio: 1.7,
              child: BarChart(
                BarChartData(
                  alignment: BarChartAlignment.spaceAround,
                  maxY:
                      10, // Maksymalna liczba ćwiczeń dziennie (dostosuj do danych)
                  minY: 0,
                  titlesData: FlTitlesData(
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        interval: 2,
                        getTitlesWidget: (value, _) => Text('${value.toInt()}'),
                      ),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, _) => Text('${value.toInt()}'),
                      ),
                    ),
                  ),
                  borderData: FlBorderData(
                    show: true,
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  barGroups: barGroups,
                  gridData: FlGridData(show: true),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
