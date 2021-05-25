import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ForYouView extends StatelessWidget {
  final String? title;
  final Color? color;
  final String? substring;
  final Image? image;

  const ForYouView({Key? key, this.title, this.color, this.substring, this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
    );
  }
}
