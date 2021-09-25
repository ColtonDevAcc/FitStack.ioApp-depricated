import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:workify/theme/theme.dart';
import 'package:workify/views/more_View/_widgets/children_Views/profile_Widget.dart';
import 'package:workify/views/more_View/_widgets/featuredStatistics_Widget.dart';

class More_View extends StatefulWidget {
  const More_View({Key? key}) : super(key: key);

  @override
  _More_ViewState createState() => _More_ViewState();
}

class _More_ViewState extends State<More_View> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Apptheme.mainBackgroundColor,
      body: Column(
        children: [
          SizedBox(height: AppBar().preferredSize.height),
          Profile_Widget(),
          Row(
            children: [
              Expanded(
                child: FeaturedStatistics_Widget(),
              ),
              Expanded(
                child: FeaturedStatistics_Widget(),
              ),
            ],
          )
        ],
      ),
    );
  }
}
