import 'package:hooks_riverpod/hooks_riverpod.dart';

abstract class WorkoutRepsitoryBaseClass {
  void addWorkout({title: String, sets: int, reps: int});
}

final workoutRepositoryProvider = Provider<WorkoutRepository>((ref) => WorkoutRepository(ref.read));

class WorkoutRepository implements WorkoutRepsitoryBaseClass {
  final Reader read;

  const WorkoutRepository(this.read);

  @override
  void addWorkout({title = String, sets = int, reps = int}) {
    // TODO: implement addWorkout
  }
}
