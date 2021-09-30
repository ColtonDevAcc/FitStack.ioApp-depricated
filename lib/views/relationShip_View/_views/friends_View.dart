import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:line_icons/line_icons.dart';
import 'package:workify/repositories/auth_repository.dart';
import 'package:workify/theme/theme.dart';
import 'package:workify/views/relationShip_View/_widgets/friendsTab_Widget.dart';
import 'package:workify/views/relationship_View/_widgets/addFriend_Widget.dart';

class FriendsView extends ConsumerWidget {
  const FriendsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    var currentUser = context.read(authRepositoryProvider).getCurrentUser();

    return Scaffold(
      floatingActionButton: Align(
        alignment: Alignment(1.04, 0.76),
        child: FloatingActionButton(
          onPressed: () {
            showBottomSheet(
              backgroundColor: Apptheme.mainBackgroundColor,
              context: context,
              builder: (context) {
                return AddFriend_Widget();
              },
            );
            AddFriend_Widget;
          },
          backgroundColor: Apptheme.secondaryAccent,
          child: Icon(LineIcons.share),
        ),
      ),
      body: Column(
        children: [
          Flexible(
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('UserInfo')
                  .where('friends', arrayContains: currentUser!.email)
                  .snapshots(),
              builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Text('Something went wrong');
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Text("Loading");
                }

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Scrollbar(
                      child: new ListView(
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                        shrinkWrap: true,
                        children: snapshot.data!.docs.map((DocumentSnapshot document) {
                          Map<String, dynamic> data = document.data() as Map<String, dynamic>;

                          return FriendsTab_Widget(name: data['email'], tags: data['tags']);
                        }).toList(),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
