import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:workify/controllers/auth_controller.dart';
import 'package:workify/repositories/userGroupRepository.dart';
import 'package:workify/models/userGroup/userGroup_model.dart';
import 'package:workify/repositories/customExceptions.dart';

final GroupsListControllerProvider = StateNotifierProvider<GroupsListController, dynamic>((ref) {
  final user = ref.watch(authControllerProvider);
  return GroupsListController(ref.read, user!.uid);
});

final groupListExceptionProvider = StateProvider<CustomException?>((_) => null);

class GroupsListController extends StateNotifier<AsyncValue<List<UserGroup>>> {
  final Reader read;
  final String userID;

  GroupsListController(this.read, this.userID) : super(AsyncValue.loading()) {
    if (userID != null) {
      retrieveGroups();
    }
  }

  Future<void> retrieveGroups({bool isRefreshing = false}) async {
    if (isRefreshing) state = AsyncValue.loading();
    try {
      final group = await read(userGroupRepositoryProvider).retrieveUserGroups(userID: userID);
      if (mounted) {
        state = AsyncValue.data(group);
      }
    } on CustomException catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> addGroup({required String name, bool obtained = false}) async {
    try {
      final group = UserGroup(name: name, obtained: obtained);
      final groupID = await read(userGroupRepositoryProvider).createUserGroup(
        userID: userID,
        groupName: name,
      );
      state.whenData((groups) => state = AsyncValue.data(groups..add(group.copyWith(id: groupID))));
    } on CustomException catch (e) {
      read(groupListExceptionProvider).state = e;
    }
  }

  Future<void> updateGroup({required UserGroup updatedGroup}) async {
    try {
      await read(userGroupRepositoryProvider)
          .updateUserGroup(userID: userID, userGroup: updatedGroup);
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
      await read(userGroupRepositoryProvider).deleteUserGroup(
        userID: userID,
        userGroupID: groupID,
      );
      state.whenData(
          (groups) => state = AsyncValue.data(groups..removeWhere((group) => group.id == groupID)));
    } on CustomException catch (e) {
      read(groupListExceptionProvider).state = e;
    }
  }
}
