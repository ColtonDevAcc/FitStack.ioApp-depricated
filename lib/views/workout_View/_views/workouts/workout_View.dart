import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:workify/theme/theme.dart';
import 'package:workify/views/workout_View/_views/workouts/addWorkout_View.dart';

class Workout_View extends StatelessWidget {
  const Workout_View({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Apptheme.mainBackgroundColor,
      floatingActionButton: Align(
        alignment: Alignment(0.9999, 0.82),
        child: FloatingActionButton(
          onPressed: () {
            print('object');
            Navigator.push(context, MaterialPageRoute(builder: (context) => AddWorkout_View()));
          },
          backgroundColor: Apptheme.secondaryAccent,
          child: Icon(LineIcons.plus),
        ),
      ),
    );
  }
}
