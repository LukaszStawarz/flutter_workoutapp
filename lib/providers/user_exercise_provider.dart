import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gymapp/models/subplan.dart';
import 'package:gymapp/models/user_exercise.dart';

class UserExerciseProvider extends ChangeNotifier {
  final _firestore = FirebaseFirestore.instance;
  final _firebaseAuth = FirebaseAuth.instance;

  String currentUserWorkout = '';

  final List<SubExercise> subExercises = [];

  Future<void> startExercise({
    required String planId,
    required int subPlanIndex,
  }) async {
    if (_firebaseAuth.currentUser == null) {
      print('hallo');
      return;
    }
    currentUserWorkout = '';
    subExercises.clear();

    final doc = await _firestore.collection('user_workout').add(
          UserExercise(
            DateTime.now(),
            planId,
            subPlanIndex,
            [],
            _firebaseAuth.currentUser!.uid,
          ).toJson(),
        );
    print('hallo3');

    //! Zapamiętaj nr dokumentu w kolekcji
    currentUserWorkout = doc.id;
  }

  Future<void> endSubExercise(SubExercise subExercise) async {
    if (currentUserWorkout.isEmpty) {
      return;
    }

    subExercises.add(subExercise);

    await _firestore.collection('user_workout').doc(currentUserWorkout).update({
      'subExercises': subExercises.map(
        (e) {
          return e.toJson();
        },
      ),
    });
  }

  Future<void> onCanceled() async {
    await _firestore
        .collection('user_workout')
        .doc(currentUserWorkout)
        .delete();
    currentUserWorkout = '';
    subExercises.clear();
  }
}
