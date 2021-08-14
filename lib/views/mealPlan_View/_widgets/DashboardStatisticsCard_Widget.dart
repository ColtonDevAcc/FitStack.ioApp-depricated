import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NutritionDashboardStatisticsCard_Widget extends StatelessWidget {
  final IconData icon;
  final Color color;
  final int data;
  final String label;
  const NutritionDashboardStatisticsCard_Widget(
      {Key? key, required this.icon, required this.color, required this.data, required this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              icon,
              color: color,
              size: 35,
            )
          ],
        ),
        SizedBox(width: 5),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              data.toString(),
              textScaleFactor: 1.2,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              label,
              textScaleFactor: 1.1,
            ),
          ],
        ),
      ],
    );
  }
}
