import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:workify/extenstions/firebaseFirestore_Extentions.dart';
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
}

final userGroupRepositoryProvider = Provider((ref) => UserGroupRepository(ref.read));

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
    final snap = await read(firebaseFirestoreProvider).groupListRef();
    final newGroupID = snap
        .add(UserGroup(
          name: groupName,
          moderaterList: moderaterList,
          ownerList: ownerList,
          userIdList: userIDList,
        ).toDocument())
        .then((value) => value.id);
    log(await newGroupID);
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
      final snap = await read(firebaseFirestoreProvider).userGroupRef(userID);
      log(snap['groups'].toString());
      List<dynamic> groupNameList = snap['groups'];

      List<UserGroup> userGroups = [];

      groupNameList.forEach(
        (groupName) async {
          userGroups.add(
            UserGroup.fromDocument(
              await read(firebaseFirestoreProvider).getGroupList(groupName.toString()),
            ),
          );
        },
      );

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
}
