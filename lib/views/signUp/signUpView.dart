import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:workify/theme/theme.dart';
import 'package:workify/views/signUp/signUpConfirmationView.dart';
import 'package:workify/widgets/advancedTextField.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  get key => null;

  TextEditingController userNameTextController = TextEditingController();
  TextEditingController emailTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();
  TextEditingController firstNameTextController = TextEditingController();
  TextEditingController lastNameTextController = TextEditingController();
  TextEditingController nationalityTextController = TextEditingController();

  double workoutFrequency = 0;
  int userWorkoutExperienceListKey = 0;
  String? workoutGoal;
  List userWorkoutExperienceList = [
    'a beginner',
    'an intermediate',
    'an experienced',
    'an advanced',
    'a professional',
    'an ego lifter',
  ];

  TextEditingController heightTextController = TextEditingController();
  TextEditingController ageTextController = TextEditingController();
  TextEditingController weightTextController = TextEditingController();

  bool workoutActivity = false;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width.toDouble();
    double height = MediaQuery.of(context).size.height.toDouble();
    return Scaffold(
      bottomNavigationBar: GestureDetector(
        onTap: () {
          Navigator.push(
            (context),
            MaterialPageRoute(
              builder: (context) => SingnUpConfirmationView(
                userName: userNameTextController.text,
                email: emailTextController.text,
                password: passwordTextController.text,
                firstName: firstNameTextController.text,
                lastName: lastNameTextController.text,
                nationality: nationalityTextController.text,
              ),
            ),
          );
        },
        child: BottomAppBar(
            color: Apptheme.mainButonColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(height: 50),
                SizedBox(width: 1),
                Text(
                  'Save And Procced',
                  textScaleFactor: 1.4,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                Icon(Icons.arrow_forward_ios, color: Colors.white),
                SizedBox(width: 1)
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
      body: SafeArea(
        child: ListView(
          children: [
            advancedTextField(
                screenHeigh: height,
                screenWidth: width,
                hintText: 'SwollDoe',
                title: 'User Name',
                textEditingController: userNameTextController,
                textInputType: TextInputType.name),
            advancedTextField(
                screenHeigh: height,
                screenWidth: width,
                hintText: 'johndoe@getswol.com',
                title: 'Email',
                textEditingController: emailTextController,
                textInputType: TextInputType.emailAddress),
            advancedTextField(
                screenHeigh: height,
                screenWidth: width,
                hintText: 'johnisoutofshapw:(05',
                title: 'Password',
                textEditingController: passwordTextController,
                textInputType: TextInputType.visiblePassword),
            advancedTextField(
                screenHeigh: height,
                screenWidth: width,
                hintText: 'john',
                title: 'First Name',
                textEditingController: firstNameTextController,
                textInputType: TextInputType.name),
            advancedTextField(
                screenHeigh: height,
                screenWidth: width,
                hintText: 'doe',
                title: 'Last Name',
                textEditingController: lastNameTextController,
                textInputType: TextInputType.name),
            advancedTextField(
                screenHeigh: height,
                screenWidth: width,
                hintText: 'johndoeian',
                title: 'Nationality',
                textEditingController: nationalityTextController,
                textInputType: TextInputType.name),
            SafeArea(
              child: Column(
                children: [
                  advancedTextField(
                      screenHeigh: height,
                      screenWidth: width,
                      hintText: '94 inches',
                      title: 'Height Inch',
                      textEditingController: heightTextController,
                      textInputType: TextInputType.number),
                  advancedTextField(
                      screenHeigh: height,
                      screenWidth: width,
                      hintText: '69',
                      title: 'Age',
                      textEditingController: ageTextController,
                      textInputType: TextInputType.datetime),
                  advancedTextField(
                      screenHeigh: height,
                      screenWidth: width,
                      hintText: '420',
                      title: 'Weight lbs',
                      textEditingController: weightTextController,
                      textInputType: TextInputType.number),
                  Container(
                    width: width * .70,
                    child: Column(
                      children: [
                        SizedBox(height: 20),
                        Text('Main workout goal',
                            style: TextStyle(color: Apptheme.mainTextColor)),
                        DropdownButton<String>(
                          value: workoutGoal,
                          style: TextStyle(color: Apptheme.mainTextColor),
                          items: <String>[
                            'I want to gain muscle',
                            'I want to get leaner',
                            'I want to gain weight',
                            'I want to lose weight',
                            'I want to get stronger'
                          ].map<DropdownMenuItem<String>>((String stringValue) {
                            workoutGoal = stringValue;
                            return DropdownMenuItem<String>(
                              value: stringValue,
                              child: Text(
                                stringValue,
                                style: TextStyle(color: Apptheme.mainTextColor),
                              ),
                            );
                          }).toList(),
                          hint: Text(
                            'What is your main workout goal',
                            style: TextStyle(
                              color: Apptheme.mainTextColor.withOpacity(.7),
                            ),
                          ),
                          dropdownColor: Apptheme.mainCardColor,
                          onChanged: (value) {
                            setState(() {
                              workoutGoal = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: width * .70,
                    child: Column(
                      children: [
                        Text('Workout frequency',
                            style: TextStyle(color: Apptheme.mainTextColor)),
                        Text(
                            'I workout ${workoutFrequency.round()} times a week',
                            textScaleFactor: .8,
                            style: TextStyle(color: Apptheme.mainTextColor)),
                        Slider(
                          value: workoutFrequency,
                          onChanged: (value) {
                            setState(() {
                              workoutFrequency = value;
                            });
                          },
                          label: workoutFrequency.round().toString(),
                          divisions: 7,
                          min: 0,
                          max: 7,
                          activeColor: Apptheme.mainButonColor,
                          inactiveColor: Apptheme.mainCardColor,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: width * .70,
                    child: Column(
                      children: [
                        Text('How experienced are you in weight lifting',
                            style: TextStyle(color: Apptheme.mainTextColor)),
                        Text(
                            'I am ${userWorkoutExperienceList[userWorkoutExperienceListKey]} lifter',
                            textScaleFactor: .8,
                            style: TextStyle(color: Apptheme.mainTextColor)),
                        Slider(
                          value: userWorkoutExperienceListKey.toDouble(),
                          onChanged: (value) {
                            setState(() {
                              userWorkoutExperienceListKey = value.toInt();
                            });
                          },
                          label: "you're " +
                              userWorkoutExperienceList[
                                  userWorkoutExperienceListKey] +
                              " lifter",
                          divisions: 5,
                          min: 0,
                          max: 5,
                          activeColor: Apptheme.mainButonColor,
                          inactiveColor: Apptheme.mainCardColor,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding advancedTextField({
    textInputType: TextInputType,
    screenHeigh: double,
    screenWidth: double,
    hintText: String,
    textEditingController: TextEditingController,
    title: String,
  }) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(color: Apptheme.mainTextColor),
            ),
            AdvanceTextField(
              keyboardType: textInputType,
              height: screenHeigh * .05,
              width: screenWidth * .70,
              saveLabel: Icon(
                Icons.check,
                color: Apptheme.mainTextColor,
              ),
              editLabel: Icon(
                Icons.edit,
                color: Apptheme.mainTextColor,
              ),
              textHint: hintText,
              onEditTap: () {},
              onSaveTap: (text) {
                print(text);
              },
              animationDuration: Duration(milliseconds: 200),
              text: hintText,
              key: key,
              controller: textEditingController,
              textStyle: TextStyle(
                color: Colors.white.withOpacity(.4),
              ),
              textHintStyle: TextStyle(),
              textColor: Colors.red,
              textHintColor: Colors.white,
              backgroundColor: Apptheme.mainCardColor,
              color: Apptheme.mainBackgroundColor,
              type: AdvanceTextFieldType.EDIT,
            ),
          ],
        ),
      ),
    );
  }
}
