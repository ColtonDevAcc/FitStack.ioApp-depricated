import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:workify/models/userGroup/userGroup_model.dart';

class Groups_View extends HookWidget {
  const Groups_View({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firebaseIdeaProvider = StreamProvider.autoDispose<List<UserGroup>>((ref) {
      final stream = FirebaseFirestore.instance.collection('Groups').snapshots();
      return stream
          .map((snapshot) => snapshot.docs.map((doc) => UserGroup.fromJson(doc.data())).toList());
    });

    return Column(
      children: [
        useProvider(firebaseIdeaProvider).when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (err, stack) => Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(err.toString()),
            ),
          ),
          data: (userGroup) {
            return ListView.builder(
              itemCount: userGroup.length,
              itemBuilder: (_, index) {
                return ListTile(
                  title: Text(userGroup[index].toString()),
                );
              },
            );
          },
        ),
      ],
    );
  }
}
