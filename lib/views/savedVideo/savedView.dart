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
          pinned: true,
          expandedHeight: 200,
          title: Text('Saved Wokrouts',
              style: TextStyle(color: Apptheme.mainTextColor)),
          flexibleSpace: FlexibleSpaceBar(
              background:
                  Image.asset('assets/images/gymGirl.png', fit: BoxFit.cover)),
          backgroundColor: Apptheme.mainBackgroundColor,
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              savedWokrouts(
                  planTitle: 'BroSplit',
                  planSubtitle: '7 workouts lasting 2 hours a piece',
                  current: false),
              savedWokrouts(
                  planTitle: 'BroSplit',
                  planSubtitle: '7 workouts lasting 2 hours a piece',
                  current: false),
              savedWokrouts(
                  planTitle: 'BroSplit',
                  planSubtitle: '7 workouts lasting 2 hours a piece',
                  current: true),
              savedWokrouts(
                  planTitle: 'BroSplit',
                  planSubtitle: '7 workouts lasting 2 hours a piece',
                  current: false),
              savedWokrouts(
                  planTitle: 'BroSplit',
                  planSubtitle: '7 workouts lasting 2 hours a piece',
                  current: false),
            ],
          ),
        )
      ],
    );
  }
}

Padding savedWokrouts(
    {planTitle: String, planSubtitle: String, current: bool}) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(5, 10, 5, 0),
    child: Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Apptheme.mainCardColor),
      child: ListTile(
        subtitle: Text(planSubtitle,
            textScaleFactor: .8,
            style: TextStyle(color: Apptheme.mainTextColor)),
        title: Row(
          children: [
            Text(planTitle),
          ],
        ),
        trailing: current == true
            ? Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Apptheme.mainButonColor.withOpacity(.2)),
                  child: Padding(
                    padding: EdgeInsets.all(6),
                    child: Text(
                      'Current',
                      style: TextStyle(color: Apptheme.mainButonColor),
                    ),
                  ),
                ),
              )
            : Icon(Icons.arrow_forward_ios, color: Apptheme.mainTextColor),
        leading: ClipRRect(
          child: Image.asset('assets/images/gymGirl.png'),
          borderRadius: BorderRadius.circular(10),
        ),
        contentPadding: EdgeInsets.fromLTRB(10, 0, 1, 0),
      ),
    ),
  );
}
