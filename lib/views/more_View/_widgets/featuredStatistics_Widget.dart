import 'package:awesome_emojis/emojis.dart';
import 'package:flutter/material.dart';
import 'package:workify/theme/theme.dart';

class FeaturedStatistics_Widget extends StatelessWidget {
  const FeaturedStatistics_Widget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: Apptheme.mainCardColor),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: RichText(
                    textAlign: TextAlign.start,
                    text: TextSpan(
                      text: '${Emojis.fire}',
                      style: TextStyle(color: Apptheme.mainButonColor),
                      children: <TextSpan>[
                        TextSpan(
                          text: '40',
                          style: TextStyle(
                            color: Apptheme.mainButonColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: ' Days\n',
                          style: TextStyle(
                            color: Apptheme.mainButonColor,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        TextSpan(
                          text: 'Workouts done in a row',
                          style: TextStyle(
                            color: Apptheme.mainButonColor,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
