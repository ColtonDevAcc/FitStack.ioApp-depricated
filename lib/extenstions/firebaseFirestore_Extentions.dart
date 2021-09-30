import 'package:cloud_firestore/cloud_firestore.dart';

extension FirebaseFireStoreX on FirebaseFirestore {
  Future<DocumentSnapshot<Map<String, dynamic>>> userGroupRef(String userID) =>
      collection('UserInfo').doc(userID).get();

  Future<DocumentSnapshot<Map<String, dynamic>>> groupList(String groupID) =>
      collection('Groups').doc(groupID).get();
}
