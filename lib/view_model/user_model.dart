import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserModel extends ChangeNotifier {
  bool isLoading = false;
  String? handleName;

  void startLoading() {
    isLoading = true;
    notifyListeners();
  }

  void endLoading() {
    isLoading = false;
    notifyListeners();
  }

  void fetchUser() {
    final user = FirebaseAuth.instance.currentUser;
    final String? userId = user?.uid;
    final docRef =
        FirebaseFirestore.instance.collection('user').doc(userId).get();
    this.handleName = '';
  }
}
