import 'package:fitstack/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../models/recovery/recovery_model.dart';

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

    selectedMuscle.nonSelectedModelColor = Colors.teal;
    selectedMuscle.selctedModelColor = Colors.green;

    muscleList.forEach(
      (muscle) {
        if (muscle.muscleGroup == selectedMuscle.muscleGroup &&
            muscle.muscleGroup != PrimaryMuscleGroups.empty) {
          muscle.nonSelectedModelColor = Colors.green;
          newMuscleList.add(muscle);
        } else if (muscle.muscleGroup != PrimaryMuscleGroups.empty) {
          muscle.nonSelectedModelColor = Apptheme.mainButonColor;
          newMuscleList.add(muscle);
        } else {
          muscle.nonSelectedModelColor = Colors.black;
          newMuscleList.add(muscle);
        }
      },
    );

    return newMuscleList;
  }
}
