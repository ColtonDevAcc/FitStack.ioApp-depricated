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
    final authStateController = context.read((authControllerProvider));

    final userListProvider = FutureProvider.autoDispose<List<User>>(
      (ref) async {
        return await ref.watch(userGroupRepositoryProvider).retrieveUserList(
            authorizingUserID: authStateController!.uid, userIdLIst: group.userIdList!);
      },
    );

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
          Consumer(
            builder: (BuildContext context, watch, child) {
              return Column(
                children: [
                  watch(userListProvider).maybeWhen(
                    data: (u) => u.isEmpty ? Text('empty') : Text(u.first.lastName),
                    loading: () => CircularProgressIndicator(),
                    orElse: () => Text('or else'),
                  ),
                  child!
                ],
              );
            },
            child: Text('ff'),
          )
        ],
      ),
    );
  }
}
