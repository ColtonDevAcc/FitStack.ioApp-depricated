import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:workify/theme/theme.dart';

class SingnUpConfirmationView extends StatefulWidget {
  final String? userID;
  final String? userName;
  final String? firstName;
  final String? lastName;
  final String? nationality;
  final String? email;
  final bool? admin;
  final double? height;
  final int? age;
  final double? weight;
  final String? mainWorkoutGoal;
  final int? workoutFrequency;
  final String? workoutExperiencelevel;
  final String? password;

  const SingnUpConfirmationView(
      {Key? key,
      this.userID,
      this.userName,
      this.firstName,
      this.lastName,
      this.nationality,
      this.email,
      this.admin,
      this.height,
      this.age,
      this.weight,
      this.mainWorkoutGoal,
      this.workoutFrequency,
      this.workoutExperiencelevel,
      this.password})
      : super(key: key);

  @override
  State<SingnUpConfirmationView> createState() =>
      _SingnUpConfirmationViewState();
}

class _SingnUpConfirmationViewState extends State<SingnUpConfirmationView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: GestureDetector(
        onTap: () {
          Navigator.push(
            (context),
            MaterialPageRoute(
              builder: (context) => SingnUpConfirmationView(),
            ),
          );
        },
        child: BottomAppBar(
            color: Apptheme.mainButonColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(width: 1),
                Text(
                  'Finish Sign Up',
                  textScaleFactor: 1.4,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 50, width: 1),
              ],
            )),
      ),
      backgroundColor: Apptheme.mainBackgroundColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Personal Information',
          style: TextStyle(
              color: Apptheme.mainTextColor, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Apptheme.mainCardColor,
      ),
    );
  }
}
