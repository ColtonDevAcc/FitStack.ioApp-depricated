import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import '../../theme/theme.dart';
import '_widgets/SnakeNavigationBar_Widget.dart';
import '_widgets/nutritionStatisticsContainer_Widget.dart';
import '_widgets/progressStatisticsList_Widget.dart';
import '_widgets/workoutList_Widget.dart';
import '../mealPlan_View/NutritonMain_View.dart';
import '../more_View/MoreMain_View.dart';
import '../relationShip_View/relationshipMain_View.dart';
import '../saved_view/savedView.dart';
import '../workout_View/mainWorkoutHome_View.dart';

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int indexSelected = 1;
  var _currentIndex = 0;
  final List<Widget> _children = [
    MainView(),
    MainWorkout_View(),
    Nutrition_View(),
    SavedView(),
    GroupView(),
    More_View(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Apptheme.mainBackgroundColor,
      body: _currentIndex == 0 ? homeView(context: context) : _children[_currentIndex],
      bottomNavigationBar: SnakeNavigationBar_Widget(
        currentIndex: _currentIndex,
        onDestinationSelected: (selected) {
          setState(() {
            //sets the screen that is being displayed
            _currentIndex = selected;
          });
        },
      ),
    );
  }

  Container homeView({context: BuildContext}) {
    return Container(
      color: Apptheme.mainBackgroundColor,
      child: ListView(
        children: [
          SizedBox(height: AppBar().preferredSize.height - 45),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'HOW DOES YOUR DAY LOOK?',
                  textScaleFactor: 1.4,
                  style: TextStyle(
                    color: Apptheme.mainButonColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Stats',
                  textScaleFactor: 1.2,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                NutritionStatisticsContainer_Widget(
                  color: Color.fromRGBO(253, 117, 5, 1),
                  icon: LineIcons.tint,
                  value: .73,
                ),
                NutritionStatisticsContainer_Widget(
                  color: Color.fromRGBO(230, 64, 64, 1),
                  icon: Icons.local_fire_department,
                  value: .30,
                ),
                NutritionStatisticsContainer_Widget(
                  color: Color.fromRGBO(87, 54, 232, 1),
                  icon: LineIcons.drumstickWithBiteTakenOut,
                  value: .9,
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 20, 0, 10),
                child: Text(
                  'Daily workouts',
                  textScaleFactor: 1.2,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * .35,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    SizedBox(width: MediaQuery.of(context).size.width * .02),
                    WorkoutList_Widget(),
                    WorkoutList_Widget(),
                    WorkoutList_Widget(),
                  ],
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 20, 0, 0),
                child: Text(
                  'Progress',
                  textScaleFactor: 1.2,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                height: 200,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  children: [
                    SizedBox(width: MediaQuery.of(context).size.width * .02),
                    ProgressStatisticsList_Widget(),
                    ProgressStatisticsList_Widget(),
                    ProgressStatisticsList_Widget(),
                    ProgressStatisticsList_Widget(),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
