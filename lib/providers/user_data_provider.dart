import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserDataProvider extends ChangeNotifier {
  final _firebaseAuth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  UserCredential? userCredential;

  Future<String> createAccount({
    required String email,
    required String password,
    required String name,
    required String lastName,
    required String phone,
  }) async {
    final userData = await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    await _firestore.collection('users').doc(userData.user!.uid).set(
      {
        'user_name': name,
        'user_lastname': lastName,
        'user_email': email,
        'user_phone_number': phone,
      },
    );

    userCredential = userData;
    notifyListeners();
    return userData.user!.uid;
  }

  Future<void> login({
    required String email,
    required String password,
  }) async {
    final userData = await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    userCredential = userData;

    notifyListeners();
  }

  Future<void> updateUserData({
    required String gender,
    required String dateTime,
    required String weight,
    required String height,
  }) async {
    if (userCredential != null) {
      _firestore.collection('users').doc(userCredential!.user!.uid).set(
        {
          'gender': gender,
          'dateTime': dateTime,
          'weight': weight,
          'height': height,
        },
        SetOptions(merge: true),
      );
    }
  }

  Future<void> updateUserData2({
    required String goal,
    required String level,
  }) async {
    if (userCredential != null) {
      _firestore.collection('users').doc(userCredential!.user!.uid).set(
        {
          'goal': goal,
          'level': level,
        },
        SetOptions(merge: true),
      );
    }
  }
}
