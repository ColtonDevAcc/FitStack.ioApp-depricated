import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:workify/extenstions/firebaseFirestore_Extentions.dart';
import 'package:workify/models/userGroup/userGroup_model.dart';
import 'package:workify/providers/generalProviders.dart';

abstract class UserGroupRepsitoryBaseClass {
  Future<List<UserGroup>> retrieveUserGroups({required String userID});
  Future<String> createUserGroup({required String userID, required String groupName});
  Future<void> updateUserGroup({required String userID, required UserGroup userGroup});
  Future<void> deleteUserGroup({required String userID, required String userGroupID});
}

final userGroupRepositoryProvider = Provider((ref) => UserGroupRepository(ref.read));

class UserGroupRepository implements UserGroupRepsitoryBaseClass {
  final Reader read;

  const UserGroupRepository(this.read);

  @override
  Future<String> createUserGroup({required String userID, required String groupName}) {
    // TODO: implement deleteUserGroup
    throw UnimplementedError();
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
      log(snap['groups']);
      return snap['groups'];
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
