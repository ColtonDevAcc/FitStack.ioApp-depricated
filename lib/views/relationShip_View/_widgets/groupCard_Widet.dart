import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:line_icons/line_icons.dart';
import '../../../models/userGroup/userGroup_model.dart';
import '../../../theme/theme.dart';

class GroupCardWidet extends HookWidget {
  final UserGroup group;

  const GroupCardWidet({
    Key? key,
    required this.group,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              children: [
                Image(
                  fit: BoxFit.fill,
                  image: AssetImage(group.bannerImageURL ?? 'assets/images/gymGirl.png'),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: CircleAvatar(
                      backgroundColor: Apptheme.mainCardColor,
                      child: Icon(LineIcons.heartAlt, color: Colors.red),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                color: Apptheme.mainCardColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              width: double.infinity,
              height: MediaQuery.of(context).size.height * .12,
              padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: CircleAvatar(
                      backgroundColor: Apptheme.mainButonColor,
                      child: Icon(Icons.play_arrow, color: Colors.white),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          group.name,
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 2),
                        Text(''),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
