import 'dart:math';

import 'package:chart_sparkline/chart_sparkline.dart';
import 'package:flutter/material.dart';
import 'package:workify/theme/theme.dart';

class ProgressStatisticsList_Widget extends StatelessWidget {
  const ProgressStatisticsList_Widget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 10, 10, 10),
      child: Container(
        child: Stack(
          children: [
            Align(
                child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 90, 10, 10),
              child: Sparkline(
                useCubicSmoothing: true,
                cubicSmoothingFactor: 0.2,
                lineWidth: 3,
                lineColor: Apptheme.mainStatisticColor,
                fillMode: FillMode.below,
                fillGradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Apptheme.mainStatisticColor.withOpacity(.1),
                    Apptheme.mainCardColor,
                  ],
                ),
                averageLable: true,
                data: [
                  Random().nextDouble(),
                  Random().nextDouble(),
                  Random().nextDouble(),
                  Random().nextDouble(),
                  Random().nextDouble(),
                  Random().nextDouble(),
                  Random().nextDouble(),
                  Random().nextDouble(),
                  Random().nextDouble(),
                  Random().nextDouble(),
                  Random().nextDouble(),
                ],
              ),
            )),
            Positioned(
                child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '45',
                        textScaleFactor: 2,
                        style: TextStyle(color: Colors.black),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                        child: Text(
                          'lbs',
                          textScaleFactor: 1,
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    'Weight Gain',
                    style: TextStyle(color: Colors.black.withOpacity(.5)),
                  )
                ],
              ),
            ))
          ],
        ),
        width: 128,
        decoration: BoxDecoration(
          color: Apptheme.mainCardColor,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
      ),
    );
  }
}
