import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:workify/services/authServices.dart';

final authControllerProvider = StateNotifierProvider<AuthController, User?>(
  (ref) => AuthController(ref.read)..appStarter(),
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

  void appStarter() async {
    final user = read(authRepositoryProvider).getCurrentUser();
    if (user == null) {
      await read(authRepositoryProvider).signIn();
    }
  }

  void signOut() async {
    await read(authRepositoryProvider).signOut();
  }
}
