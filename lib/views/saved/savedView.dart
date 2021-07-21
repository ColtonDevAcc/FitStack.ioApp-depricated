import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:workify/theme/theme.dart';

class SavedView extends StatefulWidget {
  const SavedView({Key? key}) : super(key: key);

  @override
  _SavedViewState createState() => _SavedViewState();
}

class _SavedViewState extends State<SavedView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    child: TabBarView(
                      children: [
                        savedWorkoutCards(context: context),
                        Text('data'),
                        Text('data'),
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

savedWorkouts() {
  return Column();
}

savedWorkoutCards({context: BuildContext}) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
    child: Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 10,
                  blurRadius: 5,
                  offset: Offset(0, 7), // changes position of shadow
                ),
              ],
            ),
            height: MediaQuery.of(context).size.height * .33,
            width: MediaQuery.of(context).size.width - 124,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Image(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/images/gymGirl.png'),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: MediaQuery.of(context).size.width - 124,
                    height: MediaQuery.of(context).size.height * .12,
                    color: Apptheme.mainCardColor,
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Fat Burn Max',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 2),
                        Text('It is a long established fact that a'),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
