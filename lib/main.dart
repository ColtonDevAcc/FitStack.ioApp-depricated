import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workify/providers/themeProvider.dart';
import 'package:workify/theme/theme.dart';
import 'package:workify/views/mainView.dart';

void main() {
  runApp(
    MyApp(),
  );
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
          // ignore: unused_local_variable
          final theme = Provider.of<ThemeProvider>(context);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Aircraft Closing Room',
            home: MainView(),
            theme: ThemeData(
              accentColor: Apptheme.mainButonColor,
              textTheme: TextTheme(
                subtitle1: TextStyle(color: Apptheme.mainTextColor),
                subtitle2: TextStyle(color: Apptheme.mainTextColor),
              ),
            ),
          );
        },
      ),
    );
  }
}
