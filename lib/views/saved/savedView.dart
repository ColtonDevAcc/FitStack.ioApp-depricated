import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:workify/services/authServices.dart';
import 'package:workify/theme/theme.dart';
import 'package:workify/views/saved/savedMealPlan.dart';
import 'package:workify/views/saved/workoutView.dart';

class SavedView extends StatefulWidget {
  const SavedView({Key? key}) : super(key: key);

  @override
  _SavedViewState createState() => _SavedViewState();
}

class _SavedViewState extends State<SavedView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Apptheme.secondaryAccent,
          child: Icon(LineIcons.plus),
        ),
        backgroundColor: Apptheme.mainBackgroundColor,
        body: DefaultTabController(
          length: 3,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: AppBar().preferredSize.height),
                Text(
                  'MY WORKOUTS',
                  textScaleFactor: 1.4,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 15),
                Container(
                  height: 35,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(
                      25.0,
                    ),
                  ),
                  child: TabBar(
                    // give the indicator a decoration (color and border radius)
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        25.0,
                      ),
                      color: Apptheme.mainButonColor,
                    ),
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.grey,
                    tabs: [
                      // first tab [you can add an icon using the icon property]
                      Tab(
                        text: 'Workouts',
                      ),
                      // second tab [you can add an icon using the icon property]
                      Tab(
                        text: 'Meal Plans',
                      ),
                      Tab(
                        text: 'Fit Kits',
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Expanded(
                          child: TabBarView(
                            children: [
                              ListView(
                                padding: EdgeInsets.zero,
                                children: [
                                  StreamBuilder<QuerySnapshot>(
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

                                      return Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: snapshot.data!.docs.map(
                                            (DocumentSnapshot document) {
                                              Map<String, dynamic> data =
                                                  document.data() as Map<String, dynamic>;

                                              return GestureDetector(
                                                onTap: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) => WorkoutView(
                                                        title: data['userAddedWorkoutTitle'],
                                                      ),
                                                    ),
                                                  );
                                                },
                                                child: savedWorkoutCards(
                                                  context: context,
                                                  title: data['userAddedWorkoutTitle'],
                                                  description: data['userAddedWorkoutDescription'],
                                                ),
                                              );
                                            },
                                          ).toList());
                                    },
                                  ),
                                ],
                              ),
                              SavedMealPlanView(),
                              Text('data'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}

savedWorkoutCards({context: BuildContext, title: String, description: String}) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Stack(
            children: [
              Image(
                fit: BoxFit.fill,
                image: AssetImage('assets/images/gymGirl.png'),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: CircleAvatar(
                    backgroundColor: Apptheme.mainCardColor,
                    child: Icon(LineIcons.heartAlt, color: Colors.red),
                  ),
                ),
              ),
            ],
          ),
          Container(
            decoration: BoxDecoration(
              color: Apptheme.mainCardColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            width: double.infinity,
            height: MediaQuery.of(context).size.height * .12,
            padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: CircleAvatar(
                    backgroundColor: Apptheme.mainButonColor,
                    child: Icon(Icons.play_arrow, color: Colors.white),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(description),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    ),
  );
}
