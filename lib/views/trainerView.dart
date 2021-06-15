import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:workify/theme/theme.dart';

class TrainerView extends StatelessWidget {
  const TrainerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _screenHeight = MediaQuery.of(context).size.height.toDouble();
    double _screenWidth = MediaQuery.of(context).size.width.toDouble();
    TextEditingController _searchcontroller = TextEditingController();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(height: 10),
            Text('Trainers', textScaleFactor: 1.3, style: TextStyle(color: Apptheme.mainTextColor)),
            SizedBox(height: 10),
            TextFormField(
              controller: _searchcontroller,
              style: TextStyle(color: Colors.white),
              autofocus: false,
              autocorrect: true,
              decoration: InputDecoration(
                filled: true,
                labelText: 'Search trainers or trainer types',
                labelStyle: TextStyle(color: Apptheme.mainTextColor.withOpacity(.5)),
                fillColor: Apptheme.mainCardColor,
                enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white.withOpacity(0)), borderRadius: BorderRadius.circular(15)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
