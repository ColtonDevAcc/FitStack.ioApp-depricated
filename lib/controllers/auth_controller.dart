import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:workify/extenstions/firebaseFirestore_Extentions.dart';
import 'package:workify/models/user/user_model.dart' as currentUser;
import 'package:workify/repositories/auth_repository.dart';
import 'package:workify/repositories/generalProviders.dart';

final authControllerProvider = StateNotifierProvider<AuthController, User?>(
  (ref) => AuthController(ref.read),
);

class AuthController extends StateNotifier<User?> {
  final Reader read;
  currentUser.User? user;

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

  Future<currentUser.User?> signIn({email: String, password: String}) async {
    await read(authRepositoryProvider).signIn(email: email, password: password);

    final user = currentUser.User.fromDocument(
      await read(firebaseFirestoreProvider).userRef(FirebaseAuth.instance.currentUser!.uid).get(),
    );

    this.user = await user;

    return user;
  }

  void signOut() async {
    await read(authRepositoryProvider).signOut();
  }
}
