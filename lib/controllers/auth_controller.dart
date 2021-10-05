import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:workify/repositories/auth_repository.dart';

final authControllerProvider = StateNotifierProvider<AuthController, User?>(
  (ref) => AuthController(ref.read),
);

class AuthController extends StateNotifier<User?> {
  final Reader read;

  StreamSubscription<User?>? _authStateChangesSubscription;

  AuthController(this.read) : super(null) {
    _authStateChangesSubscription?.cancel();
    _authStateChangesSubscription =
        read(authRepositoryProvider).authStateChanges.listen((user) => state = user);
  }

  @override
  void dispose() {
    _authStateChangesSubscription?.cancel();
    super.dispose();
  }

  void signIn({email: String, password: String}) async {
    await read(authRepositoryProvider).signIn(email: email, password: password);
  }

  void signOut() async {
    await read(authRepositoryProvider).signOut();
  }
}
