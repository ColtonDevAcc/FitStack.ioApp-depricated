import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:workify/theme/theme.dart';
import 'package:workify/views/relationShip_View/_widgets/addFriend_Widget.dart';
import 'package:workify/views/relationShip_View/friends_View.dart';

class GroupView extends StatefulWidget {
  const GroupView({Key? key}) : super(key: key);

  @override
  _GroupViewState createState() => _GroupViewState();
}

class _GroupViewState extends State<GroupView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Align(
        alignment: Alignment(0.9999, 0.8),
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
                  children: [FriendsView(), Text('data'), Text('data')],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
