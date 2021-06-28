import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:line_icons/line_icons.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:workify/theme/theme.dart';
import 'package:workify/views/createWorkout/createWorkoutView.dart';
import 'package:workify/views/profile/profileView.dart';
import 'package:workify/views/startWorkout/startWorkoutView.dart';
import 'package:workify/views/trainer/trainerView.dart';
import 'package:workify/widgets/addMealEntry.dart';
import 'package:workify/widgets/addWorkoutFAB.dart';
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
      resizeToAvoidBottomInset: true,
      body: _children[_currentIndex],
      backgroundColor: Apptheme.mainBackgroundColor,
      floatingActionButton: _currentIndex == 2 || _currentIndex == 3
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
}
