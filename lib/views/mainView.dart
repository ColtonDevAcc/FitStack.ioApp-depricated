import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:workify/theme/theme.dart';
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
  @override
  Widget build(BuildContext context) {
    var _currentIndex = 0;
    final List<Widget> _children = [
      HomeView(),
      SavedView(),
      StartWorkoutView(),
      TrainerView(),
      ProfileView(),
    ];

    return Scaffold(
      backgroundColor: Apptheme.mainBackgroundColor,
      bottomNavigationBar: SalomonBottomBar(
        selectedItemColor: Apptheme.mainButonColor,
        unselectedItemColor: Apptheme.mainTextColor,
        currentIndex: _currentIndex,
        onTap: (i) {
          setState(() {
            _currentIndex = i;
          });
        },
        items: [
          SalomonBottomBarItem(icon: Icon(Icons.ac_unit), title: Text('Home')),
          SalomonBottomBarItem(icon: Icon(Icons.favorite), title: Text('Saved')),
          SalomonBottomBarItem(icon: Icon(Icons.control_point), title: Text('Start')),
          SalomonBottomBarItem(icon: Icon(Icons.restaurant), title: Text('Meal Plan')),
          SalomonBottomBarItem(icon: Icon(Icons.groups), title: Text('Trainers')),
          SalomonBottomBarItem(icon: Icon(Icons.person), title: Text('Profile')),
        ],
      ),
      body: _children[_currentIndex],
    );
  }
}
