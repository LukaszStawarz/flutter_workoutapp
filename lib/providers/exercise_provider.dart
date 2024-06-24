import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gymapp/models/breathing.dart';
import 'package:gymapp/models/cardio.dart';
import 'package:gymapp/models/strength.dart';
import 'package:gymapp/models/warmup.dart';
import 'package:gymapp/models/yoga.dart';

class ExerciseProvider extends ChangeNotifier {
  final List<Cardio> cardioList = [];
  final List<Strength> strengthList = [];
  final List<WarmUp> warmUpList = [];
  final List<Breathing> breathingList = [];
  final List<Yoga> yogaList = [];

  Future<void> getExercises() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    final cardioReference = await firestore.collection('cardio').get();
    final yogaReference = await firestore.collection('yoga').get();
    final strengthReference = await firestore.collection('strength').get();
    final warmUpReference = await firestore.collection('warmup').get();
    final breathingReference = await firestore.collection('breathing').get();

    for (final doc in warmUpReference.docs) {
      Map<String, dynamic> documentData = doc.data();
      // documentData['id'] = doc.id;

      final WarmUp warmup = WarmUp.fromJson(documentData);
      warmUpList.add(warmup);
    }
    notifyListeners();

    for (final doc in cardioReference.docs) {
      Map<String, dynamic> documentData = doc.data();
      // documentData['id'] = doc.id;

      final Cardio cardio = Cardio.fromJson(documentData);
      cardioList.add(cardio);
    }
    notifyListeners();
    for (final doc in yogaReference.docs) {
      Map<String, dynamic> documentData = doc.data();
      // documentData['id'] = doc.id;

      final Yoga yoga = Yoga.fromJson(documentData);
      yogaList.add(yoga);
    }
    notifyListeners();
    for (final doc in breathingReference.docs) {
      Map<String, dynamic> documentData = doc.data();
      // documentData['id'] = doc.id;

      final Breathing breathing = Breathing.fromJson(documentData);
      breathingList.add(breathing);
    }
    notifyListeners();

    for (final doc in strengthReference.docs) {
      Map<String, dynamic> documentData = doc.data();
      // documentData['id'] = doc.id;

      final Strength strength = Strength.fromJson(documentData);
      strengthList.add(strength);
    }
    notifyListeners();
  }
}
