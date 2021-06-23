import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// ignore: implementation_imports
import 'package:provider/src/provider.dart';
import 'package:workify/controllers/authServices.dart';
import '../mainView.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController emailTextController = TextEditingController();
    TextEditingController passwordTextController = TextEditingController();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Email'),
            TextFormField(controller: emailTextController),
            SizedBox(height: 30),
            Text('Password'),
            TextFormField(controller: passwordTextController),
            TextButton(
                onPressed: () async {
                  print(emailTextController.text.trim());
                  print(passwordTextController.text.trim());
                  await context.read<AuthServices>().signIn(
                        email: emailTextController.text.trim(),
                        password: passwordTextController.text.trim(),
                      );
                  context.read<AuthServices>().userLoggedIn
                      ? Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ChangeNotifierProvider(
                              child: MainView(),
                              create: (context) =>
                                  AuthServices(FirebaseAuth.instance),
                            ),
                          ),
                        )
                      // ignore: unnecessary_statements
                      : null;
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
