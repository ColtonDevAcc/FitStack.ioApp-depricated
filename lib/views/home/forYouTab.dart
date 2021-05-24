import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ForYouTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;
    double _screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
            child: Row(
              children: [
                Text(
                  'Recommended',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Container(
            width: _screenWidth,
            height: _screenHeight / 4.5,
            child: ListView(
              physics: ClampingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              children: [
                horizontalCard(),
                horizontalCard(),
                horizontalCard(),
              ],
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: Text(
                  'Sessions',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          verticleCard(),
          verticleCard(),
          verticleCard(),
          verticleCard(),
          verticleCard(),
          verticleCard(),
          verticleCard(),
          verticleCard()
        ],
      ),
    );
  }
}

Padding horizontalCard() {
  return Padding(
    padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
    child: Column(
      children: [
        Row(
          children: [
            Container(
              height: 150,
              width: 150,
              color: Colors.white,
            ),
          ],
        ),
        Row(
          children: [
            Text(
              'data',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
        Row(
          children: [
            Text(
              'data',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ],
    ),
  );
}

Padding verticleCard() {
  return Padding(
    padding: EdgeInsets.all(5),
    child: Container(
      height: 200,
      child: ListTile(
        tileColor: Colors.white,
      ),
    ),
  );
}
