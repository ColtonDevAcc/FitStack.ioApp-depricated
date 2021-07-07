import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:line_icons/line_icons.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import 'package:workify/controllers/currentUser.dart';
import 'package:workify/controllers/currentUserNutrition.dart';
import 'package:workify/theme/theme.dart';
import 'package:workify/views/mealPlan/mealPlanView.dart';
import 'package:workify/views/profile/profileView.dart';
import 'package:workify/views/saved/savedView.dart';
import 'package:workify/views/startWorkout/startWorkoutView.dart';
import 'package:workify/views/trainer/trainerView.dart';
import 'package:workify/widgets/addMealEntry.dart';
import 'package:workify/widgets/addWorkoutFAB.dart';

class DarkOne extends StatefulWidget {
  const DarkOne({Key? key}) : super(key: key);

  @override
  _DarkOneState createState() => _DarkOneState();
}

class _DarkOneState extends State<DarkOne> {
  int indexSelected = 1;
  var _currentIndex = 0;
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
    double _screenWidth = MediaQuery.of(context).size.width.toDouble();
    double _screenHeight = MediaQuery.of(context).size.width.toDouble();

    TextEditingController workoutTitleTextController = TextEditingController();
    TextEditingController workoutDescriptionTextController =
        TextEditingController();
    TextEditingController workoutTypeTextController = TextEditingController();
    TextEditingController workoutTagsTextController = TextEditingController();

    final TextEditingController calorieTextControler = TextEditingController();
    final TextEditingController transfatTextControler = TextEditingController();
    final TextEditingController cholesterolTextControler =
        TextEditingController();
    final TextEditingController sodiumTextControler = TextEditingController();
    final TextEditingController totalcarbsTextControler =
        TextEditingController();
    final TextEditingController proteinTextControler = TextEditingController();
    final TextEditingController vitaminAcalorieTextControler =
        TextEditingController();
    final TextEditingController vitaminCTextControler = TextEditingController();
    final TextEditingController calciumTextControler = TextEditingController();
    final TextEditingController ironTextControler = TextEditingController();
    final TextEditingController titleTextController = TextEditingController();

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: _currentIndex == 1 || _currentIndex == 3
          ? _currentIndex == 2
              ? AddWorkoutFAB(
                  context: context,
                  screenWidth: _screenWidth,
                  screenHeight: _screenHeight,
                  workoutDescriptionTextController:
                      workoutDescriptionTextController,
                  workoutTagsTextController: workoutTagsTextController,
                  workoutTitleTextController: workoutTitleTextController,
                  workoutTypeTextController: workoutTypeTextController,
                )
              : SpeedDial(
                  overlayColor: Colors.transparent,
                  child: Icon(Icons.add, color: Apptheme.mainButonColor),
                  backgroundColor: Apptheme.mainButonColor.withOpacity(.2),
                  activeIcon: Icons.add,
                  activeForegroundColor: Apptheme.mainButonColor,
                  activeBackgroundColor:
                      Apptheme.mainButonColor.withOpacity(.2),
                  children: [
                    SpeedDialChild(
                        foregroundColor:
                            Apptheme.mainButonColor.withOpacity(.2),
                        labelBackgroundColor: Apptheme.mainCardColor,
                        child: Icon(LineIcons.search,
                            color: Apptheme.mainButonColor),
                        onTap: () {},
                        label: 'Search Entries',
                        labelStyle: TextStyle(color: Apptheme.mainTextColor),
                        backgroundColor:
                            Apptheme.mainButonColor.withOpacity(.2)),
                    SpeedDialChild(
                        labelStyle: TextStyle(color: Apptheme.mainTextColor),
                        foregroundColor:
                            Apptheme.mainButonColor.withOpacity(.2),
                        labelBackgroundColor: Apptheme.mainCardColor,
                        child: Icon(LineIcons.edit,
                            color: Apptheme.mainButonColor),
                        onTap: () {
                          showModalBottomSheet(
                            isScrollControlled: true,
                            context: context,
                            backgroundColor: Apptheme.mainBackgroundColor,
                            builder: (context) {
                              return ListView(
                                children: [
                                  Column(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.fromLTRB(
                                            0,
                                            AppBar().preferredSize.height,
                                            0,
                                            0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                Navigator.pop(context);
                                              },
                                              child: Icon(
                                                LineIcons.times,
                                                color: Apptheme.mainTextColor,
                                              ),
                                            ),
                                            Text(
                                              'Add entry',
                                              textScaleFactor: 1.5,
                                              style: TextStyle(
                                                color: Apptheme.mainTextColor,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                print('camera pressed');
                                              },
                                              child: Icon(
                                                LineIcons.camera,
                                                color: Apptheme.mainTextColor,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      SizedBox(height: 5),
                                      AddMealEntry(
                                        calorieTextControler:
                                            calorieTextControler,
                                        transfatTextControler:
                                            transfatTextControler,
                                        cholesterolTextControler:
                                            cholesterolTextControler,
                                        sodiumTextControler:
                                            sodiumTextControler,
                                        totalcarbsTextControler:
                                            totalcarbsTextControler,
                                        proteinTextControler:
                                            proteinTextControler,
                                        vitaminAcalorieTextControler:
                                            vitaminAcalorieTextControler,
                                        vitaminCTextControler:
                                            vitaminCTextControler,
                                        calciumTextControler:
                                            calciumTextControler,
                                        ironTextControler: ironTextControler,
                                        titleTextController:
                                            titleTextController,
                                      )
                                    ],
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        label: 'Add Entry',
                        backgroundColor:
                            Apptheme.mainButonColor.withOpacity(.2)),
                    SpeedDialChild(
                        labelStyle: TextStyle(color: Apptheme.mainTextColor),
                        foregroundColor:
                            Apptheme.mainButonColor.withOpacity(.2),
                        labelBackgroundColor: Apptheme.mainCardColor,
                        child: Icon(LineIcons.camera,
                            color: Apptheme.mainButonColor),
                        onTap: () {},
                        label: 'Scan',
                        backgroundColor:
                            Apptheme.mainButonColor.withOpacity(.2)),
                  ],
                )
          : null,
      backgroundColor: Color.fromRGBO(20, 26, 47, 1),
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
                  topRight: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
                child: NavigationRail(
                  backgroundColor: Color.fromRGBO(33, 40, 67, 1),
                  selectedIndex: _currentIndex,
                  unselectedIconTheme: IconThemeData(
                    color: Colors.white.withOpacity(.5),
                  ),
                  selectedIconTheme: IconThemeData(
                    color: Color.fromRGBO(250, 137, 107, 1),
                  ),
                  onDestinationSelected: (int index) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                  leading: Column(
                    children: [
                      SizedBox(
                        height: AppBar().preferredSize.height - 20,
                      ),
                      CircleAvatar(
                        backgroundColor: Color.fromRGBO(37, 44, 76, 1),
                        backgroundImage: NetworkImage(
                            'https://guycounseling.com/wp-content/uploads/2015/06/body-building-advanced-training-techniques-678x381.jpg'),
                      ),
                      SizedBox(height: 20),
                      RotatedBox(
                        quarterTurns: 3,
                        child: Text(
                          CurrentUser.userName,
                          style: TextStyle(color: Apptheme.mainTextColor),
                        ),
                      )
                    ],
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
              child: _currentIndex == 0
                  ? homeView(context: context)
                  : _children[_currentIndex],
            ),
          ),
        ],
      ),
    );
  }

  Padding listViewCards({color: Color, data: Array}) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 10, 10, 0),
      child: Container(
        child: Stack(
          children: [
            Align(
              child: Padding(
                padding: const EdgeInsets.all(5.0),
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
            ),
            Positioned(
                child: Padding(
              padding: const EdgeInsets.all(20),
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
                        padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
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

  Container homeView({context: BuildContext}) {
    return Container(
      color: Color.fromRGBO(20, 26, 47, 1),
      child: ListView(
        children: [
          SizedBox(height: AppBar().preferredSize.height - 13),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 0, 10),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Apptheme.mainCardColor.withOpacity(.8),
              ),
              height: 130,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 35, 0),
                child: Row(
                  children: [
                    Expanded(child: radialNutrientsGraph(context: context)),
                    Text(
                      'Hows your day look?',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * .35,
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
        ],
      ),
    );
  }

  SfCircularChart radialNutrientsGraph({context: BuildContext}) {
    return SfCircularChart(
      palette: [Colors.white, Apptheme.mainButonColor, Colors.blue],
      margin: EdgeInsets.all(0),
      series: [
        RadialBarSeries<_PieData, String>(
          dataSource: [pieData1, pieData2, pieData3],
          xValueMapper: (_PieData data, _) => data.xData,
          yValueMapper: (_PieData data, _) => data.yData,
          dataLabelMapper: (_PieData data, _) => data.text,
          dataLabelSettings: DataLabelSettings(isVisible: true),
          strokeColor: Colors.white,
          trackBorderColor: Colors.transparent,
          trackColor: Colors.transparent,
          gap: '7',
        ),
      ],
    );
  }

  _PieData pieData1 = _PieData(
      '2', CurrentUserNutrition.userRecommendedCalorieIntake!, 'calories');
  _PieData pieData2 = _PieData(
      '2', CurrentUserNutrition.userRecommendedProteinIntake!, 'protein');
  _PieData pieData3 = _PieData('2', 400, 'hydration');
}

class _PieData {
  _PieData(
    this.xData,
    this.yData,
    this.text,
  );
  final String xData;
  final double yData;
  final String text;
}
