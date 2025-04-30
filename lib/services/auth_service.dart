import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import '../models/user_model.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Create UserModel from Firebase User
  UserModel? _userFromFirebase(User? user) {
    return user != null ? UserModel.fromFirebase(user) : null;
  }

  // Auth state change stream
  Stream<UserModel?> get userStream {
    return _auth.authStateChanges().map(_userFromFirebase);
  }

  // Get current user
  UserModel? get currentUser {
    return _userFromFirebase(_auth.currentUser);
  }

  // Sign in with email and password
  Future<UserModel?> signInWithEmailAndPassword(String email, String password) async {
    try {
      final UserCredential result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return _userFromFirebase(result.user);
    } catch (e) {
      debugPrint('Sign in error: $e');
      rethrow;
    }
  }

  // Register with email and password
  Future<UserModel?> registerWithEmailAndPassword(String email, String password) async {
    try {
      final UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return _userFromFirebase(result.user);
    } catch (e) {
      debugPrint('Registration error: $e');
      rethrow;
    }
  }

  // Reset password
  Future<void> resetPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      debugPrint('Password reset error: $e');
      rethrow;
    }
  }

  // Sign out
  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      debugPrint('Sign out error: $e');
      rethrow;
    }
  }
}
