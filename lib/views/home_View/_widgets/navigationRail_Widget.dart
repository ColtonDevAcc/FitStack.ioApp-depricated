import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';
import 'package:workify/providers/userProvider.dart';
import 'package:workify/theme/theme.dart';
import 'package:workify/views/mealPlan_View/NutritonMain_View.dart';
import 'package:workify/views/profile/profileView.dart';
import 'package:workify/views/recovery/recoveryView.dart';
import 'package:workify/views/relationShip_View/relationshipMain_View.dart';
import 'package:workify/views/saved/savedView.dart';
import 'package:workify/views/trainer/trainerView.dart';

import '../mainHome_View.dart';

class NavigationRail_Widget extends StatefulWidget {
  const NavigationRail_Widget({Key? key}) : super(key: key);

  @override
  _NavigationRail_WidgetState createState() => _NavigationRail_WidgetState();
}

class _NavigationRail_WidgetState extends State<NavigationRail_Widget> {
  @override
  Widget build(BuildContext context) {
    var user = Provider.of<UserProvider>(context);
    final List<Widget> _children = [
      MainView(),
      Nutrition_View(),
      SavedView(),
      GroupView(),
      RecoveryView(),
      TrainerView(),
    ];
    int indexSelected = 1;
    var _currentIndex = 0;
    double _screenHeight = MediaQuery.of(context).size.width.toDouble();

    return NavigationRail(
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
              style: TextStyle(color: Apptheme.mainButonColor, fontWeight: FontWeight.bold),
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
              style: TextStyle(color: Apptheme.mainButonColor, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 25),
          RotatedBox(
            quarterTurns: 3,
            child: Text(
              'Feed',
              style: TextStyle(color: Apptheme.mainButonColor, fontWeight: FontWeight.bold),
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
    );
  }
}
