import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:workify/controllers/authServices.dart';
import 'package:workify/theme/theme.dart';

class StartWorkoutView extends StatefulWidget {
  const StartWorkoutView({Key? key}) : super(key: key);

  @override
  _StartWorkoutViewState createState() => _StartWorkoutViewState();
}

class _StartWorkoutViewState extends State<StartWorkoutView> {
  @override
  Widget build(BuildContext context) {
    Map<String, IconData> iconList = {
      'Weight Lifting': LineIcons.dumbbell,
      'Cardio': LineIcons.running,
      'Cycling': LineIcons.bicycle,
      'Cross-Fit': LineIcons.heartbeat,
      'Swimming': LineIcons.swimmer,
      'Rucking': LineIcons.hiking,
      'run': Icons.error,
      'Default': Icons.error
    };

    return SafeArea(
      child: Column(
        children: [
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Recent workouts',
                textScaleFactor: 1.3,
                style: TextStyle(color: Apptheme.mainTextColor),
              ),
            ],
          ),
          Flexible(
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('UserInfo')
                  .doc(AuthServices.userUID)
                  .collection('UserAddedWorkout')
                  .snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Text('Something went wrong');
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Text("Loading");
                }

                return new ListView(
                  children:
                      snapshot.data!.docs.map((DocumentSnapshot document) {
                    Map<String, dynamic> data =
                        document.data() as Map<String, dynamic>;

                    return new ListTile(
                      leading: Icon(
                        iconList[data['userAddedWorkoutType']],
                        color: Apptheme.mainTextColor,
                      ),
                      title: new Text(data['userAddedWorkoutTitle']),
                      subtitle: Row(
                        children: [
                          new Text(
                            data['userAddedWorkoutDescription'],
                            style: TextStyle(color: Apptheme.mainTextColor),
                          ),
                          SizedBox(width: 2),
                          Text(
                            ' --  ${data['userAddedWorkoutTags'].take(3)}',
                            textScaleFactor: .8,
                            style: TextStyle(color: Apptheme.mainTextColor),
                          ),
                        ],
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        color: Apptheme.mainTextColor,
                      ),
                    );
                  }).toList(),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
