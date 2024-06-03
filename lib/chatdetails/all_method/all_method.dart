import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../authentication/signin_page.dart';
import '../chat_homepage/chathomepage.dart';
import '../utils.dart';

void signInUser(BuildContext context, String email, String password) async {
  showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      });
  try {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) => Navigator.push(context,
            MaterialPageRoute(builder: (context) => const ChatHomePage())));
  } on FirebaseAuthException catch (e) {
    await exceptionDialog(context, e.toString());
  }
}

void signUpUser(BuildContext context, String email, String password) async {
  try {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) => Navigator.push(
            context, MaterialPageRoute(builder: (context) => SignInPage())));
  } on FirebaseAuthException catch (e) {
    await exceptionDialog(context, e.toString());
  }
}

Future<void> addToFireStoreData(String email, String password) {
  return FirebaseFirestore.instance
      .collection('allUsers')
      .add({'Email': email, "Password": password});
}

// Future<void> deleteUser(String email) {
//   return FirebaseFirestore.instance.doc(email).delete();
// }
