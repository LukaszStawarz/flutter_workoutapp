import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  bool isLoading = false;
  Future<void> getExercises() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    isLoading = true;
    notifyListeners();
    final exerciseReference = await firestore.collection('exercises').get();

    for (final doc in exerciseReference.docs) {
      Map<String, dynamic> documentData = doc.data();

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
      exercises.id = doc.id;
      exercisesList.add(exercises);
    }
    // log('${exercisesList.map(
    //   (e) {
    //     return {
    //       '\'description\'': '\'${e.description}\'',
    //       '\'howto\'': '\'${e.howto}\'',
    //       '\'title\'': '\'${e.title}\'',
    //       '\'type\'': '\'${e.type}\'',
    //     };
    //   },
    // ).toList()}');

    isLoading = false;
    notifyListeners();
  }
}
