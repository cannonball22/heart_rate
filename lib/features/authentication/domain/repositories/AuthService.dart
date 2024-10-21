import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../../Data/Model/App User/app_user.model.dart';
import '../../../../Data/Repositories/user.repo.dart';
import '../../../../core/Services/Contexter/contexter.service.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<bool> signUpWithEmailAndPassword({
    required AppUser appUser,
    required String password,
    required BuildContext context,
  }) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: appUser.email,
        password: password,
      );
      appUser.id = userCredential.user!.uid;
      await AppUserRepo().createSingle(
        appUser,
        itemId: userCredential.user!.uid,
      );

      return true;
    } catch (e) {
      debugPrint("$e");
      final snackBar = SnackBar(
        content: Text(
          'Error: ${e.toString()}',
          style: TextStyle(
            color: Theme.of(context).colorScheme.onError,
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.error,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        padding: const EdgeInsets.all(16),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);

      return false;
    }
  }

  Future<User?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-credential') {
        final snackBar = SnackBar(
          content: Text(
            'The credential that you have provided are not correct.',
            style: TextStyle(
              backgroundColor:
                  Theme.of(Contexter.currentContext).colorScheme.error,
            ),
          ),
          backgroundColor:
              Theme.of(Contexter.currentContext).colorScheme.onError,
        );

        ScaffoldMessenger.of(Contexter.currentContext).showSnackBar(snackBar);
      }
      return null;
    } catch (e) {
      debugPrint('Sign in failed: $e');
      return null;
    }
  }

  Stream<User?> isUserLoggedIn() {
    return _auth.authStateChanges();
  }

  String getCurrentUserId() {
    User? user = _auth.currentUser;
    if (user != null) {
      return user.uid;
    } else {
      return '';
    }
  }

  Future<void> signOut(BuildContext context) async {
    try {
      await _auth.signOut();
    } catch (e) {
      print('Sign out failed: $e');
    }
  }
}
