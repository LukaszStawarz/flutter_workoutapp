import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gymapp/models/user_exercise.dart';

class UserWorkoutProvider extends ChangeNotifier {
  final List<UserExercise> userWorkoutList = [];
  bool isLoading = false;
  Future<void> getUserWorkout() async {
    isLoading = true;
    notifyListeners();
    userWorkoutList.clear();
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    final String userId = FirebaseAuth.instance.currentUser!.uid;
    final userWorkoutReference = await firestore
        .collection('user_workout')
        .where('userId', isEqualTo: userId)
        .get();

    for (final doc in userWorkoutReference.docs) {
      Map<String, dynamic> documentData = doc.data();
      documentData['id'] = doc.id;

      final UserExercise userExercise = UserExercise.fromJson(documentData);
      userWorkoutList.add(userExercise);
    }
    isLoading = false;
    notifyListeners();
  }
}
