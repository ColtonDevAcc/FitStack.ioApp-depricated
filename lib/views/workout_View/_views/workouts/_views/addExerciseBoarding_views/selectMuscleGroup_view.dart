import 'package:fitstack/repositories/muscleModel_repository.dart';
import 'package:fitstack/theme/theme.dart';
import 'package:fitstack/views/workout_View/_views/recovery/recovery_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SelectMuscleGroup_View extends ConsumerWidget {
  const SelectMuscleGroup_View({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Recovery_View(),
          ),
        ],
      ),
    );
  }
}
