import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:workify/controllers/authServices.dart';
import 'package:workify/nutritionState.dart';
import 'package:workify/theme/theme.dart';
import 'package:workify/views/mealPlan/createMealPlanView.dart';
import 'package:provider/provider.dart';

class MealPlanView extends StatelessWidget {
  const MealPlanView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _screenHeight = MediaQuery.of(context).size.height;
    double totalCalorie = 0;
    int index = 0;

    updateCalorie({
      calories: double,
      indexEnd: int,
      fiber: double,
      protein: double,
      carbs: double,
      sugar: double,
      caffine: double,
    }) {
      totalCalorie += calories;
      index++;

      if (index == indexEnd) {
        context.watch<NutritionState>().Calories = totalCalorie;
        context.watch<NutritionState>().Caffine = caffine;
        context.watch<NutritionState>().Carbs = carbs;
        context.watch<NutritionState>().Sugars = sugar;
        context.watch<NutritionState>().Fiber = fiber;
        context.watch<NutritionState>().Proteins = protein;
      }
    }

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
            Container(
              height: _screenHeight * .25,
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      statsForConsumption(
                        icon: Icons.local_fire_department,
                        color: Colors.red,
                        label: 'Calories',
                        data: context.watch<NutritionState>().Calories,
                      ),
                      statsForConsumption(
                        icon: LineIcons.prescriptionBottle,
                        color: Colors.green,
                        label: 'Fiber',
                        data: context.watch<NutritionState>().Fiber,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      statsForConsumption(
                        icon: LineIcons.prescriptionBottle,
                        color: Colors.blue.shade900,
                        label: 'Caffine',
                        data: context.watch<NutritionState>().Proteins,
                      ),
                      statsForConsumption(
                        icon: LineIcons.prescriptionBottle,
                        color: Colors.red.shade300,
                        label: 'Carbs',
                        data: context.watch<NutritionState>().Carbs,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      statsForConsumption(
                        icon: LineIcons.prescriptionBottle,
                        color: Colors.orange.shade700,
                        label: 'Sugars',
                        data: context.watch<NutritionState>().Sugars,
                      ),
                      statsForConsumption(
                        icon: LineIcons.drumstickWithBiteTakenOut,
                        color: Colors.blue.shade900,
                        label: 'Protein',
                        data: context.watch<NutritionState>().Proteins,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('UserInfo')
                    .doc(AuthServices.userUID)
                    .collection('UserEvents')
                    .doc('AddMealEvent')
                    .collection(
                        'Y${DateTime.now().year}-M${DateTime.now().month}-D${DateTime.now().day}')
                    .snapshots(),
                builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return Text('Something went wrong');
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Text("Loading");
                  }

                  return new GridView.count(
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 20),
                    childAspectRatio: .8,
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    children: snapshot.data!.docs.map((DocumentSnapshot document) {
                      Map<String, dynamic> data = document.data() as Map<String, dynamic>;
                      //set calories here for each meal
                      updateCalorie(
                          calories: double.parse(data['energy_serving']),
                          carbs: double.parse(data['carbohydrates_serving']),
                          fiber: double.parse(data['fiber_serving']),
                          sugar: double.parse(data['sugars_serving']),
                          protein: double.parse(data['proteins_serving']),
                          caffine: double.parse(data['proteins_serving']),
                          indexEnd: snapshot.data!.docs.length);

                      return Container(
                        decoration: BoxDecoration(
                          color: Apptheme.mainCardColor,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                data['product_name'] != null ? '${data['product_name']}' : '?',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                              child: Text.rich(
                                TextSpan(
                                  text: data['proteins_serving'] != null
                                      ? '${data['proteins_serving']}g\n'
                                      : '?',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                  children: [
                                    TextSpan(
                                      text: 'Protein',
                                      style: TextStyle(fontWeight: FontWeight.normal),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text.rich(
                                TextSpan(
                                  text: '${data['energy_serving']}\n',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                  children: [
                                    TextSpan(
                                      text: 'Calories',
                                      style: TextStyle(fontWeight: FontWeight.normal),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: Apptheme.mainButonColor,
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(15),
                                    bottomRight: Radius.circular(15),
                                  )),
                              width: double.infinity,
                              child: TextButton(
                                onPressed: () {},
                                child: Text(
                                  'Edit',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    }).toList()
                      ..add(
                        Container(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CreateMealPlanView(),
                                ),
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Apptheme.mainCardColor,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Center(
                                child: Icon(
                                  LineIcons.plus,
                                  size: 50,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

statsForConsumption({
  icon: IconData,
  color: Colors,
  data: double,
  label: String,
}) {
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
