import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:workify/theme/theme.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController searchcontroller = TextEditingController();
    return Scaffold(
      backgroundColor: Apptheme.mainBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Daily Greeting Text',
                                  style:
                                      TextStyle(color: Apptheme.mainTextColor)),
                              Text('Hi, \$User!',
                                  style: TextStyle(
                                      color: Apptheme.mainTextColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20)),
                            ],
                          ),
                          CircleAvatar(
                            backgroundImage:
                                AssetImage('assets/images/RopeSwings.png'),
                          )
                        ],
                      ),
                      SizedBox(height: 20),
                      //this stuff
                      TextFormField(
                        controller: searchcontroller,
                        style: TextStyle(color: Colors.white),
                        autofocus: false,
                        autocorrect: true,
                        decoration: InputDecoration(
                          filled: true,
                          labelText: 'Search meal plans, workout, abs etc...',
                          labelStyle: TextStyle(color: Apptheme.mainTextColor),
                          fillColor: Apptheme.mainCardColor,
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.white.withOpacity(0)),
                              borderRadius: BorderRadius.circular(15)),
                        ),
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
                Container(
                  height: 55,
                  child: ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      recommendationTab(
                          text: "Weight Traning", icon: Icons.fitness_center),
                      recommendationTab(
                          text: "Yoga", icon: Icons.self_improvement),
                      recommendationTab(
                          text: "Cardio", icon: Icons.directions_run),
                      recommendationTab(
                          text: "Meal Plan", icon: Icons.restaurant),
                    ],
                  ),
                ),
                Container(
                  height: 654,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: ListView(
                      shrinkWrap: true,
                      addAutomaticKeepAlives: true,
                      scrollDirection: Axis.vertical,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(15),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Trending',
                                      textScaleFactor: 1.3,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Apptheme.mainTextColor)),
                                  Text('Show all',
                                      textScaleFactor: .7,
                                      style: TextStyle(
                                          color: Apptheme.mainTextColor))
                                ],
                              ),
                              featuredCard(context: context),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Featured Training',
                                      textScaleFactor: 1.3,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Apptheme.mainTextColor)),
                                  Text('Show all',
                                      textScaleFactor: .7,
                                      style: TextStyle(
                                          color: Apptheme.mainTextColor))
                                ],
                              ),
                              SizedBox(height: 15),
                              featuredHorizontalTabCard(),
                              featuredHorizontalTabCard(),
                              featuredHorizontalTabCard(),
                              featuredHorizontalTabCard(),
                              featuredHorizontalTabCard(),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Padding recommendationTab({text: String, icon: Icons}) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Container(
        decoration: BoxDecoration(
          color: Apptheme.mainCardColor,
          borderRadius: BorderRadius.circular(11),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Icon(icon, color: Apptheme.mainTextColor),
              SizedBox(width: 10),
              Text(text, style: TextStyle(color: Apptheme.mainTextColor)),
            ],
          ),
        ),
      ),
    );
  }

  Padding featuredCard({context: BuildContext}) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 25, 0, 25),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Apptheme.mainCardColor),
        height: 340,
        width: MediaQuery.of(context).size.width.toDouble(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 8, 15, 0),
              child: Container(
                height: 250,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Image.asset(
                    'assets/images/RopeSwings.png',
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
            ),
            ListTile(
              title: Text('RopeRows'),
              subtitle: Text('8 Exercieses   -   1 hr 45 min',
                  style: TextStyle(color: Apptheme.mainTextColor)),
              trailing: ElevatedButton.icon(
                style:
                    ElevatedButton.styleFrom(primary: Apptheme.mainButonColor),
                onPressed: () {},
                icon: Text('Start Now'),
                label: Icon(
                  Icons.arrow_forward_ios,
                  size: 13,
                ),
              ),
            )
          ],
        ),
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
          title: Text('Weightlifting'),
          leading: ClipRRect(
            borderRadius: BorderRadius.all(Radius.elliptical(15, 15)),
            child: Image.asset('assets/images/RopeSwings.png'),
          ),
          subtitle: Text(
            '5 Exercises - 1hr 10min',
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
}
