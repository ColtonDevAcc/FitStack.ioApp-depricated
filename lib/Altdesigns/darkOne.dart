import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class DarkOne extends StatefulWidget {
  const DarkOne({Key? key}) : super(key: key);

  @override
  _DarkOneState createState() => _DarkOneState();
}

class _DarkOneState extends State<DarkOne> {
  int indexSelected = 1;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              color: Color.fromRGBO(33, 40, 67, 1),
              width: size.width * .3,
              height: size.height,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(LineIcons.bars, color: Colors.white),
                    Spacer(flex: 3),
                    sideButtons(
                        icon: LineIcons.dumbbell,
                        index: 1,
                        indexSelected: indexSelected,
                        onTap: () {
                          setState(() {
                            indexSelected = 1;
                            print('1');
                          });
                        }),
                    Spacer(flex: 1),
                    sideButtons(
                        icon: LineIcons.utensils,
                        index: 2,
                        indexSelected: indexSelected,
                        onTap: () {
                          setState(() {
                            indexSelected = 2;
                          });
                        }),
                    Spacer(flex: 1),
                    sideButtons(
                        icon: Icons.watch,
                        index: 3,
                        indexSelected: indexSelected,
                        onTap: () {
                          setState(() {
                            indexSelected = 3;
                          });
                        }),
                    Spacer(flex: 1),
                    sideButtons(
                        icon: LineIcons.lightningBolt,
                        index: 4,
                        indexSelected: indexSelected,
                        onTap: () {
                          setState(() {
                            indexSelected = 4;
                          });
                        }),
                    Spacer(flex: 1),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                      child: RotatedBox(
                        child: Text(
                          'Statatistics',
                          style:
                              TextStyle(color: Color.fromRGBO(86, 93, 121, 1)),
                        ),
                        quarterTurns: 3,
                      ),
                    ),
                    Spacer(flex: 1),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                      child: RotatedBox(
                        child: Text(
                          'OverView',
                          style:
                              TextStyle(color: Color.fromRGBO(86, 93, 121, 1)),
                        ),
                        quarterTurns: 3,
                      ),
                    ),
                    Spacer(flex: 1),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              height: size.height,
              width: size.width * .7,
              color: Color.fromRGBO(20, 26, 47, 1),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Icon(LineIcons.userCircle, color: Colors.white),
                  ),
                  Spacer(flex: 3),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 30, 10, 0),
                    child: Container(
                      child: Image(
                        fit: BoxFit.fill,
                        image: AssetImage('assets/images/DailyWorkout.png'),
                      ),
                    ),
                  ),
                  Spacer(flex: 1),
                  SizedBox(),
                  Spacer(flex: 2),
                  Container(
                    height: 200,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      children: [
                        SizedBox(width: 65),
                        listViewCards(),
                        listViewCards(),
                        listViewCards(),
                        listViewCards(),
                      ],
                    ),
                  ),
                  Spacer(flex: 1)
                ],
              ),
            ),
          ),
          Positioned(
            left: 40,
            top: 80,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hello \$user',
                  textScaleFactor: 2.5,
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  'random text random text random text',
                  textScaleFactor: 1.3,
                  style: TextStyle(color: Colors.white.withOpacity(.6)),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

GestureDetector sideButtons(
    {index: int, indexSelected: int, onTap: Function, icon: IconData}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      decoration: BoxDecoration(
        color: index == indexSelected
            // ignore: dead_code
            ? Color.fromRGBO(251, 137, 107, 1)
            : Color.fromRGBO(44, 52, 88, 1),
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Icon(
          icon,
          color: index == indexSelected
              // ignore: dead_code
              ? Color.fromRGBO(230, 230, 230, 1)
              : Color.fromRGBO(86, 93, 121, 1),
        ),
      ),
    ),
  );
}

Padding listViewCards() {
  return Padding(
    padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
    child: Container(
      width: 128,
      decoration: BoxDecoration(
        color: Color.fromRGBO(37, 44, 76, 1),
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
    ),
  );
}
