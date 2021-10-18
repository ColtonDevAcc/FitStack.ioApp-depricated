import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:svg_path_parser/svg_path_parser.dart';
import 'package:workify/models/recovery/recovery_model.dart';
import 'package:workify/repositories/customExceptions.dart';

final MuscleListControllerProvider =
    StateNotifierProvider.family<MuscleListController, AsyncValue<List<Muscle>>, List<Muscle>>(
        (ref, paths) {
  return MuscleListController(ref.read, '', paths);
});

final groupListExceptionProvider = StateProvider<CustomException?>((_) => null);

class MuscleListController extends StateNotifier<AsyncValue<List<Muscle>>> {
  final Reader read;
  final String? userId;
  final List<Muscle> muscleList;
  List<Muscle> parsedMuscleList = [];

  MuscleListController(this.read, this.userId, this.muscleList) : super(AsyncValue.loading()) {
    userId == null ? muscleModelImageParser() : recoveryImageParser(this.muscleList);
  }

  recoveryImageParser(muscleList, {bool isRefreshing = false}) async {
    if (isRefreshing) state = AsyncValue.loading();
    try {
      for (Muscle muscle in muscleList) {
        muscle.parsedPath = parseSvgPath(muscle.path);
        parsedMuscleList.add(muscle);
      }
      if (mounted) {
        state = AsyncValue.data(parsedMuscleList);
      }
      return parsedMuscleList;
    } catch (e) {
      state = AsyncValue.error(e);
    }
  }

  selectMuscleGroup({selectedMuscle: Muscle, muscleList: List}) {}

  muscleModelImageParser() {}
}

// final userProvider = ChangeNotifierProvider.autoDispose.family<UserProvider, bool>((ref, isFemale) {
//   return UserProvider(isFemale);
// });
