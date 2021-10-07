import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:line_icons/line_icons.dart';
import 'package:workify/controllers/auth_controller.dart';
import 'package:workify/models/user/user_model.dart';
import 'package:workify/models/userGroup/userGroup_model.dart';
import 'package:workify/repositories/userGroup_Repository.dart';
import 'package:workify/theme/theme.dart';

import 'package:workify/views/relationShip_View/_views/userGroup_View/_Widgets/userAvatar_Widget.dart';

class UserGroup_View extends HookWidget {
  final UserGroup group;
  const UserGroup_View(this.group, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: UserGroupEndDrawer_View(),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
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
          group.name,
          style: TextStyle(color: Apptheme.mainButonColor),
        ),
      ),
      backgroundColor: Apptheme.mainBackgroundColor,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(padding: EdgeInsets.all(5)),
          Text(
            'Now Active',
            style: TextStyle(color: Colors.grey),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: UserAvatar_Widget(group.userIdList!),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 0, 0, 10),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Group Progress',
                textScaleFactor: 1.2,
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
            child: UserList_Widget(group.userIdList!),
          )
        ],
      ),
    );
  }
}

class UserList_Widget extends HookWidget {
  final List groupUserIdList;
  const UserList_Widget(this.groupUserIdList, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authStateController = context.read((authControllerProvider));

    final userListProvider = FutureProvider<List<User>>(
      (ref) async {
        final userList = await ref.watch(userGroupRepositoryProvider).retrieveUserList(
            authorizingUserID: authStateController!.uid, userIdLIst: groupUserIdList);
        return userList;
      },
    );
    return Consumer(
      builder: (context, watch, child) {
        return watch(userListProvider).when(
          data: (users) {
            if (users.isEmpty == true) {
              return Text('no users to display');
            } else {
              return ListView.builder(
                itemCount: users.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                    leading: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "${index + 1}st",
                          textScaleFactor: 1.5,
                          style: TextStyle(color: Apptheme.mainButonColor),
                        ),
                        SizedBox(width: 5),
                        CircleAvatar(
                          backgroundImage: NetworkImage(
                              'https://guycounseling.com/wp-content/uploads/2015/06/body-building-advanced-training-techniques-678x381.jpg'),
                        )
                      ],
                    ),
                    title: Text(
                      users[index].userName,
                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Column(
                      children: [
                        Container(
                          height: 15,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            child: LinearProgressIndicator(
                              value: index + 1 * .10 + .2,
                              backgroundColor: Colors.grey.withOpacity(.2),
                              color: Apptheme.mainButonColor,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            '${((index + 1 * .10 + .2) * 100).round()}%',
                            textScaleFactor: 1.4,
                            style: TextStyle(
                                color: Apptheme.mainButonColor, fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  );
                },
              );
            }
          },
          loading: () => CircularProgressIndicator(),
          error: (error, st) => Text(error.toString()),
        );
      },
    );
  }
}

class UserGroupEndDrawer_View extends HookWidget {
  const UserGroupEndDrawer_View({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Apptheme.mainBackgroundColor,
      child: ListView(
        children: [
          ListTile(
            leading: Icon(LineIcons.share),
            title: Text('Invite users'),
          ),
          ListTile(
            leading: Icon(LineIcons.userAlt),
            title: Text('Requested users'),
            trailing: Container(
              child: Text(
                '  3  ',
                style: TextStyle(color: Colors.white),
              ),
              decoration: BoxDecoration(
                color: Apptheme.mainButonColor,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          ListTile(
            leading: Icon(LineIcons.book),
            title: Text('Rules'),
          ),
          ListTile(
            leading: Icon(LineIcons.dumbbell),
            title: Text('Workouts'),
            trailing: Container(
              child: Text(
                '  1  ',
                style: TextStyle(color: Colors.white),
              ),
              decoration: BoxDecoration(
                color: Apptheme.mainButonColor,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          ListTile(
            leading: Icon(LineIcons.heartbeat),
            title: Text('Recovery'),
          ),
          ListTile(
            leading: Icon(LineIcons.barChart),
            title: Text('Progress'),
          ),
          ListTile(
            leading: Icon(LineIcons.userEdit),
            title: Text('User managment'),
          ),
          ListTile(
            leading: Icon(LineIcons.fileContract),
            title: Text('Activity'),
            trailing: Container(
              child: Text(
                '  1  ',
                style: TextStyle(color: Colors.white),
              ),
              decoration: BoxDecoration(
                color: Apptheme.mainButonColor,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
