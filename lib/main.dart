import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workify/providers/nutritionProvider.dart';
import 'package:workify/providers/themeProvider.dart';
import 'package:workify/providers/userProvider.dart';
import 'package:workify/services/authServices.dart';
import 'package:workify/theme/theme.dart';
import 'package:workify/views/login/loginView.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => NutritionState()),
      Provider<AuthServices>(
        create: (context) => AuthServices(FirebaseAuth.instance),
      ),
      StreamProvider(
        create: (context) => context.read<AuthServices>().authStateChanges,
        initialData: null,
      ),
      ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ChangeNotifierProvider(create: (_) => UserProvider())
    ],
    child: MyApp(),
  ));
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
      home: ChangeNotifierProvider(
        child: LoginView(),
        create: (context) => AuthServices(FirebaseAuth.instance),
      ),
      theme: ThemeData(
        sliderTheme: SliderThemeData(valueIndicatorColor: Color.fromRGBO(33, 40, 67, 1)),
        // ignore: deprecated_member_use
        accentColor: Apptheme.mainButonColor,
        textTheme: TextTheme(
          subtitle1: TextStyle(color: Apptheme.mainTextColor),
          subtitle2: TextStyle(color: Apptheme.mainTextColor),
        ),
      ),
    );
  }
}
