import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gymapp/models/plans.dart';
import 'package:gymapp/models/user_plan.dart';

class PlanProvider extends ChangeNotifier {
  final List<Plan> plans = [];
  final List<UserPlan> userPlan = [];
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final String currentUser = FirebaseAuth.instance.currentUser?.uid ?? '';
  Future<void> getUserPlans() async {
    userPlan.clear();
    final userPlanReference = await firestore
        .collection('userPlans')
        .where('userId', isEqualTo: currentUser)
        .get();
    for (final doc in userPlanReference.docs) {
      Map<String, dynamic> documentData = doc.data();
      documentData['id'] = doc.id;
      log('$documentData');
      final UserPlan plan = UserPlan.fromJson(documentData);
      userPlan.add(plan);
    }
    notifyListeners();
  }

  Future<void> getPlans() async {
    // final String currentUser = firebaseAuth.currentUser?.uid ?? '';
    final planReference = await firestore.collection('plans').get();

    for (final doc in planReference.docs) {
      Map<String, dynamic> documentData = doc.data();
      documentData['id'] = doc.id;
      log('$documentData');
      final Plan plan = Plan.fromJson(documentData);
      plans.add(plan);
    }
    notifyListeners();
  }

  // Future<void> addPlan(Plan newPlan) async {
  //   try {
  //     final docRef = await firestore.collection('plans').add(newPlan.toJson());
  //     newPlan.id = docRef.id;
  //     plans.add(newPlan);
  //     notifyListeners();
  //     log('Plan dodany: ${newPlan.title}');
  //   } catch (error) {
  //     log('Dodawanie nie powiodło się: $error');
  //   }
  // }
}
