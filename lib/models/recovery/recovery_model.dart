import 'package:flutter/cupertino.dart';

enum PrimaryMuscleGroups {
  //Primary Muscle Groups
  empty,
  vastusLateralist,
  brachioradialis,
  hand,
  abdominals, //The muscles that make up the front of your mid-section.
  biceps, //The muscles located on the front of your arm between your shoulder and elbow.
  calves, //The muscles that make up the lower portion of the back of your leg below your knee.
  deltoids, //The muscles that make up a large portion of the curve of your shoulder.
  forearms, //The muscles located on the lower arm between the elbow and wrist.
  gluteals, //The muscles of your posterior.
  hamstrings, //The muscles located on the back of your leg between your gluteals and knee.
  latissimusDorsi, //The muscles located on the sides of your upper back under the arm pit.
  pectorals, //The muscles of your chest.
  obliques, //The muscles on the sides of your mid-section.
  quadriceps, //The muscles located on the front of your leg between your hip and knee.
  trapezius, //The muscles located on the sides of your neck.
  triceps, //The muscles located on the back of your arm between your shoulder and elbow.
}

enum PushMuscleGroups {
  //The muscle groups listed below are considered push muscle groups.
  //The intent of performing a push/pull weight training routine is to
  //exercise one or more of the muscle groups listed below with one or
  //more of the pull muscle groups.
  calves,
  deltoids,
  gluteals,
  pectorals,
  quadriceps,
  triceps,
}

enum PullMuscleGroups {
  //The muscle groups listed below are considered pull muscle groups.
  //When performing a push/pull weight training routine,
  //the intent is to exercise one or more of the pull muscle groups
  //listed below with one or more of the pull muscle groups listed above.
  abdominals,
  biceps,
  forearms,
  latissimusDorsi,
  hamstring,
  obliques,
  trapezius,
}

class Muscle {
  final String muscleName;
  final PrimaryMuscleGroups muscleGroup;
  final Color nonSelectedModelColor;
  final Color selctedModelColor;
  final String path;
  Path? parsedPath;

  List<PrimaryMuscleGroups>? selectedMuscleGroup;

  Muscle(
    this.muscleName,
    this.muscleGroup,
    this.nonSelectedModelColor,
    this.selctedModelColor,
    this.path,
  );
}
