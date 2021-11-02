import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/generalProviders.dart';

abstract class BaseAuthRepository {
  Stream<User?> get authStateChanges;
  Future<void> signIn({email: String, password: String});
  Future<void> signUp({email, String, password: String});
  User? getCurrentUser();
  Future<void> signOut();
}

final authRepositoryProvider = Provider<AuthRepository>((ref) => AuthRepository(ref.read));

class AuthRepository implements BaseAuthRepository {
  final Reader _read;
  const AuthRepository(this._read);

  @override
  Stream<User?> get authStateChanges => _read(firebaseAuthProvider).authStateChanges();

  @override
  User? getCurrentUser() {
    return _read(firebaseAuthProvider).currentUser;
  }

  @override
  Future<void> signIn({email, password}) async {
    await _read(firebaseAuthProvider).signInWithEmailAndPassword(email: email, password: password);
  }

  @override
  Future<void> signOut() async {
    await _read(firebaseAuthProvider).signOut();
    await signIn();
  }

  @override
  Future<void> signUp({email, String, password = String}) async {
    await _read(firebaseAuthProvider)
        .createUserWithEmailAndPassword(email: email, password: password);
  }
}
