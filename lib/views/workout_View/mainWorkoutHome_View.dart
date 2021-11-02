import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../repositories/auth_repository.dart';
import '../../theme/theme.dart';
import '_views/recovery/recovery_view.dart';
import '_views/workouts/workout_View.dart';

class MainWorkout_View extends HookWidget {
  const MainWorkout_View({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var currentUser = context.read(authRepositoryProvider).getCurrentUser();

    return Scaffold(
      backgroundColor: Apptheme.mainBackgroundColor,
      body: DefaultTabController(
        length: 3,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: AppBar().preferredSize.height),
              Text(
                'MY WORKOUTS',
                textScaleFactor: 1.4,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 15),
              Container(
                height: 35,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(
                    25.0,
                  ),
                ),
                child: TabBar(
                  // give the indicator a decoration (color and border radius)
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      25.0,
                    ),
                    color: Apptheme.mainButonColor,
                  ),
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.grey,
                  tabs: [
                    // first tab [you can add an icon using the icon property]
                    Tab(
                      text: 'Workouts',
                    ),
                    // second tab [you can add an icon using the icon property]
                    Tab(
                      text: 'Recovery',
                    ),
                    Tab(
                      text: 'History',
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Expanded(
                        child: TabBarView(
                          children: [
                            Workout_View(),
                            Recovery_View(),
                            Text('history'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
