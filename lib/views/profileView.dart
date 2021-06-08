import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:workify/theme/theme.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Icon(
                    Icons.menu,
                    color: Apptheme.mainTextColor,
                  ),
                ),
                Text('Profile', textScaleFactor: 1.2, style: TextStyle(color: Apptheme.mainTextColor, fontWeight: FontWeight.bold)),
                Container(
                  child: Icon(
                    Icons.more_horiz,
                    color: Apptheme.mainTextColor,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/images/gymGirl.png'),
              radius: 80,
            ),
          ),
          Text('User Name', textScaleFactor: 1.5, style: TextStyle(color: Apptheme.mainTextColor, fontWeight: FontWeight.bold)),
          Text('Nationality  🇺🇲', textScaleFactor: 1, style: TextStyle(color: Apptheme.mainTextColor, fontWeight: FontWeight.w300)),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(40, 0, 20, 0),
                  child: Column(
                    children: [
                      Text('260 lbs', textScaleFactor: 1.5, style: TextStyle(color: Apptheme.mainTextColor, fontWeight: FontWeight.bold)),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: Text('Weight', textScaleFactor: 1, style: TextStyle(color: Apptheme.mainTextColor, fontWeight: FontWeight.w300)),
                      ),
                    ],
                  ),
                ),
                Container(color: Apptheme.mainTextColor, child: SizedBox(width: 1, height: 40)),
                Column(
                  children: [
                    Text('6"4', textScaleFactor: 1.5, style: TextStyle(color: Apptheme.mainTextColor, fontWeight: FontWeight.bold)),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                      child: Text('Height', textScaleFactor: 1, style: TextStyle(color: Apptheme.mainTextColor, fontWeight: FontWeight.w300)),
                    ),
                  ],
                ),
                Container(color: Apptheme.mainTextColor, child: SizedBox(width: 1, height: 40)),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 40, 0),
                  child: Column(
                    children: [
                      Text('21', textScaleFactor: 1.5, style: TextStyle(color: Apptheme.mainTextColor, fontWeight: FontWeight.bold)),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: Text('Age', textScaleFactor: 1, style: TextStyle(color: Apptheme.mainTextColor, fontWeight: FontWeight.w300)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
