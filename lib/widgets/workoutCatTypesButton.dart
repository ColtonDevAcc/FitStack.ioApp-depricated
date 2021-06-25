import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:workify/theme/theme.dart';

class WorkoutCatTypesButton extends StatelessWidget {
  final IconData icon;
  final String title;

  const WorkoutCatTypesButton({Key? key, required this.icon, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
      child: Column(
        children: [
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                  Apptheme.mainButonColor.withOpacity(0.2)),
              shape: MaterialStateProperty.all(
                CircleBorder(),
              ),
              padding: MaterialStateProperty.all(EdgeInsets.all(10)),
            ),
            child: Icon(
              icon,
              size: 40,
              color: Apptheme.mainButonColor,
            ),
            onPressed: () {},
          ),
          SizedBox(height: 3),
          Text(title, style: TextStyle(color: Apptheme.mainTextColor))
        ],
      ),
    );
  }
}
