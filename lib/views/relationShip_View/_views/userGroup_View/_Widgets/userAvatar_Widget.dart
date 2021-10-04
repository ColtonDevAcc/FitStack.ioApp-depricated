import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:workify/controllers/auth_controller.dart';

class UserAvatar_Widget extends HookWidget {
  final List<String> userList;

  const UserAvatar_Widget(this.userList, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var currentUser = useProvider(authControllerProvider);

    final List<String> users = this.userList;
    List<Widget> displayList = [];
    users.take(3).forEach(
      (user) {
        displayList.add(
          Padding(
            padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
            child: CircleAvatar(child: Text(user.characters.first)),
          ),
        );
      },
    );

    return Row(
      children: displayList
        ..add(CircleAvatar(
          child: Text('${displayList.length}+'),
        )),
    );
  }
}
