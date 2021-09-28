import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:workify/controllers/groupsList_controller.dart';

class Groups_View extends HookWidget {
  const Groups_View({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final groupListState = useProvider(GroupsListControllerProvider);
    return groupListState
  }
}
