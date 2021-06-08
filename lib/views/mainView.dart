import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:workify/theme/theme.dart';
import 'package:workify/views/mealPlanView.dart';
import 'package:workify/views/profileView.dart';
import 'package:workify/views/savedView.dart';
import 'package:workify/views/startWorkoutView.dart';
import 'package:workify/views/trainerView.dart';
import 'home/homeView.dart';

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  var _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
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
      bottomNavigationBar: SalomonBottomBar(
        selectedItemColor: Apptheme.mainButonColor,
        unselectedItemColor: Apptheme.mainTextColor,
        currentIndex: _currentIndex,
        onTap: (index) {
          changeTabs(index: index);
          print(_children[_currentIndex]);
        },
        items: [
          SalomonBottomBarItem(icon: Icon(Icons.home, size: 22), title: Text('Home')),
          SalomonBottomBarItem(icon: Icon(Icons.favorite, size: 22), title: Text('Saved')),
          SalomonBottomBarItem(icon: Icon(Icons.control_point, size: 22), title: Text('Start')),
          SalomonBottomBarItem(icon: Icon(Icons.restaurant, size: 22), title: Text('Nutrition')),
          SalomonBottomBarItem(icon: Icon(Icons.groups, size: 22), title: Text('Trainers')),
          SalomonBottomBarItem(icon: Icon(Icons.person, size: 22), title: Text('Profile')),
        ],
      ),
    );
  }
}
