import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:line_icons/line_icons.dart';
import 'package:workify/controllers/groupsList_controller.dart';
import 'package:workify/repositories/customExceptions.dart';
import 'package:workify/theme/theme.dart';
import 'package:workify/views/relationship_View/_widgets/addGroup_Widget.dart';

final fabProvider = Provider<dynamic>((ref) {
  return [LineIcons.plus, AddGroup_Widget()];
});

class Groups_View extends HookWidget {
  const Groups_View({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Apptheme.mainBackgroundColor,
      floatingActionButton: Align(
        alignment: Alignment(1.04, 0.76),
        child: FloatingActionButton(
          onPressed: () {
            showBottomSheet(
              backgroundColor: Apptheme.mainBackgroundColor,
              context: context,
              builder: (context) {
                return AddGroup_Widget();
              },
            );
          },
          backgroundColor: Apptheme.secondaryAccent,
          child: Icon(LineIcons.share),
        ),
      ),
      body: ProviderListener(
        onChange: (BuildContext context, StateController<CustomException?> customException) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.red,
              content: Text(customException.state!.message!),
            ),
          );
        },
        provider: groupListExceptionProvider,
        child: const UserGroupList(),
      ),
    );
  }
}

class UserGroupList extends HookWidget {
  const UserGroupList({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    //!this does not work at all and i have no idea why. I just cant access .when
    final userGroupList = useProvider(GroupsListControllerProvider);
    return userGroupList.when(
      data: (groups) => groups.isEmpty
          ? const Center(child: Text('add a group'))
          : ListView.builder(
              itemCount: groups.length,
              itemBuilder: (BuildContext context, int index) {
                final group = groups[index];
                return Container(
                  child: Text(group.name),
                );
              },
            ),
      loading: () => Column(
        children: [
          Container(
            width: 50,
            height: 50,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircularProgressIndicator(),
            ),
          ),
        ],
      ),
      error: (e, _) => Text('error ${e}'),
    );
  }
}
