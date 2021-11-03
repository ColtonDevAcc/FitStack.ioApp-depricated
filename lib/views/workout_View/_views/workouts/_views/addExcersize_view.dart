import 'package:fitstack/theme/theme.dart';
import 'package:fitstack/views/workout_View/_views/workouts/_views/addExerciseBoarding_views/addExcersizeForm_view.dart';
import 'package:fitstack/views/workout_View/_views/workouts/_views/addExerciseBoarding_views/selectMuscleGroup_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:resizable_widget/resizable_widget.dart';

class AddExcersize_View extends StatelessWidget {
  const AddExcersize_View({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            LineIcons.arrowLeft,
            color: Colors.black,
          ),
        ),
        backgroundColor: Apptheme.mainCardColor,
        title: Text(
          'Add Excersize',
          style: TextStyle(color: Apptheme.mainButonColor),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddExcersizeForm_View(),
                ),
              );
            },
            child: Icon(LineIcons.plus, color: Colors.black),
          ),
          SizedBox(width: 10)
        ],
      ),
      backgroundColor: Apptheme.mainBackgroundColor,
      body: ResizableWidget(
        children: [
          Container(color: Apptheme.mainBackgroundColor),
          Container(color: Colors.redAccent),
        ],
        isHorizontalSeparator: false, // optional
        isDisabledSmartHide: false, // optional
        separatorColor: Apptheme.mainButonColor, // optional
        separatorSize: 3, // optional
        percentages: [0.7, 0.3], // optional
        onResized: (infoList) => // optional
            print(infoList.map((x) => '(${x.size}, ${x.percentage}%)').join(", ")),
      ),
    );
  }
}
