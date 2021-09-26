import 'package:cloud_firestore/cloud_firestore.dart';

extension FirebaseFireStoreX on FirebaseFirestore {
  CollectionReference userGroupRef(String userID) => collection(userID);
}
