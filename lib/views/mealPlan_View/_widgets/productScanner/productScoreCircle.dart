import 'package:flutter/material.dart';

class ProductScoreCircle extends StatelessWidget {
  final String score;
  final String scoreTitle;
  final Color color;
  const ProductScoreCircle(
      {Key? key, required this.score, required this.scoreTitle, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          maxRadius: 30,
          backgroundColor: color,
          child: score == null
              ? Text(
                  '?',
                  style: TextStyle(color: Colors.white),
                )
              : Text(
                  '${score}',
                  textScaleFactor: score.toString().length > 4 ? .8 : 1,
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
        ),
        SizedBox(height: 5),
        RichText(
          textAlign: TextAlign.center,
          maxLines: 2,
          softWrap: true,
          textScaleFactor: .8,
          text: TextSpan(
            text: '$scoreTitle',
            style: TextStyle(color: Colors.black),
            children: <TextSpan>[],
          ),
        ),
      ],
    );
  }
}
