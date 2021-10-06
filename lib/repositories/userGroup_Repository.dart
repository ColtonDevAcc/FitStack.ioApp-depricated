import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:workify/extenstions/firebaseFirestore_Extentions.dart';
import 'package:workify/models/user/user_model.dart';
import 'package:workify/models/userGroup/userGroup_model.dart';
import 'package:workify/providers/generalProviders.dart';

abstract class UserGroupRepsitoryBaseClass {
  Future<List<UserGroup>> retrieveUserGroups({required String userID});
  Future<String> createUserGroup({
    required String userID,
    required String groupName,
    required List<String> moderaterList,
    required List<String> ownerList,
    required List<String> userIDList,
  });
  Future<void> updateUserGroup({required String userID, required UserGroup userGroup});
  Future<void> deleteUserGroup({required String userID, required String userGroupID});
  Future<void> kickUser({required String authorizingUserID, required String kickingUserID});
  Future<List<User>> retrieveUserList(
      {required String authorizingUserID, required List userIdLIst});
  Future<void> inviteUsers({required String authorizingUserID, required List userIdLIst});
}

final userGroupRepositoryProvider =
    Provider<UserGroupRepository>((ref) => UserGroupRepository(ref.read));

class UserGroupRepository implements UserGroupRepsitoryBaseClass {
  final Reader read;

  const UserGroupRepository(this.read);

  @override
  Future<String> createUserGroup({
    required String userID,
    required String groupName,
    required List<String>? moderaterList,
    required List<String>? ownerList,
    required List<String>? userIDList,
  }) async {
    final snap = await read(firebaseFirestoreProvider);
    final newGroupID = await snap
        .groupListRef()
        .add(UserGroup(
          name: groupName,
          moderaterList: moderaterList,
          ownerList: ownerList,
          userIdList: userIDList,
        ).toDocument())
        .then((value) {
      return value.id;
    });
    snap.userGroupRef(userID).update({
      'groups': FieldValue.arrayUnion([newGroupID])
    });
    return newGroupID;
  }

  @override
  Future<void> deleteUserGroup({required String userID, required String userGroupID}) {
    // TODO: implement deleteUserGroup
    throw UnimplementedError();
  }

  @override
  Future<List<UserGroup>> retrieveUserGroups({required String userID}) async {
    try {
      final snap = await read(firebaseFirestoreProvider).userGroupRef(userID).get();
      List<dynamic> groupNameList = await snap['groups'];
      List<UserGroup> userGroups = [];

      for (var group in groupNameList) {
        userGroups.add(
          UserGroup.fromDocument(
            await read(firebaseFirestoreProvider).getGroupList(group),
          ),
        );
        log('logged $group');
      }

      // groupNameList.forEach(
      //   (groupName) async {
      //     userGroups.add(
      //       UserGroup.fromDocument(
      //         await read(firebaseFirestoreProvider).getGroupList(groupName),
      //       ),
      //     );
      //   },
      // );

      return userGroups;
    } on FirebaseException catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> updateUserGroup({required String userID, required UserGroup userGroup}) {
    // TODO: implement updateUserGroup
    throw UnimplementedError();
  }

  @override
  Future<List<User>> retrieveUserList(
      {required String authorizingUserID, required List userIdLIst}) async {
    final List<User> userList = [];

    try {
      for (var user in userIdLIst) {
        userList.add(
          User.fromDocument(
            await read(firebaseFirestoreProvider).userRef(user).get(),
          ),
        );
        log('logged user ${userList.first.lastName}');
      }

      return userList;
    } on FirebaseException catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> inviteUsers({required String authorizingUserID, required List userIdLIst}) {
    // TODO: implement inviteUser
    throw UnimplementedError();
  }

  @override
  Future<void> kickUser({required String authorizingUserID, required String kickingUserID}) {
    // TODO: implement kickUser
    throw UnimplementedError();
  }
}
