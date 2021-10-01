import 'package:cloud_firestore/cloud_firestore.dart';

extension FirebaseFireStoreX on FirebaseFirestore {
  Future<DocumentSnapshot<Map<String, dynamic>>> userGroupRef(String userID) =>
      collection('UserInfo').doc(userID).get();

  Future<DocumentSnapshot<Map<String, dynamic>>> getGroupList(String groupID) =>
      collection('Groups').doc(groupID).get();

  CollectionReference<Map<String, dynamic>> groupListRef() => collection('Groups');
}
