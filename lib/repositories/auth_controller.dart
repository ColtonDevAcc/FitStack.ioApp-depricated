import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:workify/providers/generalProviders.dart';
import 'customExceptions.dart';

abstract class BaseAuthRepository {
  Stream<User?> get authStateChanges;
  Future<void> signIn();
  User? getCurrentUser();
  Future<void> signOut();
}

final authRepositoryProvider = Provider<AuthRepository>((ref) => AuthRepository(ref.read));

class AuthRepository implements BaseAuthRepository {
  final Reader read;

  const AuthRepository(this.read);

  @override
  Stream<User?> get authStateChanges => read(firebaseAuthProvider).authStateChanges();

  @override
  User? getCurrentUser() {
    try {
      return read(firebaseAuthProvider).currentUser;
    } on FirebaseAuthException catch (e) {
      throw CustomException(message: e.message);
    }
  }

  @override
  Future<void> signIn({email: String, password: String}) async {
    try {
      await read(firebaseAuthProvider).signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw CustomException(message: e.message);
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await read(authRepositoryProvider).signOut();
    } on FirebaseAuthException catch (e) {
      throw CustomException(message: e.message);
    }
  }
}
