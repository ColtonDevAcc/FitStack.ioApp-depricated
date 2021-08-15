import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

import 'DashboardStatisticsCard_Widget.dart';

class NutritionDashboard_Widget extends StatelessWidget {
  const NutritionDashboard_Widget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              NutritionDashboardStatisticsCard_Widget(
                icon: Icons.local_fire_department,
                color: Colors.red,
                label: 'Calories',
                data: 0,
              ),
              NutritionDashboardStatisticsCard_Widget(
                icon: LineIcons.prescriptionBottle,
                color: Colors.green,
                label: 'Fiber',
                data: 0,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              NutritionDashboardStatisticsCard_Widget(
                icon: LineIcons.prescriptionBottle,
                color: Colors.blue.shade900,
                label: 'Caffine',
                data: 0,
              ),
              NutritionDashboardStatisticsCard_Widget(
                icon: LineIcons.prescriptionBottle,
                color: Colors.red.shade300,
                label: 'Carbs',
                data: 0,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              NutritionDashboardStatisticsCard_Widget(
                icon: LineIcons.prescriptionBottle,
                color: Colors.orange.shade700,
                label: 'Sugars',
                data: 0,
              ),
              NutritionDashboardStatisticsCard_Widget(
                icon: LineIcons.drumstickWithBiteTakenOut,
                color: Colors.blue.shade900,
                label: 'Protein',
                data: 0,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
