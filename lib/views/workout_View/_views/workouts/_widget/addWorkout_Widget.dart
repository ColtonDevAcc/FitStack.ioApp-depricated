import 'package:flutter/material.dart';
import 'package:workify/theme/theme.dart';

class AddWorkout_Widget extends StatelessWidget {
  const AddWorkout_Widget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              workoutTextField(title: 'Title'),
              workoutTextField(title: 'Muscle Group'),
              workoutTextField(title: 'sets'),
              workoutTextField(title: 'reps'),
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: GestureDetector(
            onTap: () {},
            child: Container(
              color: Apptheme.mainButonColor,
              width: double.infinity,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    'Add',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}

class workoutTextField extends StatelessWidget {
  final String title;
  const workoutTextField({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, textScaleFactor: 1.2, style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          TextField(
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(
              focusColor: Apptheme.mainButonColor,
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10),
              ),
              hintText: title,
            ),
          ),
        ],
      ),
    );
  }
}
