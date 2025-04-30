import 'package:flutter/material.dart';
import '../models/user_model.dart';
import '../services/auth_service.dart';

class AuthViewModel extends ChangeNotifier {
  final AuthService _authService = AuthService();
  
  UserModel? _user;
  bool _isLoading = false;
  String? _errorMessage;

  // Getters
  UserModel? get user => _user;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  bool get isAuthenticated => _user != null;

  // Constructor to listen to auth state changes
  AuthViewModel() {
    _authService.userStream.listen((UserModel? user) {
      _user = user;
      notifyListeners();
    });
  }

  // Sign in with email and password
  Future<bool> signIn(String email, String password) async {
    _setLoading(true);
    _clearError();
    
    try {
      _user = await _authService.signInWithEmailAndPassword(email, password);
      _setLoading(false);
      return true;
    } catch (e) {
      _handleError(e);
      return false;
    }
  }

  // Register with email and password
  Future<bool> register(String email, String password) async {
    _setLoading(true);
    _clearError();
    
    try {
      _user = await _authService.registerWithEmailAndPassword(email, password);
      _setLoading(false);
      return true;
    } catch (e) {
      _handleError(e);
      return false;
    }
  }

  // Reset password
  Future<bool> resetPassword(String email) async {
    _setLoading(true);
    _clearError();
    
    try {
      await _authService.resetPassword(email);
      _setLoading(false);
      return true;
    } catch (e) {
      _handleError(e);
      return false;
    }
  }

  // Sign out
  Future<void> signOut() async {
    _setLoading(true);
    _clearError();
    
    try {
      await _authService.signOut();
      _user = null;
      _setLoading(false);
    } catch (e) {
      _handleError(e);
    }
  }

  // Helper methods
  void _setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  void _clearError() {
    _errorMessage = null;
    notifyListeners();
  }

  void _handleError(dynamic e) {
    _isLoading = false;
    if (e is Exception) {
      _errorMessage = _getReadableErrorMessage(e.toString());
    } else {
      _errorMessage = 'An unexpected error occurred';
    }
    notifyListeners();
  }

  String _getReadableErrorMessage(String error) {
    if (error.contains('user-not-found')) {
      return 'No user found with this email';
    } else if (error.contains('wrong-password')) {
      return 'Incorrect password';
    } else if (error.contains('email-already-in-use')) {
      return 'Email is already in use';
    } else if (error.contains('weak-password')) {
      return 'Password is too weak';
    } else if (error.contains('invalid-email')) {
      return 'Invalid email format';
    } else {
      return 'Authentication failed: $error';
    }
  }
}
