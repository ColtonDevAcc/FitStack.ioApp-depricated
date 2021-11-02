import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import '../../theme/theme.dart';

class WorkoutView extends StatelessWidget {
  const WorkoutView({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Apptheme.mainBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: AppBar().preferredSize.height),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(LineIcons.arrowLeft, color: Colors.black),
            ),
            Text(
              title,
              textScaleFactor: 1.8,
              style: TextStyle(color: Apptheme.mainButonColor, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
