import 'dart:developer';

import 'package:fitstack/models/workout/workout_model.dart';
import 'package:fitstack/repositories/workout_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'auth_controller.dart';
import '../repositories/customExceptions.dart';

final WorkoutControllerProvider =
    StateNotifierProvider<WorkoutController, AsyncValue<List<Workout>>>((ref) {
  final user = ref.watch(authControllerProvider);
  return WorkoutController(ref.read, user!.uid);
});

final workoutExceptionProvider = StateProvider<CustomException?>((_) => null);

class WorkoutController extends StateNotifier<AsyncValue<List<Workout>>> {
  final Reader read;
  final String? userID;

  WorkoutController(this.read, this.userID) : super(AsyncValue.loading()) {
    if (userID != null) {
      retrieveGroups();
    } else {
      log('user id is null');
    }
  }

  Future<void> retrieveGroups({bool isRefreshing = false}) async {}

  Future<Workout> addWorkout({title = String, sets = int, reps = int}) async {
    read(workoutRepositoryProvider).addWorkout(title: title, sets: sets, reps: reps);
    return await Workout.empty();
  }
}
