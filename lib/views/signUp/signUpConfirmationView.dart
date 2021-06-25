import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:workify/controllers/authServices.dart';
import 'package:workify/theme/theme.dart';
import 'package:workify/models/user.dart';
import 'package:workify/views/mainView.dart';

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
        onTap: () async {
          var user = new FirebaseUser(
            userName: this.widget.userName!,
            firstName: this.widget.firstName!,
            lastName: this.widget.lastName!,
            nationality: this.widget.nationality!,
            email: this.widget.email!,
            admin: this.widget.admin!,
            height: this.widget.height!,
            age: this.widget.age!,
            weight: this.widget.weight!,
            mainWorkoutGoal: this.widget.mainWorkoutGoal!,
            workoutFrequency: this.widget.workoutFrequency!,
            workoutExperiencelevel: this.widget.workoutExperiencelevel!,
            gender: 'Male',
          );
          await AuthServices(FirebaseAuth.instance).signUp(
            email: this.widget.email,
            password: this.widget.password,
          );
          await FirebaseFirestore.instance
              .collection('UserInfo')
              .doc(AuthServices.userUID)
              .set(user.toMap());
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => MainView()));
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
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 50, width: 1),
            ],
          ),
        ),
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
      body: Column(
        children: [
          userInfoDisplayText(
              displayTextTitle: 'Username',
              displayTextValue: this.widget.userName),
          userInfoDisplayText(
              displayTextTitle: 'First Name',
              displayTextValue: this.widget.firstName),
          userInfoDisplayText(
              displayTextTitle: 'Last Name',
              displayTextValue: this.widget.lastName),
          userInfoDisplayText(
              displayTextTitle: 'Age',
              displayTextValue: this.widget.age.toString()),
          userInfoDisplayText(
              displayTextTitle: 'Height',
              displayTextValue: this.widget.height.toString()),
          userInfoDisplayText(
              displayTextTitle: 'Weight',
              displayTextValue: this.widget.weight.toString()),
          userInfoDisplayText(
              displayTextTitle: 'Workout Experience Level',
              displayTextValue: this.widget.workoutExperiencelevel.toString()),
          userInfoDisplayText(
              displayTextTitle: 'Workout Frequency',
              displayTextValue: this.widget.workoutFrequency.toString()),
          userInfoDisplayText(
              displayTextTitle: 'Workout Goal',
              displayTextValue: this.widget.mainWorkoutGoal),
          userInfoDisplayText(
              displayTextTitle: 'Unique ID',
              displayTextValue:
                  this.widget.userID == null ? 'asf' : this.widget.userID),
        ],
      ),
    );
  }
}

Padding userInfoDisplayText(
    {displayTextTitle: String, displayTextValue: String}) {
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(),
        Text(
          displayTextTitle,
          style: TextStyle(color: Apptheme.mainTextColor),
        ),
        SizedBox(),
        Text(
          displayTextValue,
          style: TextStyle(color: Apptheme.mainTextColor),
        ),
        SizedBox(),
      ],
    ),
  );
}
