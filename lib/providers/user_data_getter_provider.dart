import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/cupertino.dart';

class UserDataGetterProvider with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  User? _user; // Użytkownik Firebase
  // Dane użytkownika z Firestore
  Map<String, dynamic>? _userData;
  User? get user => _user; // Getter dla użytkownika
  Map<String, dynamic>? get userData =>
      _userData; // Getter dla danych użytkownika

  // Konstruktor, który nasłuchuje zmian w Firebase Authentication
  UserDataGetterProvider() {
    _auth.authStateChanges().listen(_onAuthStateChanged);
  }

  // Funkcja wywoływana po zmianie stanu uwierzytelnienia
  Future<void> _onAuthStateChanged(User? firebaseUser) async {
    _user = firebaseUser;

    if (_user != null) {
      // Jeśli użytkownik jest zalogowany, pobierz jego dane z Firestore
      await _fetchUserData();
    }

    notifyListeners(); // Powiadom o zmianach
  }

  // Funkcja pobierająca dane użytkownika z Firestore
  Future<void> _fetchUserData() async {
    if (_user != null) {
      try {
        DocumentSnapshot<Map<String, dynamic>> snapshot =
            await _firestore.collection('users').doc(_user!.uid).get();

        _userData = snapshot.data(); // Przypisz pobrane dane do _userData
      } catch (e) {
        print('Error fetching user data: $e');
      }
    }
  }

  // Funkcja do wylogowania użytkownika
  Future<void> signOut() async {
    await _auth.signOut();
    _user = null;
    _userData = null;
    notifyListeners();
  }
}
