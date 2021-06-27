import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:workify/theme/theme.dart';

class AddMealEntry extends StatelessWidget {
  final TextEditingController calorieTextControler;
  final TextEditingController transfatTextControler;
  final TextEditingController cholesterolTextControler;
  final TextEditingController sodiumTextControler;
  final TextEditingController totalcarbsTextControler;
  final TextEditingController proteinTextControler;
  final TextEditingController vitaminAcalorieTextControler;
  final TextEditingController vitaminCTextControler;
  final TextEditingController calciumTextControler;
  final TextEditingController ironTextControler;

  const AddMealEntry({
    Key? key,
    required this.calorieTextControler,
    required this.transfatTextControler,
    required this.cholesterolTextControler,
    required this.sodiumTextControler,
    required this.totalcarbsTextControler,
    required this.proteinTextControler,
    required this.vitaminAcalorieTextControler,
    required this.vitaminCTextControler,
    required this.calciumTextControler,
    required this.ironTextControler,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        mealDetailEntry(
          title: 'Calories',
          subtitle: 'energy',
          textController: calorieTextControler,
        ),
        mealDetailEntry(
          title: 'Trans fat',
          subtitle: 'g',
          textController: transfatTextControler,
        ),
        mealDetailEntry(
          title: 'Cholesterol',
          subtitle: 'mg',
          textController: cholesterolTextControler,
        ),
        mealDetailEntry(
          title: 'Sodium',
          subtitle: 'mg',
          textController: sodiumTextControler,
        ),
        mealDetailEntry(
          title: 'Total carbs',
          subtitle: 'g',
          textController: totalcarbsTextControler,
        ),
        mealDetailEntry(
          title: 'Protein',
          subtitle: 'g',
          textController: proteinTextControler,
        ),
        mealDetailEntry(
          title: 'Vitamin A',
          subtitle: '%',
          textController: vitaminAcalorieTextControler,
        ),
        mealDetailEntry(
          title: 'Vitamin C',
          subtitle: '%',
          textController: vitaminCTextControler,
        ),
        mealDetailEntry(
          title: 'Calcium',
          subtitle: '%',
          textController: calciumTextControler,
        ),
        mealDetailEntry(
          title: 'Iron',
          subtitle: '%',
          textController: ironTextControler,
        ),
        ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                  Apptheme.mainButonColor.withOpacity(.2))),
          onPressed: () async {
            print(calorieTextControler.text);
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
    );
  }
}

Container mealDetailEntry(
    {title: String, subtitle: String, textController: TextEditingController}) {
  return Container(
    width: double.infinity,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              title,
              style: TextStyle(color: Apptheme.mainTextColor),
            ),
          ],
        ),
        TextField(
          keyboardType: TextInputType.number,
          controller: textController,
          enableInteractiveSelection: true,
          decoration: InputDecoration(
            suffix: Text(
              subtitle,
              style: TextStyle(color: Apptheme.mainButonColor),
            ),
            hintText: title,
            hintStyle: TextStyle(
              color: Apptheme.mainTextColor.withOpacity(.3),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Apptheme.mainTextColor),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Apptheme.mainTextColor),
            ),
          ),
        ),
        SizedBox(height: 20),
      ],
    ),
  );
}
