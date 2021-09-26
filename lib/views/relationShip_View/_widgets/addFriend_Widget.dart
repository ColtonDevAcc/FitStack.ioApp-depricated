import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:workify/theme/theme.dart';
import 'package:workify/views/relationShip_View/_widgets/friendsTab_Widget.dart';

class AddFriend_Widget extends StatelessWidget {
  const AddFriend_Widget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    String searchValue = '';

    return StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        return Container(
          height: 400,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Container(
                  child: TextField(
                    onChanged: (value) {
                      setState(() {
                        searchValue = value;
                      });
                    },
                    style: TextStyle(color: Colors.black),
                    controller: searchController,
                    decoration: InputDecoration(
                      fillColor: Apptheme.mainCardColor,
                      hintText: 'Enter an email',
                      prefixIcon: Icon(
                        Icons.email,
                        color: Apptheme.mainButonColor,
                      ),
                      icon: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          LineIcons.arrowDown,
                          color: Apptheme.mainButonColor,
                        ),
                      ),
                      filled: true,
                      labelStyle: TextStyle(color: Colors.black),
                      focusColor: Apptheme.mainCardColor,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Apptheme.mainCardColor),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Apptheme.mainCardColor),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 150,
                  child: StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('UserInfo')
                        .where('email', isEqualTo: searchController.text)
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
                          new ListView(
                            padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                            shrinkWrap: true,
                            children: snapshot.data!.docs.map((DocumentSnapshot document) {
                              Map<String, dynamic> data = document.data() as Map<String, dynamic>;

                              return GestureDetector(
                                onTap: () async {
                                  var friendRequest = data['email'];
                                  await FirebaseFirestore.instance
                                      .collection('UserInfo')
                                      .where('email', isEqualTo: data['email'])
                                      .get()
                                      .then(
                                        (querySnapshot) => querySnapshot.docs[0].reference
                                            .collection('Inbox')
                                            .doc('relationshipRequest')
                                            .collection('friendRequest')
                                            .doc(friendRequest)
                                            .set(data),
                                      );

                                  print(friendRequest);
                                },
                                child: FriendsTab_Widget(name: data['email'], tags: data['tags']),
                              );
                            }).toList(),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
