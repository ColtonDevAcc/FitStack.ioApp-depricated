import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:workify/theme/theme.dart';
import 'package:workify/widgets/advancedTextField.dart';

class SignUpPageTwo extends StatelessWidget {
  const SignUpPageTwo({
    Key? key,
    userName: String,
    email: String,
    password: String,
    firstName: String,
    lastName: String,
    nationality: String,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController userNameTextController = TextEditingController();
    TextEditingController emailTextController = TextEditingController();
    TextEditingController passwordTextController = TextEditingController();
    TextEditingController firstNameTextController = TextEditingController();
    TextEditingController lastNameTextController = TextEditingController();
    TextEditingController nationalityTextController = TextEditingController();

    double width = MediaQuery.of(context).size.width.toDouble();
    double height = MediaQuery.of(context).size.height.toDouble();
    return Scaffold(
      bottomNavigationBar: GestureDetector(
        onTap: () {
          print('noice');
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
                  style: TextStyle(color: Colors.white),
                ),
                Icon(Icons.arrow_forward_ios, color: Colors.white),
                SizedBox(width: 1)
              ],
            )),
      ),
      backgroundColor: Apptheme.mainBackgroundColor,
      appBar: AppBar(
        title: Text(
          'Physical',
          style: TextStyle(color: Apptheme.mainTextColor),
        ),
        backgroundColor: Apptheme.mainCardColor,
      ),
      body: SafeArea(
        child: Column(
          children: [
            advancedTextField(
              screenHeigh: height,
              screenWidth: width,
              hintText: '94 inches',
              title: 'Height Inch',
              textEditingController: userNameTextController,
            ),
            advancedTextField(
              screenHeigh: height,
              screenWidth: width,
              hintText: '69',
              title: 'Age',
              textEditingController: emailTextController,
            ),
            advancedTextField(
              screenHeigh: height,
              screenWidth: width,
              hintText: '420',
              title: 'Weight lbs',
              textEditingController: passwordTextController,
            ),
            advancedTextField(
              screenHeigh: height,
              screenWidth: width,
              hintText: 'Activity',
              title: 'First Name',
              textEditingController: firstNameTextController,
            ),
            advancedTextField(
              screenHeigh: height,
              screenWidth: width,
              hintText: 'doe',
              title: 'Last Name',
              textEditingController: lastNameTextController,
            ),
            advancedTextField(
              screenHeigh: height,
              screenWidth: width,
              hintText: 'johndoeian',
              title: 'Nationality',
              textEditingController: nationalityTextController,
            ),
          ],
        ),
      ),
    );
  }

  Padding advancedTextField({
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
              keyboardType: TextInputType.text,
              height: screenHeigh * .05,
              width: screenWidth * .70,
              saveLabel: Icon(
                Icons.check,
                color: Colors.white,
              ),
              editLabel: Icon(
                Icons.edit,
                color: Colors.white,
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
              backgroundColor: Apptheme.mainButonColor,
              color: Apptheme.mainBackgroundColor,
              type: AdvanceTextFieldType.EDIT,
            ),
          ],
        ),
      ),
    );
  }
}
