import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:workify/theme/theme.dart';

class MealPlanView extends StatelessWidget {
  const MealPlanView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _searchcontroller = TextEditingController();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(height: 10),
            Text('Nutrition',
                textScaleFactor: 1.3,
                style: TextStyle(color: Apptheme.mainTextColor)),
            SizedBox(height: 10),
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
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: userStatisticsTab(
                        icon: LineIcons.burn,
                        detailsString: 'Calories',
                        value: 3200)),
                Expanded(
                    child: userStatisticsTab(
                        icon: LineIcons.drumstickWithBiteTakenOut,
                        detailsString: 'Vitamin D',
                        value: 30)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: userStatisticsTab(
                        icon: LineIcons.fish,
                        detailsString: 'Vitamin A',
                        value: 120)),
                Expanded(
                    child: userStatisticsTab(
                        icon: LineIcons.seedling,
                        detailsString: 'Vitamin E',
                        value: 120)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: userStatisticsTab(
                        icon: LineIcons.fruitApple,
                        detailsString: 'Vitamin C',
                        value: 120)),
                Expanded(
                    child: userStatisticsTab(
                        icon: Icons.local_fire_department,
                        detailsString: 'Protein',
                        value: 120)),
              ],
            ),
            SizedBox(height: 20),
            Text('Recents',
                textScaleFactor: 1.3,
                style: TextStyle(color: Apptheme.mainTextColor)),
            SizedBox(height: 20),
            Expanded(
                child: ListView(
              children: [
                featuredHorizontalTabCard(),
                featuredHorizontalTabCard(),
                featuredHorizontalTabCard(),
                featuredHorizontalTabCard(),
                featuredHorizontalTabCard(),
                featuredHorizontalTabCard(),
                featuredHorizontalTabCard(),
                featuredHorizontalTabCard(),
              ],
            ))
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
