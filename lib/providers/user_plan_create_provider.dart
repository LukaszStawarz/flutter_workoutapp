import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gymapp/models/user_plan.dart';

class UserPlanCreateProvider extends ChangeNotifier {
  final _firestore = FirebaseFirestore.instance;
  final _firebaseAuth = FirebaseAuth.instance;
  String? userId;

  final List<String> selectedIds = [];

  UserPlanCreateProvider() {
    _initializeUser();
  }
  Future<void> _initializeUser() async {
    final currentUser = _firebaseAuth.currentUser;
    if (currentUser == null) {
      throw Exception('Sesja wygasła. Zaloguj się ponownie.');
    } else {
      userId = currentUser.uid;
    }
  }

  void addToSelected(String id) {
    if (!selectedIds.contains(id)) {
      selectedIds.add(id);
      notifyListeners();
    }
  }

  void removeFromSelected(String id) {
    selectedIds.remove(id);
    notifyListeners();
  }

  Future<void> savePlan(String planName, String description) async {
    if (userId == null) {
      throw Exception('Sesja wygasła. Zaloguj się ponownie.');
    }

    final newPlan = UserPlan(
      planName,
      description,
      selectedIds,
      userId!,
    );
    try {
      await _firestore.collection('userPlans').add(newPlan.toJson());
      selectedIds.clear();
      notifyListeners();
    } catch (error) {
      rethrow;
    }

    // Future<List<Map<String, dynamic>>> getUserPlans() async {
    //   try {
    //     final user = _firebaseAuth.currentUser;
    //     if (user == null) {
    //       throw Exception('Sesja wygasła. Zaloguj się ponownie.');
    //     }
    //     final userId = user.uid;
    //     final querySnapshot = await _firestore
    //         .collection('userPlans')
    //         .where('userId', isEqualTo: userId)
    //         .get();
    //     return querySnapshot.docs.map((doc) => doc.data()).toList();
    //   } catch (error) {
    //     rethrow;
    //   }
    // }
  }
}
