import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class UserAvatar_Widget extends HookWidget {
  final List<String> userList;

  const UserAvatar_Widget(this.userList, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
      mainAxisAlignment: MainAxisAlignment.center,
      children: displayList
        ..add(CircleAvatar(
          child: Text('${displayList.length}+'),
        )),
    );
  }
}
