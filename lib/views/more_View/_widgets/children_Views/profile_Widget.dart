import 'package:flutter/material.dart';

class Profile_Widget extends StatelessWidget {
  const Profile_Widget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(width: 10),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            text: 'Streak\n',
            style: TextStyle(color: Colors.black),
            children: <TextSpan>[
              TextSpan(
                text: '6\n',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text: 'Day/s',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
        CircleAvatar(
          maxRadius: 40,
          backgroundColor: Color.fromRGBO(37, 44, 76, 1),
          backgroundImage: NetworkImage(
              'https://guycounseling.com/wp-content/uploads/2015/06/body-building-advanced-training-techniques-678x381.jpg'),
        ),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            text: 'User\n',
            style: TextStyle(color: Colors.black),
            children: <TextSpan>[
              TextSpan(
                text: 'Member\n',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text: 'Rank',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: 10),
      ],
    );
  }
}
