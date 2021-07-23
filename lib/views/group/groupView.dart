import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:workify/controllers/authServices.dart';
import 'package:workify/controllers/currentUser.dart';
import 'package:workify/theme/theme.dart';

class GroupView extends StatelessWidget {
  const GroupView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showBottomSheet(
            context: context,
            builder: (context) {
              return Container(
                height: 100,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          LineIcons.arrowLeft,
                          size: 30,
                          color: Apptheme.mainButonColor,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
        backgroundColor: Apptheme.secondaryAccent,
        child: Icon(LineIcons.share),
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
                'Social',
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
                    Tab(text: 'Friends'),
                    // second tab [you can add an icon using the icon property]
                    Tab(text: 'Group'),
                    Tab(text: 'Trainers'),
                  ],
                ),
              ),
              SizedBox(height: 15),
              Expanded(
                child: TabBarView(
                  children: [
                    Column(
                      children: [
                        Flexible(
                          child: StreamBuilder<QuerySnapshot>(
                            stream: FirebaseFirestore.instance
                                .collection('UserInfo')
                                .where('email',
                                    isEqualTo: CurrentUser.friends?[0])
                                .snapshots(),
                            builder: (BuildContext context,
                                AsyncSnapshot<QuerySnapshot> snapshot) {
                              if (snapshot.hasError) {
                                return Text('Something went wrong');
                              }

                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return Text("Loading");
                              }

                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  new ListView(
                                    padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                    shrinkWrap: true,
                                    children: snapshot.data!.docs
                                        .map((DocumentSnapshot document) {
                                      Map<String, dynamic> data = document
                                          .data() as Map<String, dynamic>;

                                      return friendTab(name: data['email']);
                                    }).toList(),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    Text('data'),
                    Text('data')
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Padding friendTab({name: String}) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
      child: Container(
        decoration: BoxDecoration(
          color: Apptheme.mainCardColor,
          borderRadius: BorderRadius.circular(30),
        ),
        child: ListTile(
          visualDensity: VisualDensity(horizontal: 0, vertical: -4),
          leading: CircleAvatar(),
          title: Text(
            name,
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          subtitle: Text('Admin, Creator, Trainer'),
          trailing: Icon(LineIcons.arrowRight),
        ),
      ),
    );
  }
}
