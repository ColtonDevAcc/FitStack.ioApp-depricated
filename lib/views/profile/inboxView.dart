import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:workify/services/authServices.dart';
import 'package:workify/theme/theme.dart';

class InboxView extends StatelessWidget {
  const InboxView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Apptheme.mainBackgroundColor,
      appBar: AppBar(
        title: Text(
          'INBOX',
          style: TextStyle(color: Apptheme.mainButonColor),
        ),
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
        actions: [
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
            child: Icon(
              LineIcons.plus,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('UserInfo')
            .doc(AuthServices.userUID)
            .collection('Inbox')
            .doc('relationshipRequest')
            .collection('friendRequest')
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          return ListView(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
            shrinkWrap: true,
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data = document.data() as Map<String, dynamic>;

              return friendTab(name: '${data['userName']}', substring: 'Friend Request');
            }).toList(),
          );
        },
      ),
    );
  }
}

Padding friendTab({name: String, substring: String}) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
    child: Container(
      decoration: BoxDecoration(
        color: Apptheme.mainCardColor,
      ),
      child: ListTile(
        visualDensity: VisualDensity(horizontal: -4, vertical: -4),
        leading: Expanded(
          child: Icon(
            LineIcons.envelope,
            color: Apptheme.secondaryAccent,
          ),
        ),
        title: Text(
          name,
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        subtitle: Text(substring),
        trailing: Icon(LineIcons.arrowRight),
      ),
    ),
  );
}
