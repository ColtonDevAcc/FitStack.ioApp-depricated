import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:workify/controllers/authServices.dart';
import 'package:workify/theme/theme.dart';
import 'package:workify/views/mainView.dart';
import 'package:workify/views/signUp/signUpView.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController emailTextController = new TextEditingController();
  TextEditingController passwordTextController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;
    double _screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Apptheme.mainBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            Stack(
              children: [
                Container(
                  width: _screenWidth,
                  height: _screenHeight,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 80,
                        height: 80,
                        child: SvgPicture.asset(
                          'assets/images/AppLogo/AppLogo.svg',
                          color: Apptheme.mainButonColor,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'LET\'S SIGN YOU IN',
                        textScaleFactor: 1.5,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Apptheme.mainButonColor,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Welcome back we you\'ve you\'ve \nbeen missed',
                        textScaleFactor: 1.5,
                        style: TextStyle(
                          color: Colors.black54,
                        ),
                      ),
                      Spacer(flex: 2),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Username',
                            textScaleFactor: 1.4,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          TextField(
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(10)),
                              hintText: 'Username or Email',
                            ),
                            controller: emailTextController,
                          ),
                        ],
                      ),
                      Spacer(flex: 1),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Password',
                            textScaleFactor: 1.4,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          TextField(
                            style: TextStyle(color: Colors.black),
                            obscureText: true,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText: 'Password',
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                            controller: passwordTextController,
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Text('Forgot Password'),
                      Spacer(flex: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          RichText(
                            text: TextSpan(
                              text: 'Dont have an account? ',
                              style: TextStyle(color: Colors.black),
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'Sign up!',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => SignUpView()),
                                      );
                                    },
                                ),
                              ],
                            ),
                          ),
                          TextButton(
                            onPressed: () async {
                              print(emailTextController.text.trim());
                              print(passwordTextController.text.trim());
                              await context.read<AuthServices>().signIn(
                                    email: emailTextController.text.trim(),
                                    password:
                                        passwordTextController.text.trim(),
                                  );
                              context.read<AuthServices>().userLoggedIn
                                  ? Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            ChangeNotifierProvider(
                                          child: MainView(),
                                          create: (context) => AuthServices(
                                              FirebaseAuth.instance),
                                        ),
                                      ),
                                    )
                                  // ignore: unnecessary_statements
                                  : null;
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Apptheme.mainButonColor,
                              ),
                              width: _screenWidth,
                              height: _screenHeight * .07,
                              child: Center(
                                child: Text(
                                  'Log in',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Container(
                            width: _screenWidth,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CircleAvatar(
                                  child: SvgPicture.asset(
                                    'assets/images/FacebookCircle.svg',
                                  ),
                                ),
                                SizedBox(width: 8),
                                CircleAvatar(
                                  backgroundColor:
                                      Color.fromRGBO(254, 78, 78, 1),
                                  child: SvgPicture.asset(
                                    'assets/images/GoogleCircle.svg',
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      Spacer(flex: 2),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
