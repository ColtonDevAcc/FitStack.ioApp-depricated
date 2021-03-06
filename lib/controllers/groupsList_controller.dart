import 'dart:developer';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'auth_controller.dart';
import '../models/user/user_model.dart';
import '../repositories/userGroup_Repository.dart';
import '../models/userGroup/userGroup_model.dart';
import '../repositories/customExceptions.dart';

final GroupsListControllerProvider =
    StateNotifierProvider<GroupsListController, AsyncValue<List<UserGroup>>>((ref) {
  final user = ref.watch(authControllerProvider);
  return GroupsListController(ref.read, user!.uid);
});

final groupListExceptionProvider = StateProvider<CustomException?>((_) => null);

class GroupsListController extends StateNotifier<AsyncValue<List<UserGroup>>> {
  final Reader read;
  final String? userID;

  GroupsListController(this.read, this.userID) : super(AsyncValue.loading()) {
    if (userID != null) {
      retrieveGroups();
    } else {
      log('user id is null');
    }
  }

  Future<void> retrieveGroups({bool isRefreshing = false}) async {
    if (isRefreshing) state = AsyncValue.loading();
    try {
      List<UserGroup> group =
          await read(userGroupRepositoryProvider).retrieveUserGroups(userID: userID!);
      if (mounted) {
        state = AsyncValue.data(await group);
        log('groups is empty ${group.isEmpty}');
      }
    } on CustomException catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> addGroup({
    required String name,
    required userID,
    bool obtained = false,
    required List<String>? moderaterList,
    required List<String>? ownerList,
    required List<String>? userIDList,
  }) async {
    try {
      final group = UserGroup(
        id: userID,
        name: name,
        obtained: obtained,
        moderaterList: moderaterList,
        ownerList: ownerList,
        userIdList: userIDList,
      );
      final groupID = await read(userGroupRepositoryProvider).createUserGroup(
        userID: userID,
        groupName: name,
        moderaterList: moderaterList,
        ownerList: ownerList,
        userIDList: userIDList,
      );
      log('new group created ${groupID}');
      state.whenData((groups) => state = AsyncValue.data(groups..add(group.copyWith(id: groupID))));
    } on CustomException catch (e) {
      read(groupListExceptionProvider).state = e;
    }
  }

  Future<void> updateGroup({required UserGroup updatedGroup}) async {
    try {
      await read(userGroupRepositoryProvider)
          .updateUserGroup(userID: userID!, userGroup: updatedGroup);
      state.whenData((groups) {
        state = AsyncValue.data([
          for (final group in groups)
            if (group.id == updatedGroup.id) updatedGroup else group
        ]);
      });
    } on CustomException catch (e) {
      read(groupListExceptionProvider).state = e;
    }
  }

  Future<void> deleteGroup({required String groupID}) async {
    try {
      await read(userGroupRepositoryProvider)
          .deleteUserGroup(userID: userID!, userGroupID: groupID);
      state.whenData(
          (groups) => state = AsyncValue.data(groups..removeWhere((group) => group.id == groupID)));
    } on CustomException catch (e) {
      read(groupListExceptionProvider).state = e;
    }
  }

  Future<List<User>> retrieveUserList(
      {required String authorizingUserID, required List userIdLIst}) async {
    final userList = await read(userGroupRepositoryProvider)
        .retrieveUserList(authorizingUserID: authorizingUserID, userIdLIst: userIdLIst);

    return userList;
  }
}
