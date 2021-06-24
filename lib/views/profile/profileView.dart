import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:workify/controllers/currentUser.dart';
import 'package:workify/theme/theme.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Icon(
                    Icons.menu,
                    color: Apptheme.mainTextColor,
                  ),
                ),
                Text('Profile',
                    textScaleFactor: 1.2,
                    style: TextStyle(
                        color: Apptheme.mainTextColor,
                        fontWeight: FontWeight.bold)),
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
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 20),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(73),
                color: Apptheme.mainCardColor,
              ),
              child: CircleAvatar(
                foregroundColor: Apptheme.mainCardColor,
                backgroundColor: Apptheme.mainCardColor,
                backgroundImage: AssetImage('assets/images/gymGirl.png'),
                radius: 80,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Column(
              children: [
                Text("${CurrentUser.firstName} ${CurrentUser.lastName}",
                    textScaleFactor: 1.5,
                    style: TextStyle(
                        color: Apptheme.mainTextColor,
                        fontWeight: FontWeight.bold)),
                Text('${CurrentUser.nationality}  🇺🇲',
                    textScaleFactor: 1,
                    style: TextStyle(
                        color: Apptheme.mainTextColor,
                        fontWeight: FontWeight.w300)),
              ],
            ),
          ),
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
                      Text('${CurrentUser.weight!.toInt()}',
                          textScaleFactor: 1.5,
                          style: TextStyle(
                              color: Apptheme.mainTextColor,
                              fontWeight: FontWeight.bold)),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: Text('Weight',
                            textScaleFactor: 1,
                            style: TextStyle(
                                color: Apptheme.mainTextColor,
                                fontWeight: FontWeight.w300)),
                      ),
                    ],
                  ),
                ),
                Container(
                    color: Apptheme.mainTextColor,
                    child: SizedBox(width: 1, height: 40)),
                Column(
                  children: [
                    Text(
                        '${CurrentUser.height! ~/ 12}"${(CurrentUser.height! % 12).round()}',
                        textScaleFactor: 1.5,
                        style: TextStyle(
                            color: Apptheme.mainTextColor,
                            fontWeight: FontWeight.bold)),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                      child: Text('Height',
                          textScaleFactor: 1,
                          style: TextStyle(
                              color: Apptheme.mainTextColor,
                              fontWeight: FontWeight.w300)),
                    ),
                  ],
                ),
                Container(
                    color: Apptheme.mainTextColor,
                    child: SizedBox(width: 1, height: 40)),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 75, 0),
                  child: Column(
                    children: [
                      Text('${CurrentUser.age}',
                          textScaleFactor: 1.5,
                          style: TextStyle(
                              color: Apptheme.mainTextColor,
                              fontWeight: FontWeight.bold)),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: Text('Age',
                            textScaleFactor: 1,
                            style: TextStyle(
                                color: Apptheme.mainTextColor,
                                fontWeight: FontWeight.w300)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 25, 20, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: userStatisticsTab(
                        icon: Icons.favorite,
                        detailsString: 'bpm',
                        value: 120)),
                Expanded(
                    child: userStatisticsTab(
                        icon: Icons.local_fire_department,
                        detailsString: 'kcal',
                        value: 120)),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: userStatisticsTab(
                        icon: Icons.schedule,
                        detailsString: 'hrs',
                        value: 120)),
                Expanded(
                    child: userStatisticsTab(
                        icon: Icons.whatshot,
                        detailsString: 'W streak',
                        value: 10)),
              ],
            ),
          ),
          Expanded(
            child: productivityStatistics(),
          )
        ],
      ),
    );
  }
}

Padding userStatisticsTab({icon: IconData, detailsString: String, value: int}) {
  return Padding(
    padding: EdgeInsets.all(5),
    child: Row(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Apptheme.mainCardColor),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    icon,
                    color: Apptheme.mainButonColor,
                  ),
                  SizedBox(height: 40),
                  Row(
                    children: [
                      Text(value.toString(),
                          textScaleFactor: 1.5,
                          style: TextStyle(color: Apptheme.mainTextColor)),
                      SizedBox(width: 5),
                      Text(detailsString,
                          style: TextStyle(color: Apptheme.mainTextColor)),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

Padding productivityStatistics() {
  return Padding(
    padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
    child: Container(
      decoration: BoxDecoration(
          color: Apptheme.mainCardColor,
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Productivity Statistics',
                    style: TextStyle(color: Apptheme.mainTextColor)),
              ],
            ),
          )
        ],
      ),
    ),
  );
}
