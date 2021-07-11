import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:workify/theme/theme.dart';

class SignUpWandNDetails extends StatelessWidget {
  final firstName;
  final lastName;
  final email;
  final password;

  const SignUpWandNDetails(
      {Key? key, this.firstName, this.lastName, this.email, this.password})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;
    double _screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Apptheme.mainBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.white.withOpacity(0),
        elevation: 0,
        leading: GestureDetector(
          onLongPress: () {
            Navigator.pop(context);
          },
          child: Icon(LineIcons.arrowLeft, color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
        child: Column(
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
            Container(
              width: _screenWidth - 30,
              height: _screenHeight * .2,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        focusColor: Colors.white.withOpacity(0),
                        hintText: 'Type Here',
                        hintStyle: TextStyle(),
                        contentPadding:
                            EdgeInsets.fromLTRB(_screenWidth * .35, 0, 0, 0),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.red.withOpacity(0),
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.red.withOpacity(0),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Spacer(flex: 10),
            TextButton(
              onPressed: () async {
                //! Sign the user up with the current info and push the extra info into firestore
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
                        'Continue',
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(width: 5),
                      Icon(
                        LineIcons.arrowRight,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
