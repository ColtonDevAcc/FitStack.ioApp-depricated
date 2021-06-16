import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:workify/theme/theme.dart';

class StartWorkoutView extends StatelessWidget {
  const StartWorkoutView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Recent workouts',
                textScaleFactor: 1.3,
                style: TextStyle(color: Apptheme.mainTextColor),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
