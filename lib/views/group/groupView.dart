import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:workify/controllers/currentUser.dart';
import 'package:workify/theme/theme.dart';

class GroupView extends StatefulWidget {
  const GroupView({Key? key}) : super(key: key);

  @override
  _GroupViewState createState() => _GroupViewState();
}

class _GroupViewState extends State<GroupView> {
  TextEditingController searchController = TextEditingController();
  String searchValue = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showBottomSheet(
            backgroundColor: Apptheme.mainBackgroundColor,
            context: context,
            builder: (context) {
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
                              builder:
                                  (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
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
                                      children:
                                          snapshot.data!.docs.map((DocumentSnapshot document) {
                                        Map<String, dynamic> data =
                                            document.data() as Map<String, dynamic>;

                                        return GestureDetector(
                                            onTap: () async {
                                              var friendRequest = data['email'];
                                              await FirebaseFirestore.instance
                                                  .collection('UserInfo')
                                                  .where('email', isEqualTo: data['email'])
                                                  .get()
                                                  .then(
                                                    (querySnapshot) => querySnapshot
                                                        .docs[0].reference
                                                        .collection('Inbox')
                                                        .doc('relationshipRequest')
                                                        .collection('friendRequest')
                                                        .doc(friendRequest)
                                                        .set(data),
                                                  );

                                              print(friendRequest);
                                            },
                                            child:
                                                friendTab(name: data['email'], tags: data['tags']));
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
                    Tab(text: 'Groups'),
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
                                .where('friends', arrayContains: CurrentUser.email)
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
                                      Map<String, dynamic> data =
                                          document.data() as Map<String, dynamic>;

                                      return friendTab(name: data['email'], tags: data['tags']);
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

  Padding friendTab({name: String, tags: List}) {
    List newTag = tags;

    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
      child: Container(
        decoration: BoxDecoration(
          color: Apptheme.mainCardColor,
          borderRadius: BorderRadius.circular(30),
        ),
        child: ListTile(
          visualDensity: VisualDensity(horizontal: -4, vertical: -4),
          leading: CircleAvatar(),
          title: Text(
            name,
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
            child: Transform(
              transform: Matrix4.identity()..scale(0.8),
              child: Wrap(
                spacing: 2,
                direction: Axis.horizontal,
                children: newTag.map((e) {
                  return Chip(
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    elevation: 3,
                    avatar: CircleAvatar(
                      backgroundColor: Colors.red,
                      child: Icon(
                        LineIcons.user,
                        size: 18,
                        color: Colors.white,
                      ),
                    ),
                    backgroundColor: Apptheme.mainCardColor,
                    label: Text(
                      e,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    shape: StadiumBorder(
                      side: BorderSide(
                        color: Colors.red,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
          trailing: Icon(LineIcons.arrowRight),
        ),
      ),
    );
  }
}
