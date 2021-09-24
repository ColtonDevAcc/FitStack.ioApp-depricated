import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:workify/theme/theme.dart';
import 'package:workify/views/login/loginView.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aircraft Closing Room',
      home: LoginView(),
      theme: ThemeData(
        sliderTheme: SliderThemeData(valueIndicatorColor: Color.fromRGBO(33, 40, 67, 1)),
        // ignore: deprecated_member_use
        accentColor: Apptheme.mainButonColor,
        //launch app
        textTheme: TextTheme(
          subtitle1: TextStyle(color: Apptheme.mainTextColor),
          subtitle2: TextStyle(color: Apptheme.mainTextColor),
        ),
      ),
    );
  }
}
