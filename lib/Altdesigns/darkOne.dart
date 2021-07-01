import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import 'package:workify/controllers/currentUser.dart';
import 'package:workify/views/saved/savedView.dart';
import 'package:workify/views/mealPlan/mealPlanView.dart';
import 'package:workify/views/profile/profileView.dart';
import 'package:workify/views/startWorkout/startWorkoutView.dart';
import 'package:workify/views/trainer/trainerView.dart';

class DarkOne extends StatefulWidget {
  const DarkOne({Key? key}) : super(key: key);

  @override
  _DarkOneState createState() => _DarkOneState();
}

class _DarkOneState extends State<DarkOne> {
  int indexSelected = 1;
  var _selectedIndex = 0;
  final List<Widget> _children = [
    DarkOne(),
    MealPlanView(),
    SavedView(),
    StartWorkoutView(),
    TrainerView(),
    ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromRGBO(20, 26, 47, 1),
      drawer: Drawer(
        child: Container(
          color: Color.fromRGBO(20, 26, 47, 1),
          child: ListView(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Color.fromRGBO(33, 40, 67, 1),
                ),
                child: Center(
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                  ),
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      'Home',
                      textScaleFactor: 2,
                      style: TextStyle(color: Color.fromRGBO(86, 93, 121, 1)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      'Home',
                      textScaleFactor: 2,
                      style: TextStyle(color: Color.fromRGBO(86, 93, 121, 1)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      'Home',
                      textScaleFactor: 2,
                      style: TextStyle(color: Color.fromRGBO(86, 93, 121, 1)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      'Home',
                      textScaleFactor: 2,
                      style: TextStyle(color: Color.fromRGBO(86, 93, 121, 1)),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              color: Color.fromRGBO(20, 26, 47, 1),
              width: size.width * .2,
              height: size.height,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
                child: NavigationRail(
                  backgroundColor: Color.fromRGBO(33, 40, 67, 1),
                  selectedIndex: _selectedIndex,
                  unselectedIconTheme: IconThemeData(
                    color: Colors.white.withOpacity(.5),
                  ),
                  selectedIconTheme: IconThemeData(
                    color: Color.fromRGBO(250, 137, 107, 1),
                  ),
                  onDestinationSelected: (int index) {
                    setState(() {
                      _selectedIndex = index;
                    });
                  },
                  leading: CircleAvatar(
                    backgroundColor: Color.fromRGBO(37, 44, 76, 1),
                  ),
                  minWidth: 56,
                  groupAlignment: 1,
                  labelType: NavigationRailLabelType.selected,
                  selectedLabelTextStyle: TextStyle(color: Colors.white),
                  trailing: Column(
                    children: [
                      SizedBox(height: 50),
                      RotatedBox(
                        quarterTurns: 3,
                        child: Text(
                          'OverView',
                          style: TextStyle(color: Colors.white.withOpacity(.5)),
                        ),
                      ),
                      SizedBox(height: 50),
                      RotatedBox(
                        quarterTurns: 3,
                        child: Text(
                          'Feed',
                          style: TextStyle(color: Colors.white.withOpacity(.5)),
                        ),
                      ),
                      SizedBox(height: 50),
                    ],
                  ),
                  destinations: [
                    NavigationRailDestination(
                      icon: Icon(LineIcons.home),
                      selectedIcon: Icon(LineIcons.home),
                      label: Text('Home'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(LineIcons.utensils),
                      selectedIcon: Icon(LineIcons.utensils),
                      label: Text('Nutrition'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(LineIcons.dumbbell),
                      selectedIcon: Icon(LineIcons.dumbbell),
                      label: Text('Workout'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(LineIcons.users),
                      selectedIcon: Icon(LineIcons.users),
                      label: Text('Group'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(LineIcons.peopleCarry),
                      selectedIcon: Icon(LineIcons.peopleCarry),
                      label: Text('Trainers'),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              height: size.height,
              width: size.width * .82,
              color: Color.fromRGBO(20, 26, 47, 1),
              child: _selectedIndex == 0
                  ? homeView(context: context)
                  : _children[_selectedIndex],
            ),
          ),
        ],
      ),
    );
  }
}

GestureDetector sideButtons(
    {index: int, indexSelected: int, onTap: Function, icon: IconData}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      decoration: BoxDecoration(
        color: index == indexSelected
            // ignore: dead_code
            ? Color.fromRGBO(251, 137, 107, 1)
            : Color.fromRGBO(44, 52, 88, 1),
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Icon(
          icon,
          color: index == indexSelected
              // ignore: dead_code
              ? Color.fromRGBO(230, 230, 230, 1)
              : Color.fromRGBO(86, 93, 121, 1),
        ),
      ),
    ),
  );
}

Padding listViewCards({color: Color, data: Array}) {
  return Padding(
    padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
    child: Container(
      child: Stack(
        children: [
          Align(
            child: SfSparkLineChart(
              labelStyle: TextStyle(color: Colors.white.withOpacity(0)),
              axisLineColor: Colors.white.withOpacity(0),
              color: color,

              //Enable the trackball
              trackball: SparkChartTrackball(
                activationMode: SparkChartActivationMode.tap,
                color: color,
                borderColor: color,
              ),

              //Enable marker
              marker: SparkChartMarker(
                displayMode: SparkChartMarkerDisplayMode.all,
                color: color,
                borderColor: color,
              ),
              data: data,
            ),
          ),
          Positioned(
              child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
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
                      textScaleFactor: 3,
                      style: TextStyle(color: Colors.white),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 8, 8, 8),
                      child: Text(
                        'lbs',
                        textScaleFactor: 1,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
                Text(
                  'Weight Gain',
                  style: TextStyle(color: Colors.white.withOpacity(.5)),
                )
              ],
            ),
          ))
        ],
      ),
      width: 128,
      decoration: BoxDecoration(
        color: Color.fromRGBO(37, 44, 76, 1),
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
    ),
  );
}

Padding listViewWorkoutCards() {
  return Padding(
    padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
    child: Row(
      children: [
        Container(
          child: Image(
            fit: BoxFit.fill,
            image: AssetImage('assets/images/DailyWorkout.png'),
          ),
        ),
      ],
    ),
  );
}

Container goalProgressionCard({context: BuildContext}) {
  return Container(
    width: MediaQuery.of(context).size.width * .8,
    height: MediaQuery.of(context).size.height * .15,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5),
      color: Color.fromRGBO(37, 44, 76, 1),
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Your workout goal',
                style: TextStyle(color: Colors.white.withOpacity(.3)),
              ),
              SizedBox(height: 5),
              Text(
                '${CurrentUser.mainWorkoutGoal}',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 50,
          width: 3,
          child: Container(
            color: Colors.white,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '5 lbs',
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 5),
              Text(
                'Weight increase',
                style: TextStyle(color: Colors.white.withOpacity(.3)),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Container homeView({context: BuildContext}) {
  return Container(
    color: Color.fromRGBO(20, 26, 47, 1),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Spacer(flex: 10),
        goalProgressionCard(context: context),
        Spacer(flex: 1),
        Container(
          height: MediaQuery.of(context).size.height * .5,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              SizedBox(width: MediaQuery.of(context).size.width * .02),
              listViewWorkoutCards(),
              listViewWorkoutCards(),
              listViewWorkoutCards(),
            ],
          ),
        ),
        Spacer(flex: 1),
        SizedBox(),
        Spacer(flex: 1),
        Container(
          height: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            children: [
              SizedBox(width: MediaQuery.of(context).size.width * .02),
              listViewCards(
                  color: Color.fromRGBO(41, 69, 142, 1),
                  data: [1, 5, -6, 0, 1, -2, 7, -7, -4]),
              listViewCards(
                  color: Color.fromRGBO(200, 138, 133, 1),
                  data: [1, 1, 2, 3, 2, 2, 2, 2, 3]),
              listViewCards(
                  color: Color.fromRGBO(41, 69, 142, 1),
                  data: [1, 5, -6, 0, 1, -2, 7, -7, -4]),
              listViewCards(
                  color: Color.fromRGBO(41, 69, 142, 1),
                  data: [1, 5, -6, 0, 1, -2, 7, -7, -4]),
            ],
          ),
        ),
        Spacer(flex: 5)
      ],
    ),
  );
}
