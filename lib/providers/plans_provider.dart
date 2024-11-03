import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gymapp/models/plans.dart';

class PlanProvider extends ChangeNotifier {
  final List<Plan> plans = [];

  Future<void> getPlans() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    final planReference = await firestore.collection('plans').get();

    for (final doc in planReference.docs) {
      Map<String, dynamic> documentData = doc.data();
      documentData['id'] = doc.id;

      final Plan plan = Plan.fromJson(documentData);
      plans.add(plan);
    }
    notifyListeners();
  }
}
