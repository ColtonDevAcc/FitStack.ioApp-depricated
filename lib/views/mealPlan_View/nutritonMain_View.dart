import 'package:flutter/material.dart';
import 'package:workify/theme/theme.dart';
import '_widgets/Dashboard_Widget.dart';
import '_widgets/nutritionAddedProducts_Widget.dart';

class Nutrition_View extends StatelessWidget {
  const Nutrition_View({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Apptheme.mainBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: AppBar().preferredSize.height,
            ),
            Text(
              'NUTRITION',
              textScaleFactor: 1.4,
              style: TextStyle(
                color: Apptheme.mainButonColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Consumption',
              textScaleFactor: 1.2,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Expanded(
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
                  borderRadius: BorderRadius.circular(15),
                  color: Apptheme.mainCardColor,
                ),
                padding: EdgeInsets.all(20),
                child: NutritionDashboard_Widget(),
              ),
            ),
            NutritionAddedProducts_Widget(),
          ],
        ),
      ),
    );
  }
}
