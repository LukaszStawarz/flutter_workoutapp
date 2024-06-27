import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gymapp/models/breathing.dart';
import 'package:gymapp/models/cardio.dart';
import 'package:gymapp/models/exercises.dart';
import 'package:gymapp/models/strength.dart';
import 'package:gymapp/models/warmup.dart';
import 'package:gymapp/models/yoga.dart';

class ExerciseProvider extends ChangeNotifier {
  final List<Exercises> exercisesList = [];
  final List<Cardio> cardioList = [];
  final List<Strength> strengthList = [];
  final List<WarmUp> warmUpList = [];
  final List<Breathing> breathingList = [];
  final List<Yoga> yogaList = [];

  Future<void> getExercises() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    final exerciseReference = await firestore.collection('exercises').get();

    for (final doc in exerciseReference.docs) {
      Map<String, dynamic> documentData = doc.data();
      // documentData['id'] = doc.id;
      // List<Exercises> getYoga() {
      //   return exercisesList
      //       .where(
      //         (element) => element.type == 'Yoga',
      //       )
      //       .toList();
      if (documentData['type'] == 'Cardio') {
        final Cardio cardio = Cardio.fromJson(documentData);
        cardioList.add(cardio);
      } else if (documentData['type'] == 'Strength') {
        final Strength strength = Strength.fromJson(documentData);
        strengthList.add(strength);
      } else if (documentData['type'] == 'Warmup') {
        final WarmUp warmUp = WarmUp.fromJson(documentData);
        warmUpList.add(warmUp);
      } else if (documentData['type'] == 'Breathing') {
        final Breathing breathing = Breathing.fromJson(documentData);
        breathingList.add(breathing);
      } else if (documentData['type'] == 'Yoga') {
        final Yoga yoga = Yoga.fromJson(documentData);
        yogaList.add(yoga);
      }

      final Exercises exercises = Exercises.fromJson(documentData);
      exercisesList.add(exercises);
    }
    notifyListeners();
  }
}
