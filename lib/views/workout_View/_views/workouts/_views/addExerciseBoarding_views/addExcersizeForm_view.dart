import 'package:fitstack/repositories/muscleModel_repository.dart';
import 'package:fitstack/theme/theme.dart';
import 'package:fitstack/views/workout_View/_views/workouts/_views/addExerciseBoarding_views/selectMuscleGroup_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:line_icons/line_icons.dart';

import 'addExcersizeInformation_view.dart';

final addExcersizeProvider = StateProvider<int>((ref) => 0);

class AddExcersizeForm_View extends HookWidget {
  const AddExcersizeForm_View({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final selectedMuscleGroup = useProvider(SelectedButtonProvider);
    var index = useProvider(addExcersizeProvider);

    List addExcersizeViews = [
      SelectMuscleGroup_View(),
      AddExcersizeInformation_View(),
    ];

    List buttonText = ['NEXT', 'CREATE'];

    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(LineIcons.arrowLeft, color: Colors.black),
        ),
        backgroundColor: Apptheme.mainCardColor,
        title: index.state == 0
            ? Text(
                selectedMuscleGroup.state != null &&
                        selectedMuscleGroup.state!.muscleGroup
                                .toString()
                                .split('.')[1]
                                .toUpperCase() !=
                            'EMPTY'
                    ? selectedMuscleGroup.state!.muscleGroup.toString().split('.')[1].toUpperCase()
                    : 'Select a muscle group',
                style: TextStyle(color: Apptheme.mainButonColor, fontWeight: FontWeight.bold),
              )
            : Text(
                'CREATE YOUR EXCERSIZE',
                style: TextStyle(color: Apptheme.mainButonColor, fontWeight: FontWeight.bold),
              ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: TextButton(
          onPressed: () {
            index.state += 1;
            print(addExcersizeViews[index.state].toString());
          },
          child: Container(
            color: Apptheme.mainButonColor,
            child: Text(
              buttonText[index.state],
              textScaleFactor: 1.3,
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        color: Apptheme.mainButonColor,
      ),
      body: addExcersizeViews[index.state],
    );
  }
}
