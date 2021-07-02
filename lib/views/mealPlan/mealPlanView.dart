import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:workify/controllers/authServices.dart';
import 'package:workify/controllers/currentUser.dart';
import 'package:workify/controllers/currentUserNutrition.dart';
import 'package:workify/theme/theme.dart';

class MealPlanView extends StatelessWidget {
  const MealPlanView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _searchcontroller = TextEditingController();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Column(
          children: [
            SizedBox(height: 1),
            Text('Nutrition',
                textScaleFactor: 1.3,
                style: TextStyle(color: Apptheme.mainTextColor)),
            SizedBox(height: 1),
            TextFormField(
              controller: _searchcontroller,
              style: TextStyle(color: Colors.white),
              autofocus: false,
              autocorrect: true,
              decoration: InputDecoration(
                filled: true,
                labelText: 'Search meal plans, or reci...',
                labelStyle:
                    TextStyle(color: Apptheme.mainTextColor.withOpacity(.5)),
                fillColor: Apptheme.mainCardColor,
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white.withOpacity(0)),
                    borderRadius: BorderRadius.circular(15)),
              ),
            ),
            SizedBox(height: 1),
            Text(
              'Recommended',
              style: TextStyle(color: Apptheme.mainTextColor),
            ),
            SizedBox(height: 1),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: userStatisticsTab(
                  icon: LineIcons.burn,
                  detailsString: 'Cal',
                  value: CurrentUserNutrition.userRecommendedCalorieIntake!
                      .toInt(),
                )),
                Expanded(
                    child: userStatisticsTab(
                  icon: LineIcons.drumstickWithBiteTakenOut,
                  detailsString: 'Vit D',
                  value: CurrentUserNutrition.userRecommendedVitaminDIntake!
                      .toInt(),
                )),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: userStatisticsTab(
                  icon: LineIcons.fish,
                  detailsString: 'Vit A',
                  value: CurrentUserNutrition.userRecommendedVitaminAIntake!
                      .toInt(),
                )),
                Expanded(
                    child: userStatisticsTab(
                  icon: LineIcons.seedling,
                  detailsString: 'Vit E',
                  value: CurrentUserNutrition.userRecommendedVitaminEIntake!
                      .toInt(),
                )),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: userStatisticsTab(
                  icon: LineIcons.fruitApple,
                  detailsString: 'Vit C',
                  value: CurrentUserNutrition.userRecommendedVitaminCIntake!
                      .toInt(),
                )),
                Expanded(
                    child: userStatisticsTab(
                  icon: Icons.local_fire_department,
                  detailsString: 'Protein',
                  value: (CurrentUser.weight! * 0.65).round(),
                )),
              ],
            ),
            SizedBox(height: 1),
            Text('Recents meals',
                textScaleFactor: 1.3,
                style: TextStyle(color: Apptheme.mainTextColor)),
            SizedBox(height: 1),
            Flexible(
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('UserInfo')
                    .doc(AuthServices.userUID)
                    .collection('UserAddedMeal')
                    .snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return Text('Something went wrong');
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Text("Loading");
                  }

                  return new ListView(
                    children:
                        snapshot.data!.docs.map((DocumentSnapshot document) {
                      Map<String, dynamic> data =
                          document.data() as Map<String, dynamic>;

                      return new ListTile(
                        title: new Text(
                          data['mealTitle'] == null
                              ? 'null info'
                              : data['mealTitle'],
                        ),
                        subtitle: Text(
                          '${data['mealCalories'].toString()} Calories, ${data['mealProtein'].toString()}g Protein -- ${data['mealEntryCreationDateTime']}',
                          style: TextStyle(
                            color: Apptheme.mainTextColor,
                          ),
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          color: Apptheme.mainTextColor,
                        ),
                      );
                    }).toList(),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

Padding userStatisticsTab({icon: IconData, detailsString: String, value: int}) {
  return Padding(
    padding: EdgeInsets.all(5),
    child: Row(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Apptheme.mainCardColor),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    icon,
                    color: Apptheme.mainButonColor,
                  ),
                  SizedBox(height: 40),
                  Row(
                    children: [
                      Text(value.toString(),
                          textScaleFactor: 1.5,
                          style: TextStyle(color: Apptheme.mainTextColor)),
                      SizedBox(width: 5),
                      Text(detailsString,
                          style: TextStyle(color: Apptheme.mainTextColor)),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

Padding featuredHorizontalTabCard() {
  return Padding(
    padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
    child: Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Apptheme.mainCardColor),
      child: ListTile(
        title: Text('Meal A'),
        leading: ClipRRect(
          borderRadius: BorderRadius.all(Radius.elliptical(15, 15)),
          child: Image.asset('assets/images/RopeSwings.png'),
        ),
        subtitle: Text(
          '130 G Protein - 1200 cal',
          style: TextStyle(color: Apptheme.mainTextColor),
        ),
        trailing: Container(
          color: Apptheme.mainButonColor,
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Icon(
              Icons.arrow_forward_ios,
              size: 15,
              color: Colors.white,
            ),
          ),
        ),
      ),
    ),
  );
}
