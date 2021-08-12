import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:textfield_tags/textfield_tags.dart';
import 'package:workify/services/authServices.dart';
import 'package:workify/theme/theme.dart';
import 'package:workify/widgets/workoutCatTypesButton.dart';

class AddWorkoutFAB extends StatelessWidget {
  final BuildContext context;
  final double screenHeight;
  final double screenWidth;
  final TextEditingController workoutTitleTextController;
  final TextEditingController workoutTagsTextController;
  final TextEditingController workoutDescriptionTextController;
  final TextEditingController workoutTypeTextController;

  static List? workoutTags = [];
  static String workoutType = 'default';

  const AddWorkoutFAB(
      {Key? key,
      required this.context,
      required this.screenHeight,
      required this.screenWidth,
      required this.workoutTitleTextController,
      required this.workoutTagsTextController,
      required this.workoutDescriptionTextController,
      required this.workoutTypeTextController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Apptheme.mainButonColor.withOpacity(.2),
        child: Icon(Icons.add, color: Apptheme.mainButonColor),
      ),
    );
  }

  addWorkoutTags() {
    return TextFieldTags(
      tagsStyler: TagsStyler(
          tagTextStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          tagDecoration: BoxDecoration(
            color: Apptheme.mainCardColor,
            borderRadius: BorderRadius.circular(8.0),
          ),
          tagCancelIcon: Icon(Icons.close, size: 18.0, color: Colors.white),
          tagPadding: const EdgeInsets.all(6.0)),
      textFieldStyler: TextFieldStyler(
        helperText: '',
        hintText: 'Workout tags. w 1, w 2, w 3 etc..',
        hintStyle: TextStyle(
          color: Apptheme.mainTextColor.withOpacity(.2),
        ),
        textFieldEnabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Apptheme.mainTextColor),
        ),
        textFieldFocusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Apptheme.mainTextColor),
        ),
        textFieldBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Apptheme.mainTextColor),
        ),
      ),
      onTag: (tag) {
        workoutTags!.add(tag);
      },
      onDelete: (tag) {
        workoutTags!.remove(tag);
      },
      validator: (tag) {
        if (tag!.length > 15) {
          return "hey that's too long";
        }
        return null;
      },
    );
  }

  createWorkoutSheet() {
    return showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Apptheme.mainBackgroundColor,
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      builder: (context) {
        return ListView(
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(LineIcons.times, color: Apptheme.mainTextColor)),
                      Text('Create Your Workout', style: TextStyle(color: Apptheme.mainTextColor)),
                      GestureDetector(
                          onTap: () {
                            print('Add Image');
                          },
                          child: Icon(LineIcons.camera, color: Apptheme.mainTextColor)),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 13, 0, 13),
                    child: Text('Workout Type',
                        textScaleFactor: 1.2, style: TextStyle(color: Apptheme.mainTextColor)),
                  ),
                  Row(
                    children: [
                      Container(
                        height: screenHeight / 10,
                        width: screenWidth - 20,
                        child: ListView(
                          addAutomaticKeepAlives: true,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          children: [
                            WorkoutCatTypesButton(
                                onPressed: () {
                                  workoutType = 'Cardio';
                                },
                                icon: LineIcons.running,
                                title: 'Cardio'),
                            WorkoutCatTypesButton(
                                onPressed: () {
                                  workoutType = 'Cycling';
                                },
                                icon: LineIcons.bicycle,
                                title: 'Cycling'),
                            WorkoutCatTypesButton(
                                onPressed: () {
                                  workoutType = 'Cross-Fit';
                                },
                                icon: LineIcons.heartbeat,
                                title: 'Cross-Fit'),
                            WorkoutCatTypesButton(
                                onPressed: () {
                                  workoutType = 'Weight Lifting';
                                },
                                icon: LineIcons.dumbbell,
                                title: 'Weight Lifting'),
                            WorkoutCatTypesButton(
                                onPressed: () {
                                  workoutType = 'Swimming';
                                },
                                icon: LineIcons.swimmer,
                                title: 'Swimming'),
                            WorkoutCatTypesButton(
                                onPressed: () {
                                  workoutType = 'Rucking';
                                },
                                icon: LineIcons.hiking,
                                title: 'Rucking'),
                          ],
                        ),
                      )
                    ],
                  ),
                  Padding(
                      padding: const EdgeInsets.fromLTRB(0, 15, 0, 10),
                      child: Text('Workout Title',
                          textScaleFactor: 1.2, style: TextStyle(color: Apptheme.mainTextColor))),
                  TextField(
                    controller: workoutTitleTextController,
                    decoration: (InputDecoration(
                      hintText: 'Workout 1',
                      hintStyle: TextStyle(color: Apptheme.mainTextColor.withOpacity(0.2)),
                      fillColor: Apptheme.mainTextColor,
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Apptheme.mainTextColor),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Apptheme.mainTextColor),
                      ),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Apptheme.mainTextColor),
                      ),
                    )),
                  ),
                  Padding(
                      padding: const EdgeInsets.fromLTRB(0, 15, 0, 10),
                      child: Text('Workout Title',
                          textScaleFactor: 1.2, style: TextStyle(color: Apptheme.mainTextColor))),
                  TextField(
                    controller: workoutDescriptionTextController,
                    decoration: (InputDecoration(
                      hintText: 'Brief description',
                      hintStyle: TextStyle(color: Apptheme.mainTextColor.withOpacity(0.2)),
                      fillColor: Apptheme.mainTextColor,
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Apptheme.mainTextColor),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Apptheme.mainTextColor),
                      ),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Apptheme.mainTextColor),
                      ),
                    )),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 15, 0, 10),
                    child: Text(
                      'Workout Tags',
                      textScaleFactor: 1.2,
                      style: TextStyle(color: Apptheme.mainTextColor),
                    ),
                  ),
                  addWorkoutTags(),
                  ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Apptheme.mainButonColor.withOpacity(.2))),
                    onPressed: () async {
                      //print
                      await AuthServices.addUserWorkout(
                        workoutDescription: workoutDescriptionTextController.text,
                        workoutTags: workoutTags,
                        workoutTitle: workoutTitleTextController.text,
                        workoutType: workoutType,
                      );

                      Navigator.pop(context);
                    },
                    child: Container(
                      width: double.infinity,
                      child: Center(
                        child: Text(
                          'Add Workout',
                          style: TextStyle(color: Apptheme.mainButonColor),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
