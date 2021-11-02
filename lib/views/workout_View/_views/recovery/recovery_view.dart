import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:touchable/touchable.dart';
import '../../../../controllers/recoveryModel_controller.dart';
import '../../../../models/recovery/recovery_model.dart';
import '../../../../repositories/customExceptions.dart';

class Recovery_View extends HookWidget {
  const Recovery_View({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final muslceListContollerProvider = useProvider(MuscleListControllerProvider);
    final muslceListContollerNotifier = useProvider(MuscleListControllerProvider.notifier);

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        muslceListContollerProvider.when(
          data: (muscleList) => ProviderListener(
            onChange: (BuildContext context, StateController<CustomException?> customException) {},
            provider: groupListExceptionProvider,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * .7,
                  child: CanvasTouchDetector(
                    builder: (context) => CustomPaint(
                      painter: MyPainter(context, muscleList, muslceListContollerNotifier),
                    ),
                  ),
                ),
              ],
            ),
          ),
          loading: () => CircularProgressIndicator(),
          error: (e, st) => Text('$e $st'),
        ),
      ],
    );
  }
}

class MyPainter extends CustomPainter {
  final BuildContext _context;
  final List<Muscle> muscleList;
  final MuscleListController muslceListContollerNotifier;

  MyPainter(
    this._context,
    this.muscleList,
    this.muslceListContollerNotifier,
  );

  @override
  void paint(Canvas canvas, Size size) {
    var _canvas = TouchyCanvas(_context, canvas);

    var xScale = size.width * 2.39 / 3 / 900;
    var yScale = size.height * 10 / 5.5 / 4300;
    final Matrix4 matrix4 = Matrix4.identity();
    matrix4.scale(xScale, yScale);

    for (Muscle muscle in muscleList) {
      _canvas.drawPath(
        muscle.parsedPath!.transform(matrix4.storage),
        Paint()
          ..color = muscle.nonSelectedModelColor
          ..strokeWidth = 4.0,
        onTapDown: (e) {
          muslceListContollerNotifier.selectMuscleGroup(
              muscleList: muscleList, selectedMuscle: muscle);
        },
      );
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
