import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:workify/theme/theme.dart';

class RecoveryView extends StatelessWidget {
  const RecoveryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Align(
        alignment: Alignment(0.9999, 0.8),
        child: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Apptheme.secondaryAccent,
          child: Icon(LineIcons.plus),
        ),
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
                'Recovery',
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
                      text: 'Upper',
                    ),
                    // second tab [you can add an icon using the icon property]
                    Tab(
                      text: 'Lower',
                    ),
                    Tab(
                      text: 'Recommendation',
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
                      Column(
                        children: [
                          Text('data'),
                          ListTile(
                            visualDensity: VisualDensity(horizontal: -4, vertical: 0),
                            focusColor: Apptheme.mainCardColor,
                            tileColor: Apptheme.mainCardColor,
                            leading: Container(
                              color: Colors.black,
                              height: 50,
                              child: Image.asset(
                                'assets/images/BodyRecovery/qwewqe-1.png',
                                fit: BoxFit.fill,
                              ),
                            ),
                            title: Text(
                              'Lats',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                      Text('data'),
                      Text('data'),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
