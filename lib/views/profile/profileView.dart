import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:line_icons/line_icons.dart';
import 'package:workify/repositories/auth_repository.dart';
import 'package:workify/theme/theme.dart';
import 'package:workify/views/profile/inboxView.dart';

class ProfileView extends ConsumerWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    var currentUser = context.read(authRepositoryProvider).getCurrentUser();

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => InboxView(),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Icon(
                      LineIcons.envelope,
                      color: Colors.black,
                    ),
                  ),
                  Positioned(
                    right: 1,
                    top: 14,
                    child: Container(
                        padding: EdgeInsets.fromLTRB(2, 0, 2, 0),
                        decoration: BoxDecoration(
                          color: Apptheme.secondaryAccent,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: StreamBuilder(
                          stream: FirebaseFirestore.instance
                              .collection('UserInfo')
                              .doc(currentUser!.uid)
                              .collection('Inbox')
                              .doc('relationshipRequest')
                              .collection('friendRequest')
                              .snapshots(),
                          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                            return Text("${snapshot.data!.docs.length}");
                          },
                        )),
                  ),
                ],
              ),
            ),
          )
        ],
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            LineIcons.arrowLeft,
            color: Colors.black,
          ),
        ),
        backgroundColor: Apptheme.mainCardColor,
        title: Text(
          'PROFILE',
          style: TextStyle(
            color: Apptheme.mainButonColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      backgroundColor: Apptheme.mainBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(width: screenWidth),
                Container(
                  height: screenHeight * .1,
                  width: screenHeight * .1,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Apptheme.mainButonColor),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  padding: EdgeInsets.all(5),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://guycounseling.com/wp-content/uploads/2015/06/body-building-advanced-training-techniques-678x381.jpg'),
                  ),
                ),
                RichText(
                  textAlign: TextAlign.center,
                  maxLines: 3,
                  softWrap: true,
                  text: TextSpan(
                    text: ' ${currentUser.uid}\n',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    children: [
                      TextSpan(
                        text: ' Member since 2021\n',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      WidgetSpan(
                        child: Icon(
                          LineIcons.alternateMapMarker,
                          size: 20,
                        ),
                      ),
                      TextSpan(
                        text: '${currentUser.uid}',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    profileStatsHighlightCard(),
                    profileStatsHighlightCard(),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Expanded profileStatsHighlightCard() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Apptheme.mainCardColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                LineIcons.fire,
                color: Apptheme.mainButonColor,
              ),
              Expanded(
                child: RichText(
                  textAlign: TextAlign.left,
                  maxLines: 2,
                  softWrap: true,
                  text: TextSpan(
                    text: '40',
                    style: TextStyle(
                      color: Apptheme.mainButonColor,
                      fontWeight: FontWeight.bold,
                    ),
                    children: [
                      TextSpan(
                        text: ' Days\n',
                        style: TextStyle(
                          color: Apptheme.mainButonColor,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      TextSpan(
                        text: 'Workouts done in a row',
                        style: TextStyle(
                          color: Apptheme.mainButonColor,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
