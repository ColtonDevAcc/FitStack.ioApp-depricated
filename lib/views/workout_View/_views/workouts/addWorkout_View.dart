import 'package:fitstack/views/workout_View/_views/workouts/_views/addExcersize_view.dart';
import 'package:fitstack/views/workout_View/_views/workouts/_views/addExerciseBoarding_views/addExcersizeForm_view.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import '../../../../theme/theme.dart';

class AddWorkout_View extends StatelessWidget {
  const AddWorkout_View({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Widget> workoutList = [];
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(LineIcons.arrowLeft),
        ),
        backgroundColor: Apptheme.mainCardColor,
        title: Text(
          'ADD YOUR WORKOUT',
          style: TextStyle(color: Apptheme.mainButonColor),
        ),
        actions: [
          Icon(LineIcons.edit),
          SizedBox(width: 8),
        ],
      ),
      backgroundColor: Apptheme.mainBackgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: ListView(
              shrinkWrap: true,
              children: workoutList,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
            child: AddMoreButton_Widget(),
          )
        ],
      ),
    );
  }
}

class AddMoreButton_Widget extends StatelessWidget {
  const AddMoreButton_Widget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AddExcersize_View(),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Apptheme.mainCardColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.add, color: Colors.black),
              Text('Add more', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold))
            ],
          ),
        ),
      ),
    );
  }
}
