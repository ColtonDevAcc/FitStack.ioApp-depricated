import 'dart:ffi';
import 'dart:math';

import 'package:chart_sparkline/chart_sparkline.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';
import 'package:workify/providers/userProvider.dart';
import 'package:workify/theme/theme.dart';
import 'package:workify/views/group/groupView.dart';
import 'package:workify/views/mealPlan/mealPlanView.dart';
import 'package:workify/views/profile/profileView.dart';
import 'package:workify/views/recovery/recoveryView.dart';
import 'package:workify/views/saved/savedView.dart';
import 'package:workify/views/trainer/trainerView.dart';

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
    MealPlanView(),
    SavedView(),
    GroupView(),
    RecoveryView(),
    TrainerView(),
  ];

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<UserProvider>(context);

    double _screenHeight = MediaQuery.of(context).size.width.toDouble();

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Apptheme.mainBackgroundColor,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              color: Apptheme.mainBackgroundColor,
              width: size.width * .2,
              height: size.height,
              child: NavigationRail(
                backgroundColor: Apptheme.mainCardColor,
                selectedIndex: _currentIndex,
                unselectedIconTheme: IconThemeData(color: Apptheme.mainIconColor, size: 30),
                selectedIconTheme: IconThemeData(
                  color: Apptheme.mainButonColor,
                ),
                onDestinationSelected: (int index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                leading: Column(
                  children: [
                    SizedBox(height: AppBar().preferredSize.height - 5),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProfileView(),
                          ),
                        );
                      },
                      child: CircleAvatar(
                        backgroundColor: Color.fromRGBO(37, 44, 76, 1),
                        backgroundImage: NetworkImage(
                            'https://guycounseling.com/wp-content/uploads/2015/06/body-building-advanced-training-techniques-678x381.jpg'),
                      ),
                    ),
                    SizedBox(height: 20),
                    RotatedBox(
                      quarterTurns: 3,
                      child: Text(
                        user.userName ?? 'null',
                        style:
                            TextStyle(color: Apptheme.mainButonColor, fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
                minWidth: 56,
                groupAlignment: 1,
                labelType: NavigationRailLabelType.none,
                selectedLabelTextStyle: TextStyle(color: Colors.white),
                trailing: Column(
                  children: [
                    SizedBox(height: _screenHeight * .30),
                    RotatedBox(
                      quarterTurns: 3,
                      child: Text(
                        'OverView',
                        style:
                            TextStyle(color: Apptheme.mainButonColor, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(height: 25),
                    RotatedBox(
                      quarterTurns: 3,
                      child: Text(
                        'Feed',
                        style:
                            TextStyle(color: Apptheme.mainButonColor, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(height: 20),
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
                    icon: Icon(LineIcons.heart),
                    selectedIcon: Icon(LineIcons.heartAlt),
                    label: Text('Workout'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(LineIcons.users),
                    selectedIcon: Icon(LineIcons.users),
                    label: Text('Group'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.accessibility),
                    selectedIcon: Icon(Icons.accessibility),
                    label: Text('Trainers'),
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
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              height: size.height,
              width: size.width * .82,
              color: Apptheme.mainBackgroundColor,
              child: _currentIndex == 0 ? homeView(context: context) : _children[_currentIndex],
            ),
          ),
        ],
      ),
    );
  }

  Padding listViewCards({color: Color, data: Array}) {
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

  Padding listViewWorkoutCards({context: BuildContext}) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 10,
                    blurRadius: 5,
                    offset: Offset(0, 7), // changes position of shadow
                  ),
                ],
              ),
              height: MediaQuery.of(context).size.height * .35,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Image(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/images/DailyWorkout.png'),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: MediaQuery.of(context).size.height * .12,
                      color: Apptheme.mainCardColor,
                      width: MediaQuery.of(context).size.width * .445,
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Fat Burn Max',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 2),
                          Expanded(
                            child: Text(
                              'It is a long established fact that a reader will; random text text text  ',
                              style: TextStyle(color: Colors.black),
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
        ],
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
                  'HOW YOUR DAY LOOKS',
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
                statsForContainer(
                  color: Color.fromRGBO(253, 117, 5, 1),
                  icon: LineIcons.tint,
                  value: .73,
                ),
                statsForContainer(
                  color: Color.fromRGBO(230, 64, 64, 1),
                  icon: Icons.local_fire_department,
                  value: .30,
                ),
                statsForContainer(
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
                    listViewWorkoutCards(context: context),
                    listViewWorkoutCards(context: context),
                    listViewWorkoutCards(context: context),
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
                    listViewCards(
                        color: Color.fromRGBO(41, 69, 142, 1),
                        data: [1, 5, -6, 0, 1, -2, 7, -7, -4]),
                    listViewCards(
                        color: Color.fromRGBO(200, 138, 133, 1), data: [1, 1, 2, 3, 2, 2, 2, 2, 3]),
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
        ],
      ),
    );
  }

  Row statsForContainer({icon: LineIcons, color: Color, value: Double}) {
    double value1 = value * 100;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(
          backgroundColor: Apptheme.mainCardColor,
          child: Icon(
            icon,
            color: color,
          ),
        ),
        Flexible(
          child: ListTile(
            visualDensity: VisualDensity(horizontal: 0, vertical: -4),
            title: Text(
              '${value1.toInt()}%',
              style: TextStyle(color: color, fontWeight: FontWeight.bold),
            ),
            subtitle: LinearProgressIndicator(
              value: value,
              color: color,
              backgroundColor: Colors.grey.withOpacity(.4),
            ),
          ),
        )
      ],
    );
  }
}
