import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:workify/theme/theme.dart';

class WorkoutList_Widget extends StatelessWidget {
  const WorkoutList_Widget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 10,
                    blurRadius: 5,
                    offset: Offset(0, 7), // changes position of shadow
                  ),
                ],
              ),
              height: MediaQuery.of(context).size.height * .35,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Image(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/images/DailyWorkout.png'),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: MediaQuery.of(context).size.height * .12,
                      color: Apptheme.mainCardColor,
                      width: MediaQuery.of(context).size.width * .445,
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Fat Burn Max',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 2),
                          Expanded(
                            child: Text(
                              'It is a long established fact that a reader will; random text text text  ',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
