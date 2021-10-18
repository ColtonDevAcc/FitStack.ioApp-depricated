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
  void selectMuscleGroup({muscleList = List, selectedMuscle = Muscle}) {
    var index = muscleList.forEach(
      (m) {
        m.muscleGroup == selectedMuscle.muscleGroup;
        {
          m.nonSelectedModelColor = Colors.blue;
        }
      },
    );
  }
}
