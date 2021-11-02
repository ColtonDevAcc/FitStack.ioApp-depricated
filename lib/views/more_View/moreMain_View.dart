import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import '../../theme/theme.dart';
import '_widgets/children_Views/profile_Widget.dart';
import '_widgets/extraTab_Widget.dart';
import '_widgets/featuredStatistics_Widget.dart';

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
      body: Scrollbar(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Column(
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
                ),
                ExtraTab_Widget(title: 'memberships', icon: LineIcons.crown),
                ExtraTab_Widget(title: 'settings', icon: LineIcons.cog),
                ExtraTab_Widget(title: 'groups', icon: Icons.groups_outlined),
                ExtraTab_Widget(title: 'messages', icon: LineIcons.envelope),
                ExtraTab_Widget(title: 'ads', icon: LineIcons.ad),
                ExtraTab_Widget(title: 'accessibility', icon: LineIcons.accessibleIcon),
                ExtraTab_Widget(title: 'shop', icon: LineIcons.shoppingBag),
                ExtraTab_Widget(title: 'social', icon: LineIcons.userFriends),
                ExtraTab_Widget(title: 'help', icon: LineIcons.helpingHands),
                ExtraTab_Widget(title: 'sync', icon: LineIcons.syncIcon),
                SizedBox(height: 100)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
