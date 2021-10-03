import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:line_icons/line_icons.dart';
import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:workify/models/userGroup/userGroup_model.dart';
import 'package:workify/theme/theme.dart';
import 'dart:math';

class UserGroup_View extends HookWidget {
  final UserGroup group;
  const UserGroup_View(this.group, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              LineIcons.gripLines,
              color: Colors.black,
            ),
          ),
        ],
      ),
      backgroundColor: Apptheme.mainBackgroundColor,
      body: Center(
        child: Column(
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: userAvatar(userList: group.userIdList),
              ),
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
            )
          ],
        ),
      ),
    );
  }

  List<Widget> userAvatar({userList: List}) {
    final List<String> users = userList;
    List<Widget> displayList = [];
    users.take(4).forEach((user) {
      displayList.add(
        Padding(
          padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
          child: CircleAvatar(child: Text(user.characters.first)),
        ),
      );
    });

    return displayList
      ..add(CircleAvatar(
        child: Text('${displayList.length}+'),
      ));
  }
}

const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
Random _rnd = Random();

String getRandomString(int length) => String.fromCharCodes(
    Iterable.generate(length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
