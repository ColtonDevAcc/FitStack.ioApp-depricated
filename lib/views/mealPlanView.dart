import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:workify/theme/theme.dart';

class MealPlanView extends StatelessWidget {
  const MealPlanView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    double _screenHeight = MediaQuery.of(context).size.height.toDouble();
    // ignore: unused_local_variable
    double _screenWidth = MediaQuery.of(context).size.width.toDouble();
    TextEditingController _searchcontroller = TextEditingController();

    return SafeArea(
      child: Column(
        children: [
          TextFormField(
            controller: _searchcontroller,
            style: TextStyle(color: Colors.white),
            autofocus: false,
            autocorrect: true,
            decoration: InputDecoration(
              filled: true,
              labelText: 'Search meal plans, workout, abs etc...',
              labelStyle: TextStyle(color: Apptheme.mainTextColor),
              fillColor: Apptheme.mainCardColor,
              enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white.withOpacity(0)), borderRadius: BorderRadius.circular(15)),
            ),
          ),
        ],
      ),
    );
  }
}
