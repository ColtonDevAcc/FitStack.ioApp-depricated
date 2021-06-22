import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:simple_speed_dial/simple_speed_dial.dart';
import 'package:workify/theme/theme.dart';
import 'package:workify/views/profile/profileView.dart';
import 'package:workify/views/savedVideo/savedView.dart';
import 'package:workify/views/startWorkout/startWorkoutView.dart';
import 'package:workify/views/trainer/trainerView.dart';
import 'home/homeView.dart';
import 'mealPlan/mealPlanView.dart';

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  var _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    TextEditingController workoutTitleTextController = TextEditingController();
    TextEditingController workoutTagsTextController = TextEditingController();

    double _screenHeight = MediaQuery.of(context).size.height.toDouble();
    double _screenWidth = MediaQuery.of(context).size.width.toDouble();

    void changeTabs({index: int}) {
      setState(() {
        _currentIndex = index;
      });
    }

    final List<Widget> _children = [
      HomeView(),
      SavedView(),
      StartWorkoutView(),
      MealPlanView(),
      TrainerView(),
      ProfileView(),
    ];

    return Scaffold(
      body: _children[_currentIndex],
      backgroundColor: Apptheme.mainBackgroundColor,
      floatingActionButton: _currentIndex == 2 || _currentIndex == 3
          ? _currentIndex == 2
              ? addWorkoutFAB(context, _screenHeight, _screenWidth,
                  workoutTitleTextController, workoutTagsTextController)
              : SpeedDial(
                  labelsStyle: TextStyle(color: Colors.black),
                  closedBackgroundColor:
                      Apptheme.mainButonColor.withOpacity(.2),
                  openBackgroundColor: Apptheme.mainButonColor.withOpacity(.2),
                  openForegroundColor: Apptheme.mainButonColor.withOpacity(.2),
                  closedForegroundColor:
                      Apptheme.mainButonColor.withOpacity(.2),
                  child: Icon(Icons.add, color: Apptheme.mainButonColor),
                  speedDialChildren: [
                    SpeedDialChild(
                        child: Icon(LineIcons.search,
                            color: Apptheme.mainButonColor),
                        onPressed: () {},
                        label: 'Search Entries',
                        backgroundColor:
                            Apptheme.mainButonColor.withOpacity(.2)),
                    SpeedDialChild(
                        child: Icon(LineIcons.edit,
                            color: Apptheme.mainButonColor),
                        onPressed: () {},
                        label: 'Add Entry',
                        backgroundColor:
                            Apptheme.mainButonColor.withOpacity(.2)),
                    SpeedDialChild(
                        child: Icon(LineIcons.camera,
                            color: Apptheme.mainButonColor),
                        onPressed: () {},
                        label: 'Scan',
                        backgroundColor:
                            Apptheme.mainButonColor.withOpacity(.2)),
                  ],
                )
          : null,
      bottomNavigationBar: SalomonBottomBar(
        selectedItemColor: Apptheme.mainButonColor,
        unselectedItemColor: Apptheme.mainTextColor,
        currentIndex: _currentIndex,
        onTap: (index) {
          changeTabs(index: index);
          print(_children[_currentIndex]);
        },
        items: [
          SalomonBottomBarItem(
              icon: Icon(Icons.home, size: 22), title: Text('Home')),
          SalomonBottomBarItem(
              icon: Icon(Icons.favorite, size: 22), title: Text('Saved')),
          SalomonBottomBarItem(
              icon: Icon(Icons.control_point, size: 22), title: Text('Create')),
          SalomonBottomBarItem(
              icon: Icon(Icons.restaurant, size: 22), title: Text('Nutrition')),
          SalomonBottomBarItem(
              icon: Icon(Icons.groups, size: 22), title: Text('Trainers')),
          SalomonBottomBarItem(
              icon: Icon(Icons.person, size: 22), title: Text('Profile')),
        ],
      ),
    );
  }

  FloatingActionButton addWorkoutFAB(
      BuildContext context,
      double _screenHeight,
      double _screenWidth,
      TextEditingController workoutTitleTextController,
      TextEditingController workoutTagsTextController) {
    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet(
          backgroundColor: Apptheme.mainBackgroundColor,
          context: context,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          builder: (context) {
            return Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.close, color: Apptheme.mainTextColor),
                          Text('Create Your Workout',
                              style: TextStyle(color: Apptheme.mainTextColor)),
                          Icon(Icons.add, color: Apptheme.mainTextColor),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 13, 0, 13),
                        child: Text('Workout Type',
                            textScaleFactor: 1.2,
                            style: TextStyle(color: Apptheme.mainTextColor)),
                      ),
                      Row(
                        children: [
                          Container(
                            height: _screenHeight / 10,
                            width: _screenWidth - 20,
                            child: ListView(
                              addAutomaticKeepAlives: true,
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              children: [
                                workoutCatTypesButton(
                                    icon: LineIcons.running, title: 'Cardio'),
                                workoutCatTypesButton(
                                    icon: LineIcons.bicycle, title: 'Cycling'),
                                workoutCatTypesButton(
                                    icon: LineIcons.heartbeat,
                                    title: 'Cross-Fit'),
                                workoutCatTypesButton(
                                    icon: LineIcons.dumbbell,
                                    title: 'Weight Lifting'),
                                workoutCatTypesButton(
                                    icon: LineIcons.swimmer, title: 'Swimming'),
                                workoutCatTypesButton(
                                    icon: LineIcons.hiking, title: 'Rucking'),
                              ],
                            ),
                          )
                        ],
                      ),
                      Padding(
                          padding: const EdgeInsets.fromLTRB(0, 15, 0, 10),
                          child: Text('Workout Title',
                              textScaleFactor: 1.2,
                              style: TextStyle(color: Apptheme.mainTextColor))),
                      TextField(
                        controller: workoutTitleTextController,
                        decoration: (InputDecoration(
                          hintText: 'Workout 1',
                          hintStyle: TextStyle(
                              color: Apptheme.mainTextColor.withOpacity(0.2)),
                          fillColor: Apptheme.mainTextColor,
                          focusedBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Apptheme.mainTextColor),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Apptheme.mainTextColor),
                          ),
                          border: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Apptheme.mainTextColor),
                          ),
                        )),
                      ),
                      Padding(
                          padding: const EdgeInsets.fromLTRB(0, 15, 0, 10),
                          child: Text('Workout Tags',
                              textScaleFactor: 1.2,
                              style: TextStyle(color: Apptheme.mainTextColor))),
                      TextField(
                        controller: workoutTagsTextController,
                        decoration: (InputDecoration(
                          hintText: 'tag 1, tag 2, etc..',
                          hintStyle: TextStyle(
                              color: Apptheme.mainTextColor.withOpacity(0.2)),
                          fillColor: Apptheme.mainTextColor,
                          focusedBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Apptheme.mainTextColor),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Apptheme.mainTextColor),
                          ),
                          border: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Apptheme.mainTextColor),
                          ),
                        )),
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                Apptheme.mainButonColor.withOpacity(.2))),
                        onPressed: () {},
                        child: Expanded(
                          child: Container(
                            width: double.infinity,
                            child: Center(
                              child: Text(
                                'Add Workout',
                                style:
                                    TextStyle(color: Apptheme.mainButonColor),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        );
      },
      backgroundColor: Apptheme.mainButonColor.withOpacity(.2),
      child: Icon(Icons.add, color: Apptheme.mainButonColor),
    );
  }

  Padding workoutCatTypesButton({icon: LineIcons, title: String}) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
      child: Column(
        children: [
          Expanded(
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                    Apptheme.mainButonColor.withOpacity(0.2)),
                shape: MaterialStateProperty.all(
                  CircleBorder(),
                ),
              ),
              child: Expanded(
                child: Icon(
                  icon,
                  size: 40,
                  color: Apptheme.mainButonColor,
                ),
              ),
              onPressed: () {},
            ),
          ),
          SizedBox(height: 3),
          Text(title, style: TextStyle(color: Apptheme.mainTextColor))
        ],
      ),
    );
  }
}
