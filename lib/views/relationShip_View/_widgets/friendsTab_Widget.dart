import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import '../../../theme/theme.dart';

class FriendsTab_Widget extends StatelessWidget {
  final String name;
  final List tags;
  const FriendsTab_Widget({Key? key, required this.name, required this.tags}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List newTag = tags;

    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
      child: Container(
        decoration: BoxDecoration(
          color: Apptheme.mainCardColor,
          borderRadius: BorderRadius.circular(30),
        ),
        child: ListTile(
          visualDensity: VisualDensity(horizontal: -4, vertical: -4),
          leading: CircleAvatar(),
          title: Text(
            name,
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
            child: Transform(
              transform: Matrix4.identity()..scale(0.8),
              child: Wrap(
                spacing: 2,
                direction: Axis.horizontal,
                children: newTag.map((e) {
                  return Chip(
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    elevation: 3,
                    avatar: CircleAvatar(
                      backgroundColor: Colors.red,
                      child: Icon(
                        LineIcons.user,
                        size: 18,
                        color: Colors.white,
                      ),
                    ),
                    backgroundColor: Apptheme.mainCardColor,
                    label: Text(
                      e,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    shape: StadiumBorder(
                      side: BorderSide(
                        color: Colors.red,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
          trailing: Icon(LineIcons.arrowRight),
        ),
      ),
    );
  }
}
