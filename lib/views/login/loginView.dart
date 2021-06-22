import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workify/controllers/authServices.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController emailTextController = new TextEditingController();
    TextEditingController passwordTextController = new TextEditingController();

    final firebaseUser = context.watch<User>();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Email'),
            TextFormField(),
            SizedBox(height: 30),
            Text('Password'),
            TextFormField(),
            TextButton(
                onPressed: () async {
                  Future<String> result = context.read<AuthServices>().signIn(
                        email: emailTextController.text,
                        password: passwordTextController.text,
                      );
                  print(firebaseUser.toString());
                },
                child: Text('Login'))
          ],
        ),
      ),
    );
  }
}

/* Provider<AuthServices>(
                    create: (_) => AuthServices(FirebaseAuth.instance),
                  );
                  StreamProvider(
                    create: (context) =>
                        context.read<AuthServices>().authStateChanges,
                    initialData: null,
                  ); */