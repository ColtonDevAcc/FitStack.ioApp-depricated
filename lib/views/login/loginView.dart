import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:provider/src/provider.dart';
import 'package:workify/Altdesigns/darkOne.dart';
import 'package:workify/controllers/authServices.dart';
import 'package:workify/theme/theme.dart';
import 'package:workify/views/signUp/signUpView.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController emailTextController = TextEditingController();
    TextEditingController passwordTextController = TextEditingController();

    return Scaffold(
      backgroundColor: Apptheme.mainBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * .60,
              child: SvgPicture.asset(
                'assets/images/AppLogoWithText.svg',
                color: Colors.white,
              ),
            ),
            SizedBox(height: 50),
            Text(
              'Email',
              style: TextStyle(color: Colors.white),
            ),
            TextField(
              controller: emailTextController,
              style: TextStyle(color: Apptheme.mainTextColor),
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                border: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 30),
            Text(
              'Password',
              style: TextStyle(color: Colors.white),
            ),
            TextField(
              controller: passwordTextController,
              style: TextStyle(color: Apptheme.mainTextColor),
              enabled: true,
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                fillColor: Colors.white,
                border: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 30),
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
                              child: DarkOne(),
                              create: (context) =>
                                  AuthServices(FirebaseAuth.instance),
                            ),
                          ),
                        )
                      // ignore: unnecessary_statements
                      : null;
                },
                child: Text('Login')),
            TextButton(
                onPressed: () {
                  Navigator.push(
                    (context),
                    MaterialPageRoute(
                      builder: (context) => SignUpView(),
                    ),
                  );
                },
                child: Text('Sign Up'))
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
