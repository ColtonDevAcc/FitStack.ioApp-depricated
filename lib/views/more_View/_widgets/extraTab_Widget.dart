import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import '../../../theme/theme.dart';

class ExtraTab_Widget extends StatelessWidget {
  final String title;
  final IconData icon;
  const ExtraTab_Widget({Key? key, required this.title, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: ListTile(
        leading: Icon(this.icon),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        tileColor: Apptheme.mainCardColor,
        title: Text(
          this.title,
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w200),
        ),
        trailing: Icon(LineIcons.arrowRight),
      ),
    );
  }
}
