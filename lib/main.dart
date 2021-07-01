import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workify/providers/themeProvider.dart';
import 'package:workify/theme/theme.dart';
import 'package:workify/views/login/loginView.dart';

import 'controllers/authServices.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeProvider>(
      create: (_) => ThemeProvider(),
      child: Builder(
        builder: (BuildContext context) {
          return MultiProvider(
            providers: [
              Provider<AuthServices>(
                create: (_) => AuthServices(FirebaseAuth.instance),
              ),
              StreamProvider(
                create: (context) =>
                    context.read<AuthServices>().authStateChanges,
                initialData: null,
              )
            ],
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Aircraft Closing Room',
              home: ChangeNotifierProvider(
                child: LoginView(),
                create: (context) => AuthServices(FirebaseAuth.instance),
              ),
              theme: ThemeData(
                sliderTheme: SliderThemeData(
                    valueIndicatorColor: Color.fromRGBO(33, 40, 67, 1)),
                // ignore: deprecated_member_use
                accentColor: Apptheme.mainButonColor,
                textTheme: TextTheme(
                  subtitle1: TextStyle(color: Apptheme.mainTextColor),
                  subtitle2: TextStyle(color: Apptheme.mainTextColor),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
