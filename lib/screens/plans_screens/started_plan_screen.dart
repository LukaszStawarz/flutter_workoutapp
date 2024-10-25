import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gymapp/models/plans.dart';
import 'package:gymapp/providers/plans_provider.dart';
import 'package:provider/provider.dart';

class StartedPlanScreen extends StatelessWidget {
  const StartedPlanScreen(
      {required this.planTitle, super.key, required this.plan});
  final String planTitle;
  final Plan plan;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text(planTitle, style: const TextStyle(color: Color(0xffACA3A5))),
      ),
      body: CountdownWidget(
        seconds: 10, // Liczba sekund odliczania
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Główna zawartość ekranu',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            // Dodaj inne widżety, które mają się pojawić po zakończeniu odliczania
          ],
        ),
      ),
    );
  }
}

class CountdownWidget extends StatefulWidget {
  CountdownWidget({required this.child, required this.seconds});
  final Widget child; // Główna zawartość do wyświetlenia po odliczaniu
  int seconds; // Ilość sekund do odliczania, domyślnie 5

  @override
  _CountdownWidgetState createState() => _CountdownWidgetState();
}

class _CountdownWidgetState extends State<CountdownWidget>
    with TickerProviderStateMixin {
  late int _countdown;
  late Timer _timer;
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _showMainContent = false;

  @override
  void initState() {
    super.initState();
    _countdown = widget.seconds;
    // Inicjalizacja AnimationController
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    )..repeat(reverse: true);

    // Definicja animacji skali
    _animation = TweenSequence([
      TweenSequenceItem(
        tween: Tween<double>(begin: 1.0, end: 2.0),
        weight: 0.5,
      ),
      TweenSequenceItem(
        tween: Tween<double>(begin: 2.0, end: 1.0),
        weight: 0.5,
      ),
    ]).animate(_controller);
    startCountdown();
  }

  void startCountdown() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_countdown > 1) {
          _countdown--;
        } else {
          _showMainContent = true;
          _timer.cancel();
          _controller.stop();
        }
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _showMainContent
        ? widget.child
        : Center(
            child: ScaleTransition(
              scale: _animation,
              child: Text(
                '$_countdown',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
          );
  }
}
