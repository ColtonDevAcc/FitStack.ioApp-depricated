import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workify/providers/themeProvider.dart';
import 'package:workify/theme/theme.dart';
import 'package:workify/views/home/homeView.dart';

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
          final theme = Provider.of<ThemeProvider>(context);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Aircraft Closing Room',
            home: HomeView(),
            theme: ThemeData(
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
