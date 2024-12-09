import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gymapp/models/subplan.dart';
import 'package:gymapp/models/exercises.dart';
import 'package:gymapp/models/user_exercise.dart';
import 'package:gymapp/providers/exercise_provider.dart';
import 'package:gymapp/providers/user_exercise_provider.dart';
import 'package:gymapp/screens/plans_screens/plan_details.dart';
import 'package:provider/provider.dart';

class StartedPlanScreen extends StatefulWidget {
  const StartedPlanScreen({
    super.key,
    required this.plan,
  });

  final SubPlan plan;

  @override
  State<StartedPlanScreen> createState() => _StartedPlanScreenState();
}

class _StartedPlanScreenState extends State<StartedPlanScreen> {
  int indexOfCurrentExercise = 0;
  bool _isCompleted = false;
  late final List<Exercises> exercises;
  @override
  void initState() {
    exercises = context.read<ExerciseProvider>().exercisesList;

    super.initState();
  }

  void _skipExercise() {
    context.read<UserExerciseProvider>().endSubExercise(
          SubExercise(
            subExerciseIndex: indexOfCurrentExercise,
            wasSkipped: true,
            // do wyliczenia
            duration: 54,
          ),
        );
    if (indexOfCurrentExercise + 1 >= widget.plan.exercises.length) {
      if (!_isCompleted) {
        _isCompleted = true;
        _showCompletionNotification();
      }
    } else {
      indexOfCurrentExercise++;
    }
    setState(() {});
  }

  void _showCompletionNotification() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Gratulacje!'),
          content: const Text('Ukończyłeś cały plan ćwiczeń.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _moveToNextExercise() {
    setState(() {
      context.read<UserExerciseProvider>().endSubExercise(
            SubExercise(
              subExerciseIndex: indexOfCurrentExercise,
              wasSkipped: false,
              duration: 122,
            ),
          );
      if (indexOfCurrentExercise + 1 >= widget.plan.exercises.length) {
        if (!_isCompleted) {
          _isCompleted = true;
          _showCompletionNotification();
        }
      } else {
        indexOfCurrentExercise++;
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    // return PopScope(
    //   onPopInvoked: (didPop) {
    //     context.read<UserExerciseProvider>().onCanceled();
    //   },
    // child:
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.plan.planTitle,
          style: const TextStyle(
            color: Color(0xffACA3A5),
          ),
        ),
      ),
      body: CountdownWidget(
        seconds: 3,
        plan: widget.plan,
        indexOfCurrentExercise: indexOfCurrentExercise,
        child: _buildMainContent(),
      ),
    );
  }

  Widget _buildMainContent() {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25),
      child: Column(
        children: [
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: () {
                  context.read<UserExerciseProvider>().onCanceled();
                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent),
                child: const Icon(Icons.close),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent),
                child: const Icon(Icons.format_line_spacing_rounded),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
              padding: const EdgeInsets.only(left: 20, right: 20),
              width: 370,
              height: 300,
              child: Image.network(
                  getExercises(widget.plan.exercises[indexOfCurrentExercise])
                      .videourl)),
          const SizedBox(
            height: 200,
          ),
          CountdownExerciseTimerWidget(
            initialSeconds: 3,
            indexOfCurrentExercise: indexOfCurrentExercise,
            onEnd: _moveToNextExercise,
            isCompleted: _isCompleted,
          ),
          const SizedBox(
            height: 60,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  children: [
                    FittedBox(
                      child: Text(
                        widget.plan.exercises[indexOfCurrentExercise],
                        style: const TextStyle(fontSize: 30),
                      ),
                    ),
                    if (indexOfCurrentExercise + 1 <
                        widget.plan.exercises.length)
                      Text(
                        widget.plan.exercises[indexOfCurrentExercise + 1],
                        style: const TextStyle(fontSize: 16),
                      )
                    else
                      const Text('No more exercises')
                  ],
                ),
              ),
              const SizedBox(width: 12.0),
              ElevatedButton(
                onPressed: () {
                  _skipExercise();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                ),
                child: const Icon(Icons.skip_next),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Exercises getExercises(String id) {
    return exercises.firstWhere(
      (element) => element.id == id,
    );
  }
}

// ignore: must_be_immutable
class CountdownWidget extends StatefulWidget {
  CountdownWidget({
    super.key,
    required this.child,
    required this.seconds,
    required this.plan,
    required this.indexOfCurrentExercise,
  });

  final Widget child;
  int seconds;
  final SubPlan plan;
  final int indexOfCurrentExercise;
  @override
  CountdownWidgetState createState() => CountdownWidgetState();
}

class CountdownWidgetState extends State<CountdownWidget>
    with SingleTickerProviderStateMixin {
  late int _countdown;
  late Timer _timer;
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _showMainContent = false;
  late int index = widget.indexOfCurrentExercise;

  @override
  void didUpdateWidget(covariant CountdownWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (index != widget.indexOfCurrentExercise) {
      index = widget.indexOfCurrentExercise;
      _showMainContent = false;
      _countdown = widget.seconds;
      startCountdown();
    }
  }

  @override
  void initState() {
    super.initState();
    _countdown = widget.seconds;

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat(reverse: true);

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

  @override
  Widget build(BuildContext context) {
    if (index == widget.plan.exercises.length) {
      return const SizedBox();
    }

    return _showMainContent
        ? widget.child
        : Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              children: [
                Hero(
                  tag: widget.plan.image,
                  child: Container(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    width: 370,
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        opacity: 0.6,
                        image: NetworkImage(widget.plan.image),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          widget.plan.planTitle,
                          style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 30,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Text(
                  textAlign: TextAlign.center,
                  'Prepare yourself for the exercise: ',
                  style: GoogleFonts.poppins(
                    color: const Color(0xffACA3A5),
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  textAlign: TextAlign.center,
                  widget.plan.exercises.elementAt(index),
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontWeight: FontWeight.w800,
                    fontSize: 25,
                  ),
                ),
                const SizedBox(
                  height: 80,
                ),
                Center(
                  child: ScaleTransition(
                    scale: _animation,
                    child: Text(
                      '$_countdown',
                      style: const TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
  }

  void startCountdown() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
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
}

class CountdownExerciseTimerWidget extends StatefulWidget {
  final int initialSeconds;
  final int indexOfCurrentExercise;
  final VoidCallback onEnd;
  bool isCompleted;
  CountdownExerciseTimerWidget({
    super.key,
    required this.initialSeconds,
    required this.indexOfCurrentExercise,
    required this.onEnd,
    required this.isCompleted,
  });

  @override
  _CountdownExerciseTimerWidget createState() =>
      _CountdownExerciseTimerWidget();
}

class _CountdownExerciseTimerWidget
    extends State<CountdownExerciseTimerWidget> {
  late int _seconds;
  Timer? _timer;
  bool _isFinished = false;

  @override
  void initState() {
    super.initState();
    _seconds = widget.initialSeconds;
    if (!widget.isCompleted) {
      _startCountdown();
    }
  }

  void _startCountdown() {
    if (!widget.isCompleted) {
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        if (mounted && !widget.isCompleted) {
          setState(() {
            if (_seconds > 0) {
              _seconds--;
            } else {
              // _isFinished = true;
              _timer?.cancel();
              widget.onEnd();
            }
          });
        } else {
          _timer?.cancel();
        }
      });
    }
  }

  void stopTimer() {
    _timer?.cancel();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  int indexOfCurrentExercise = 0;
  @override
  Widget build(BuildContext context) {
    if (_isFinished) {
      widget.onEnd();
    }

    return Center(
      child: Text(
        '$_seconds',
        style: const TextStyle(
          fontSize: 48,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
