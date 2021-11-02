import 'package:flutter/material.dart';
import '../../../theme/theme.dart';

class NutritionStatisticsContainer_Widget extends StatelessWidget {
  final IconData icon;
  final Color color;
  final double value;
  const NutritionStatisticsContainer_Widget(
      {Key? key, required this.icon, required this.color, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double value1 = value * 100;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(
          backgroundColor: Apptheme.mainCardColor,
          child: Icon(
            icon,
            color: color,
          ),
        ),
        Flexible(
          child: ListTile(
            visualDensity: VisualDensity(horizontal: 0, vertical: -4),
            title: Text(
              '${value1.toInt()}%',
              style: TextStyle(color: color, fontWeight: FontWeight.bold),
            ),
            subtitle: LinearProgressIndicator(
              value: value,
              color: color,
              backgroundColor: Colors.grey.withOpacity(.4),
            ),
          ),
        )
      ],
    );
  }
}
