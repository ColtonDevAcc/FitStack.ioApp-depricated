import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:workify/theme/theme.dart';

class TrainerView extends StatelessWidget {
  const TrainerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _screenHeight = MediaQuery.of(context).size.height.toDouble();
    TextEditingController _searchcontroller = TextEditingController();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(height: 10),
            Text('Trainers',
                textScaleFactor: 1.3,
                style: TextStyle(color: Apptheme.mainTextColor)),
            SizedBox(height: 10),
            TextFormField(
              controller: _searchcontroller,
              style: TextStyle(color: Colors.white),
              autofocus: false,
              autocorrect: true,
              decoration: InputDecoration(
                filled: true,
                labelText: 'Search trainers or trainer types',
                labelStyle:
                    TextStyle(color: Apptheme.mainTextColor.withOpacity(.5)),
                fillColor: Apptheme.mainCardColor,
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white.withOpacity(0)),
                    borderRadius: BorderRadius.circular(15)),
              ),
            ),
            SizedBox(height: 10),
            Container(
              height: _screenHeight / 16,
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  recommendationTab(text: "Featured", icon: LineIcons.star),
                  recommendationTab(
                      text: "In your area", icon: LineIcons.locationArrow),
                  recommendationTab(text: "Global", icon: LineIcons.globe),
                  recommendationTab(
                      text: "Recommended", icon: LineIcons.thumbsUp),
                ],
              ),
            ),
            SizedBox(height: 10),
            Text('Featured',
                textScaleFactor: 1.3,
                style: TextStyle(color: Apptheme.mainTextColor)),
            SizedBox(height: 10),
            SizedBox(height: 10),
            Text('In your area',
                textScaleFactor: 1.3,
                style: TextStyle(color: Apptheme.mainTextColor)),
            SizedBox(height: 10),
            SizedBox(height: 10),
            Text('Global',
                textScaleFactor: 1.3,
                style: TextStyle(color: Apptheme.mainTextColor)),
            SizedBox(height: 10),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}

Padding recommendationTab({text: String, icon: Icons}) {
  return Padding(
    padding: const EdgeInsets.all(6.0),
    child: Container(
      decoration: BoxDecoration(
        color: Apptheme.mainCardColor,
        borderRadius: BorderRadius.circular(11),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Icon(icon, color: Apptheme.mainTextColor),
            SizedBox(width: 10),
            Text(text, style: TextStyle(color: Apptheme.mainTextColor)),
          ],
        ),
      ),
    ),
  );
}
