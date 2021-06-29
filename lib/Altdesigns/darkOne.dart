import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class DarkOne extends StatelessWidget {
  const DarkOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
//rgb(20, 26, 47)
    return Scaffold(
      body: Row(
        children: [
          Container(
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
                  SizedBox(height: size.height * .2),
                  Container(
                    decoration: BoxDecoration(border: Rectangular),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Icon(LineIcons.dumbbell,
                          color: Color.fromRGBO(106, 113, 138, 1)),
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            height: size.height,
            width: size.width * .7,
            color: Color.fromRGBO(20, 26, 47, 1),
            child: Column(),
          ),
        ],
      ),
    );
  }
}
