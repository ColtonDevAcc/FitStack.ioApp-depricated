import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:workify/providers/nutritionProvider.dart';
import 'package:workify/services/authServices.dart';
import 'package:workify/theme/theme.dart';
import 'package:workify/views/mealPlan/createMealPlanView.dart';
import 'package:provider/provider.dart';

class MealPlanView extends StatelessWidget {
  const MealPlanView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int index = 0;

    double _screenHeight = MediaQuery.of(context).size.height;

    double totalCalorie = 0;
    double totalCarbs = 0;
    double totalSugar = 0;
    double totalFiber = 0;
    double totalProtein = 0;

    updateCalorie({
      calories: double,
      state: String,
      fiber: double,
      protein: double,
      carbs: double,
      sugar: double,
    }) async {
      totalCalorie += calories;
      totalCarbs += carbs;
      totalSugar += sugar;
      totalFiber += fiber;
      totalProtein += protein;
      index++;

      var push = Provider.of<NutritionState>(context, listen: false);

      if (state == 'ConnectionState.done') {
        print('Starting push');
        push.Calories = totalCalorie;
        push.Carbs = totalCarbs;
        push.Sugars = totalSugar;
        push.Fiber = totalFiber;
        push.Proteins = totalProtein;
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
                        data: context.watch<NutritionState>().Calories.round(),
                      ),
                      statsForConsumption(
                        icon: LineIcons.prescriptionBottle,
                        color: Colors.green,
                        label: 'Fiber',
                        data: context.watch<NutritionState>().Fiber.round(),
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
                        data: context.watch<NutritionState>().Proteins.round(),
                      ),
                      statsForConsumption(
                        icon: LineIcons.prescriptionBottle,
                        color: Colors.red.shade300,
                        label: 'Carbs',
                        data: context.watch<NutritionState>().Carbs.round(),
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
                        data: context.watch<NutritionState>().Sugars.round(),
                      ),
                      statsForConsumption(
                        icon: LineIcons.drumstickWithBiteTakenOut,
                        color: Colors.blue.shade900,
                        label: 'Protein',
                        data: context.watch<NutritionState>().Proteins.round(),
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
                  if (snapshot.connectionState == ConnectionState.done) {
                    updateCalorie(
                      calories: 0.0,
                      carbs: 0.0,
                      fiber: 0.0,
                      sugar: 0.0,
                      protein: 0.0,
                      state: "done",
                    );
                  }
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
                        calories: double.tryParse(data['energy_serving'] ?? '0') ?? 0.0,
                        carbs: double.tryParse(data['carbohydrates_serving'] ?? '0') ?? 0.0,
                        fiber: double.tryParse(data['fiber_serving'] ?? '0') ?? 0.0,
                        sugar: double.tryParse(data['sugars_serving'] ?? '0') ?? 0.0,
                        protein: double.tryParse(data['proteins_serving'] ?? '0') ?? 0.0,
                        state: "notDone",
                      );

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
                                      : '0\n',
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
                                  text: data['energy_serving'] != null
                                      ? '${data['energy_serving']}\n'
                                      : '0\n',
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
