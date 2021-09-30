import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:line_icons/line_icons.dart';
import 'package:workify/repositories/auth_repository.dart';
import 'package:workify/theme/theme.dart';

import 'addProduct_Widget.dart';

class NutritionAddedProducts_Widget extends ConsumerWidget {
  const NutritionAddedProducts_Widget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    var currentUser = context.read(authRepositoryProvider).getCurrentUser();

    return Expanded(
      child: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('UserInfo')
            .doc(currentUser!.uid)
            .collection('UserEvents')
            .doc('AddMealEvent')
            .collection('Y${DateTime.now().year}-M${DateTime.now().month}-D${DateTime.now().day}')
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {}
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("Loading");
          }

          return new GridView.count(
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            padding: EdgeInsets.fromLTRB(0, 10, 0, 20),
            childAspectRatio: .8,
            crossAxisCount: 2,
            shrinkWrap: true,
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data = document.data() as Map<String, dynamic>;
              //set calories here for each meal

              return Container(
                decoration: BoxDecoration(
                  color: Apptheme.mainCardColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        data['product_name'] != null ? '${data['product_name']}' : '?',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                      child: Text.rich(
                        TextSpan(
                          text: data['proteins_serving'] != null
                              ? '${data['proteins_serving']}g\n'
                              : '0\n',
                          style: TextStyle(fontWeight: FontWeight.bold),
                          children: [
                            TextSpan(
                              text: 'Protein',
                              style: TextStyle(fontWeight: FontWeight.normal),
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text.rich(
                        TextSpan(
                          text: data['energy_serving'] != null
                              ? '${data['energy_serving']}\n'
                              : '0\n',
                          style: TextStyle(fontWeight: FontWeight.bold),
                          children: [
                            TextSpan(
                              text: 'Calories',
                              style: TextStyle(fontWeight: FontWeight.normal),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Apptheme.mainButonColor,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(15),
                            bottomRight: Radius.circular(15),
                          )),
                      width: double.infinity,
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'Edit',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    )
                  ],
                ),
              );
            }).toList()
              ..add(
                Container(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddProductView(),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Apptheme.mainCardColor,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                        child: Icon(
                          LineIcons.plus,
                          size: 50,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
          );
        },
      ),
    );
  }
}
