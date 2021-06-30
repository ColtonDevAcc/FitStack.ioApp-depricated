import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:line_icons/line_icons.dart';
import 'package:timelines/timelines.dart';
import 'package:workify/controllers/authServices.dart';
import 'package:workify/theme/theme.dart';

class CreatedWorkoutView extends StatelessWidget {
  final String workoutTitle;
  final IconData workoutType;
  final String workoutDescription;

  const CreatedWorkoutView(
      {Key? key,
      required this.workoutTitle,
      required this.workoutType,
      required this.workoutDescription})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            LineIcons.arrowLeft,
            color: Apptheme.mainTextColor,
          ),
        ),
        backgroundColor: Apptheme.mainCardColor,
        title: Text(
          workoutTitle,
          style: TextStyle(color: Apptheme.mainTextColor),
        ),
        actions: [
          GestureDetector(
            onTap: () {},
            child: Icon(
              LineIcons.horizontalEllipsis,
              color: Apptheme.mainTextColor,
            ),
          ),
          SizedBox(width: 15)
        ],
      ),
      backgroundColor: Apptheme.mainBackgroundColor,
      floatingActionButton: SpeedDial(
        icon: LineIcons.plus,
        iconTheme: IconThemeData(color: Apptheme.mainButonColor),
        backgroundColor: Apptheme.mainButonColor.withOpacity(.2),
        onPress: () async {
          await AuthServices.addUserWorkoutDetails(
              workoutCategoryTitle: workoutTitle);
        },
      ),
      body: Column(
        children: [
          Flexible(
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('UserInfo')
                  .doc(AuthServices.userUID)
                  .collection('UserAddedWorkout')
                  .doc(workoutTitle)
                  .collection('UserAddedWorkoutDetails')
                  .snapshots(),
              builder: (BuildContext context, snapshot) {
                if (snapshot.hasError) {
                  return Text('Something went wrong');
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Text("Loading");
                }

                return Timeline.tileBuilder(
                  theme: TimelineThemeData(
                    nodePosition: 0,
                    color: Apptheme.mainButonColor.withOpacity(.2),
                    direction: Axis.vertical,
                    indicatorTheme:
                        IndicatorThemeData(color: Apptheme.mainButonColor),
                  ),
                  shrinkWrap: true,
                  builder: TimelineTileBuilder.fromStyle(
                    contentsAlign: ContentsAlign.basic,
                    contentsBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Dismissible(
                        onDismissed: (value) async {
                          await FirebaseFirestore.instance.runTransaction(
                            (Transaction transaction) async {
                              transaction
                                  .delete(snapshot.data!.docs[index].reference);
                            },
                          );
                        },
                        secondaryBackground: Container(
                          color: Colors.green,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Center(
                                child: Text(
                                  'Add',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              Icon(
                                LineIcons.plus,
                                color: Colors.white,
                              ),
                              SizedBox(width: 10),
                            ],
                          ),
                        ),
                        background: Container(
                          color: Colors.red,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(width: 10),
                              Icon(
                                LineIcons.trash,
                                color: Colors.white,
                              ),
                              Center(
                                child: Text(
                                  'Remove',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ),
                        key: new GlobalKey(),
                        child: ListTile(
                          leading: Icon(
                            LineIcons.dumbbell,
                            color: Apptheme.mainTextColor,
                          ),
                          title: Text(
                            'Workout ${index + 1} ${snapshot.data!.docs[index].get('workoutCategoryTitle')}',
                          ),
                          subtitle: Text(
                            'Reps $index | Sets $index | lbs $index',
                            style: TextStyle(color: Apptheme.mainTextColor),
                          ),
                        ),
                      ),
                    ),
                    itemCount: snapshot.data!.docs.length,
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

/*return new ListView(
                  children:
                      snapshot.data!.docs.map((DocumentSnapshot document) {
                    Map<String, dynamic> data =
                        document.data() as Map<String, dynamic>;

                    return Text(
                      'ddd ${data['workoutCategoryTitle']}',
                      style: TextStyle(color: Apptheme.mainTextColor),
                    );
                  }).toList(),
                ); */
