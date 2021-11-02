import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:line_icons/line_icons.dart';
import 'package:workify/models/user/user_model.dart';

import 'package:workify/repositories/auth_repository.dart';
import 'package:workify/theme/theme.dart';
import 'package:workify/views/login_view/loginView.dart';

class SignUpWandNDetails extends ConsumerWidget {
  final String firstName;
  final String lastName;
  final String email;
  final String password;

  int taskIndex = 0;
  int workoutFrequencySelectedButton = 0;
  int workoutGoalSelectedButton = 0;
  int workoutExperiencelevelSelectedButton = 0;

  //text controllers start
  TextEditingController calorieConsumptionTextController = TextEditingController();
  TextEditingController heightTextController = TextEditingController();
  TextEditingController weightTextController = TextEditingController();
  TextEditingController nationalityTextController = TextEditingController();
  TextEditingController ageTextController = TextEditingController();
  //text controllers end

  //input buttons start
  List<String> workoutFrequencyOutput = [];
  List<String> workoutGoalOutput = [];
  SignUpWandNDetails({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.taskIndex,
    required this.workoutFrequencySelectedButton,
    required this.workoutGoalSelectedButton,
    required this.workoutExperiencelevelSelectedButton,
    required this.workoutFrequencyOutput,
    required this.workoutGoalOutput,
  });

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    var currentUser = context.read(authRepositoryProvider).getCurrentUser();

    List<Widget> onBoardingTask = [
      calorieIntake(),
      workoutFrequency(),
      mainWorkoutGoal(),
      workoutExperiencelevel(),
      userPhysicalDetails(),
    ];

    double _screenWidth = MediaQuery.of(context).size.width;
    double _screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Apptheme.mainBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 20, 10, 0),
            child: Text(
              '${taskIndex + 1} / ${onBoardingTask.length}',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
        leading: GestureDetector(
          onTap: () {},
          child: Icon(
            LineIcons.arrowLeft,
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(13, 0, 10, 0),
              child: onBoardingTask[taskIndex],
            ),
          ),
          Container(
            height: 80,
            width: double.infinity,
            decoration: BoxDecoration(color: Apptheme.mainButonColor),
            child: Center(
              child: TextButton(
                onPressed: () async {
                  //! Sign the user up with the current info and push the extra info into firestore
                  if (taskIndex + 1 != onBoardingTask.length) {
                  } else {
                    List<String> mainWorkoutGoalList = [
                      'I want to get stronger',
                      'I want to lose weight',
                      'I want to gain weight',
                      'Just to improve my health'
                    ];
                    List<String> workoutFrequencyList = [
                      'Daily',
                      '1 - 2 days a week',
                      '3 - 4 days a week',
                      '5 - 6 days a week'
                    ];
                    List<String> liftingExperienceList = [
                      'Beginner',
                      'Moderate',
                      'Experienced',
                      'Professinal'
                    ];

                    //! NEED TO IMPLEMENT TO AUTH USER
                    User user = new User(
                      userName: 'this.widget.userName!',
                      firstName: this.firstName,
                      lastName: this.lastName,
                      nationality: nationalityTextController.text,
                      email: this.email,
                      admin: false,
                      height: double.tryParse(heightTextController.text)!,
                      age: int.tryParse(ageTextController.text)!,
                      weight: double.tryParse(weightTextController.text)!,
                      mainWorkoutGoal: mainWorkoutGoalList[workoutGoalSelectedButton],
                      workoutFrequency: workoutFrequencyList[workoutFrequencySelectedButton],
                      workoutExperiencelevel:
                          liftingExperienceList[workoutExperiencelevelSelectedButton],
                      gender: 'Male',
                    );
                    await FirebaseFirestore.instance
                        .collection('UserInfo')
                        .doc(currentUser!.uid)
                        .set(user.toDocument());

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginView(),
                      ),
                    );
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Apptheme.mainButonColor,
                  ),
                  width: _screenWidth,
                  height: _screenHeight * .07,
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          taskIndex + 1 != onBoardingTask.length
                              ? 'Continue'
                              : 'Create your account',
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(width: 5),
                        Icon(
                          taskIndex + 1 != onBoardingTask.length
                              ? LineIcons.arrowRight
                              : LineIcons.check,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Column calorieIntake() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              Icons.local_fire_department,
              color: Apptheme.mainButonColor,
            ),
            Text(
              'CALORIE CONSUMPTION',
              textScaleFactor: 1.5,
              style: TextStyle(
                color: Apptheme.mainButonColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Enter your daily calorie intake',
            textScaleFactor: 1.3,
            style: TextStyle(
              color: Colors.black.withOpacity(.7),
            ),
          ),
        ),
        Spacer(flex: 1),
        Expanded(
          child: TextField(
            style: TextStyle(color: Colors.black),
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              hintText: 'Enter here',
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white.withOpacity(0),
                ),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white.withOpacity(0),
                ),
              ),
            ),
          ),
        ),
        Spacer(flex: 2),
      ],
    );
  }

  Column workoutFrequency() {
    return Column(
      children: [
        Row(
          children: [
            Icon(
              Icons.local_fire_department,
              color: Apptheme.mainButonColor,
            ),
            Text(
              'WORKOUT FREQUENCY',
              textScaleFactor: 1.5,
              style: TextStyle(
                color: Apptheme.mainButonColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Enter how often you workout',
                textScaleFactor: 1.3,
                style: TextStyle(
                  color: Colors.black.withOpacity(.7),
                ),
              ),
            ),
          ],
        ),
        Spacer(flex: 1),
        TextButton(
          onPressed: () {},
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Apptheme.mainButonColor),
              color: workoutFrequencySelectedButton == 1
                  ? Apptheme.mainButonColor
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(20),
            ),
            width: 300,
            height: 50,
            child: Center(
              child: Text(
                'Daily',
                style: TextStyle(
                  color:
                      workoutFrequencySelectedButton == 1 ? Colors.white : Apptheme.mainButonColor,
                ),
              ),
            ),
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Apptheme.mainButonColor),
              color: workoutFrequencySelectedButton == 2
                  ? Apptheme.mainButonColor
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(20),
            ),
            width: 300,
            height: 50,
            child: Center(
              child: Text(
                '1 - 2 days a week',
                style: TextStyle(
                  color:
                      workoutFrequencySelectedButton == 2 ? Colors.white : Apptheme.mainButonColor,
                ),
              ),
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            ;
          },
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Apptheme.mainButonColor),
              color: workoutFrequencySelectedButton == 3
                  ? Apptheme.mainButonColor
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(20),
            ),
            width: 300,
            height: 50,
            child: Center(
              child: Text(
                '3 - 4 days a week',
                style: TextStyle(
                  color:
                      workoutFrequencySelectedButton == 3 ? Colors.white : Apptheme.mainButonColor,
                ),
              ),
            ),
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Apptheme.mainButonColor),
              color: workoutFrequencySelectedButton == 4
                  ? Apptheme.mainButonColor
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(20),
            ),
            width: 300,
            height: 50,
            child: Center(
              child: Text(
                '5 - 6 days a week',
                style: TextStyle(
                  color:
                      workoutFrequencySelectedButton == 4 ? Colors.white : Apptheme.mainButonColor,
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 10),
        Spacer(flex: 2)
      ],
    );
  }

  Column mainWorkoutGoal() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              Icons.local_fire_department,
              color: Apptheme.mainButonColor,
            ),
            Text(
              'WORKOUT GOAL',
              textScaleFactor: 1.5,
              style: TextStyle(
                color: Apptheme.mainButonColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Whats your workout goal',
            textScaleFactor: 1.3,
            style: TextStyle(
              color: Colors.black.withOpacity(.7),
            ),
          ),
        ),
        Spacer(flex: 1),
        Align(
          alignment: Alignment.center,
          child: TextButton(
            onPressed: () {},
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Apptheme.mainButonColor),
                color:
                    workoutGoalSelectedButton == 1 ? Apptheme.mainButonColor : Colors.transparent,
                borderRadius: BorderRadius.circular(20),
              ),
              width: 300,
              height: 50,
              child: Center(
                child: Text(
                  'I want to get stronger',
                  style: TextStyle(
                    color: workoutGoalSelectedButton == 1 ? Colors.white : Apptheme.mainButonColor,
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 10),
        Align(
          alignment: Alignment.center,
          child: TextButton(
            onPressed: () {},
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Apptheme.mainButonColor),
                color:
                    workoutGoalSelectedButton == 2 ? Apptheme.mainButonColor : Colors.transparent,
                borderRadius: BorderRadius.circular(20),
              ),
              width: 300,
              height: 50,
              child: Center(
                child: Text(
                  'I want to lose weight',
                  style: TextStyle(
                    color: workoutGoalSelectedButton == 2 ? Colors.white : Apptheme.mainButonColor,
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 10),
        Align(
          alignment: Alignment.center,
          child: TextButton(
            onPressed: () {},
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Apptheme.mainButonColor),
                color:
                    workoutGoalSelectedButton == 3 ? Apptheme.mainButonColor : Colors.transparent,
                borderRadius: BorderRadius.circular(20),
              ),
              width: 300,
              height: 50,
              child: Center(
                child: Text(
                  'I want to gain more muscle',
                  style: TextStyle(
                    color: workoutGoalSelectedButton == 3 ? Colors.white : Apptheme.mainButonColor,
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 10),
        Align(
          alignment: Alignment.center,
          child: TextButton(
            onPressed: () {},
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Apptheme.mainButonColor),
                color:
                    workoutGoalSelectedButton == 4 ? Apptheme.mainButonColor : Colors.transparent,
                borderRadius: BorderRadius.circular(20),
              ),
              width: 300,
              height: 50,
              child: Center(
                child: Text(
                  'Just to improve my health',
                  style: TextStyle(
                    color: workoutGoalSelectedButton == 4 ? Colors.white : Apptheme.mainButonColor,
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 10),
        Spacer(flex: 2)
      ],
    );
  }

  Column workoutExperiencelevel() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              Icons.local_fire_department,
              color: Apptheme.mainButonColor,
            ),
            Text(
              'LIFTING EXPERIENCE',
              textScaleFactor: 1.5,
              style: TextStyle(
                color: Apptheme.mainButonColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'How experienced are you?',
            textScaleFactor: 1.3,
            style: TextStyle(
              color: Colors.black.withOpacity(.7),
            ),
          ),
        ),
        Spacer(flex: 1),
        Align(
          alignment: Alignment.center,
          child: TextButton(
            onPressed: () {},
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Apptheme.mainButonColor),
                color: workoutExperiencelevelSelectedButton == 1
                    ? Apptheme.mainButonColor
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(20),
              ),
              width: 300,
              height: 50,
              child: Center(
                child: Text(
                  'Beginner',
                  style: TextStyle(
                    color: workoutExperiencelevelSelectedButton == 1
                        ? Colors.white
                        : Apptheme.mainButonColor,
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 10),
        Align(
          alignment: Alignment.center,
          child: TextButton(
            onPressed: () {},
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Apptheme.mainButonColor),
                color: workoutExperiencelevelSelectedButton == 2
                    ? Apptheme.mainButonColor
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(20),
              ),
              width: 300,
              height: 50,
              child: Center(
                child: Text(
                  'Moderate',
                  style: TextStyle(
                    color: workoutExperiencelevelSelectedButton == 2
                        ? Colors.white
                        : Apptheme.mainButonColor,
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 10),
        Align(
          alignment: Alignment.center,
          child: TextButton(
            onPressed: () {},
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Apptheme.mainButonColor),
                color: workoutExperiencelevelSelectedButton == 3
                    ? Apptheme.mainButonColor
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(20),
              ),
              width: 300,
              height: 50,
              child: Center(
                child: Text(
                  'Experienced',
                  style: TextStyle(
                    color: workoutExperiencelevelSelectedButton == 3
                        ? Colors.white
                        : Apptheme.mainButonColor,
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 10),
        Align(
          alignment: Alignment.center,
          child: TextButton(
            onPressed: () {},
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Apptheme.mainButonColor),
                color: workoutExperiencelevelSelectedButton == 4
                    ? Apptheme.mainButonColor
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(20),
              ),
              width: 300,
              height: 50,
              child: Center(
                child: Text(
                  'Professional',
                  style: TextStyle(
                    color: workoutExperiencelevelSelectedButton == 4
                        ? Colors.white
                        : Apptheme.mainButonColor,
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 10),
        Spacer(flex: 2)
      ],
    );
  }

  Column userPhysicalDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              Icons.local_fire_department,
              color: Apptheme.mainButonColor,
            ),
            Text(
              'ABOUT YOU',
              textScaleFactor: 1.5,
              style: TextStyle(
                color: Apptheme.mainButonColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Lets gather the final details about you',
            textScaleFactor: 1.3,
            style: TextStyle(
              color: Colors.black.withOpacity(.7),
            ),
          ),
        ),
        Spacer(flex: 1),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 30),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Enter your height',
              enabledBorder: UnderlineInputBorder(),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Apptheme.mainButonColor),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 30),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Enter your weight',
              enabledBorder: UnderlineInputBorder(),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Apptheme.mainButonColor),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 30),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Enter your age',
              enabledBorder: UnderlineInputBorder(),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Apptheme.mainButonColor),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Enter your nationality',
              enabledBorder: UnderlineInputBorder(),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Apptheme.mainButonColor),
              ),
            ),
          ),
        ),
        Spacer(flex: 2)
      ],
    );
  }
}
