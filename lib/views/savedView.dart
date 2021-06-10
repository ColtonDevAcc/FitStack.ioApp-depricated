import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:workify/theme/theme.dart';

class SavedView extends StatelessWidget {
  const SavedView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          floating: false,
          pinned: false,
          expandedHeight: 200,
          title: Text('Saved Wokrouts'),
          flexibleSpace: FlexibleSpaceBar(background: Image.asset('assets/images/gymGirl.png', fit: BoxFit.cover)),
          backgroundColor: Apptheme.mainBackgroundColor,
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              savedWokrouts(),
              savedWokrouts(),
              savedWokrouts(),
              savedWokrouts(),
              savedWokrouts(),
              savedWokrouts(),
              savedWokrouts(),
              savedWokrouts(),
              savedWokrouts(),
              savedWokrouts(),
              savedWokrouts(),
              savedWokrouts(),
              savedWokrouts(),
              savedWokrouts(),
              savedWokrouts(),
            ],
          ),
        )
      ],
    );
  }
}

Padding savedWokrouts() {
  return Padding(
    padding: const EdgeInsets.fromLTRB(5, 10, 5, 0),
    child: Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Apptheme.mainCardColor),
      child: ListTile(
        title: Text('workout 1'),
        leading: ClipRRect(
          child: Image.asset('assets/images/gymGirl.png'),
          borderRadius: BorderRadius.circular(20),
        ),
        contentPadding: EdgeInsets.fromLTRB(3, 3, 10, 3),
      ),
    ),
  );
}
