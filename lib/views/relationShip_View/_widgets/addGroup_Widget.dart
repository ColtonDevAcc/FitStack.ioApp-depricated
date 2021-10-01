import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:line_icons/line_icons.dart';
import 'package:workify/controllers/groupsList_controller.dart';
import 'package:workify/repositories/auth_controller.dart';
import 'package:workify/theme/theme.dart';

class AddGroup_Widget extends HookWidget {
  const AddGroup_Widget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    // ignore: unused_local_variable
    String searchValue = '';
    var userInfo = useProvider(authRepositoryProvider);

    var groupProvider = useProvider(GroupsListControllerProvider.notifier);

    return StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        return Container(
          color: Apptheme.mainCardColor,
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
                      hintText: 'Enter a name for this group',
                      prefixIcon: Icon(
                        searchValue != '' ? LineIcons.check : LineIcons.pushed,
                        color: Apptheme.mainButonColor,
                      ),
                      icon: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          LineIcons.times,
                          color: Apptheme.mainButonColor,
                        ),
                      ),
                      filled: true,
                      labelStyle: TextStyle(color: Colors.black),
                      focusColor: Apptheme.mainCardColor,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Apptheme.mainButonColor),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Apptheme.mainButonColor),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text('Group Name: '),
                            Text(searchValue),
                          ],
                        ),
                        Row(
                          children: [Text('Owner: ${userInfo.getCurrentUser()?.email}')],
                        ),
                        TextButton(
                          onPressed: () async {
                            var uid = userInfo.getCurrentUser()?.uid;
                            await groupProvider.addGroup(
                              name: searchValue,
                              userID: uid,
                              moderaterList: [uid!],
                              ownerList: [uid],
                              userIDList: [uid],
                            );
                          },
                          child: Text('Publish Group'),
                        )
                      ],
                    ),
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
