import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:workify/models/recovery/recovery_model.dart';

abstract class MuscleModelBaseRepository {
  List<Muscle> getMuscleModel({muscleList: List});
  List<Muscle> getMuscleRecoveryModel({muscleList: List});
  void selectMuscleGroup({muscleList: List, selectedMuscle: Muscle});
}

final MuscleModelRepositoryProvider =
    Provider<MuscleModelRepository>((ref) => MuscleModelRepository(ref.read));

class MuscleModelRepository implements MuscleModelBaseRepository {
  final Reader read;

  MuscleModelRepository(this.read);
  @override
  List<Muscle> getMuscleModel({muscleList = List}) {
    // TODO: implement getMuscleModel
    throw UnimplementedError();
  }

  @override
  List<Muscle> getMuscleRecoveryModel({muscleList = List}) {
    // TODO: implement getMuscleRecoveryModel
    throw UnimplementedError();
  }

  @override
  List<Muscle> selectMuscleGroup({muscleList = List, selectedMuscle = Muscle}) {
    List<Muscle> newMuscleList = [];

    //!this is the error
    for (Muscle m in muscleList) {
      if (m.muscleGroup == selectedMuscle.muscleGroup) {
        final oldM = m;
        int index =
            muscleList.indexWhere((muscle) => muscle.muscleGroup == selectedMuscle.muscleGroup);

        m.nonSelectedModelColor = Colors.blue;
        log('selected muscle group ${m.muscleGroup} has been changed to ${m.nonSelectedModelColor} the old value was ${oldM.nonSelectedModelColor}');

        muscleList[index] = m;
      } else {}
    }

    return newMuscleList;
  }
}
