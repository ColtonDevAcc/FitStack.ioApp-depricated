import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:workify/services/authServices.dart';

final authControllerProvider = StateNotifierProvider<AuthController, dynamic>(
  (ref) => AuthController(ref.read)..appStarter(),
);

class AuthController extends StateNotifier<User?> {
  final Reader _read;

  StreamSubscription<User?>? _authStateChangesSubscription;

  AuthController(this._read) : super(null) {
    _authStateChangesSubscription?.cancel();
    _authStateChangesSubscription =
        _read(authRepositoryProvider).authStateChanges.listen((user) => state = user);
  }

  @override
  void dispose() {
    _authStateChangesSubscription?.cancel();
    super.dispose();
  }

  void appStarter() async {
    final user = _read(authRepositoryProvider).getCurrentUser();
    if (user == null) {
      await _read(authRepositoryProvider).signIn();
    }
  }

  void signOut() async {
    await _read(authRepositoryProvider).signOut();
  }
}
