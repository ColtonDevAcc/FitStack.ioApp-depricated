import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:workify/theme/theme.dart';

class SnakeNavigationBar_Widget extends StatefulWidget {
  const SnakeNavigationBar_Widget(
      {Key? key, required this.currentIndex, required this.onDestinationSelected})
      : super(key: key);
  final int currentIndex;
  final Null Function(dynamic) onDestinationSelected;

  @override
  _SnakeNavigationBar_WidgetState createState() => _SnakeNavigationBar_WidgetState();
}

class _SnakeNavigationBar_WidgetState extends State<SnakeNavigationBar_Widget> {
  @override
  Widget build(BuildContext context) {
    return SnakeNavigationBar.color(
      items: [
        BottomNavigationBarItem(
          icon: Icon(LineIcons.home),
        ),
        BottomNavigationBarItem(
          icon: Icon(LineIcons.dumbbell),
        ),
        BottomNavigationBarItem(
          icon: Icon(LineIcons.utensils),
        ),
        BottomNavigationBarItem(
          icon: Icon(LineIcons.heartAlt),
        ),
        BottomNavigationBarItem(
          icon: Icon(LineIcons.users),
        ),
        BottomNavigationBarItem(
          icon: Icon(LineIcons.horizontalEllipsis),
        ),
      ],
      onTap: this.widget.onDestinationSelected,
      elevation: 4,
      behaviour: SnakeBarBehaviour.floating,
      padding:
          Platform.isIOS ? EdgeInsets.fromLTRB(20, 0, 20, 0) : EdgeInsets.fromLTRB(20, 0, 20, 10),
      currentIndex: this.widget.currentIndex,
      backgroundColor: Apptheme.mainCardColor,
      selectedItemColor: Apptheme.mainButonColor,
      unselectedItemColor: Apptheme.mainIconColor,
      snakeViewColor: Apptheme.mainButonColor,
      snakeShape: SnakeShape.indicator,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      showSelectedLabels: false,
      showUnselectedLabels: false,
    );
  }
}
