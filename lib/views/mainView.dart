import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:line_icons/line_icons.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:workify/theme/theme.dart';
import 'package:workify/views/profile/profileView.dart';
import 'package:workify/views/savedVideo/savedView.dart';
import 'package:workify/views/startWorkout/startWorkoutView.dart';
import 'package:workify/views/trainer/trainerView.dart';
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
                        onTap: () {},
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
