import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:workify/providers/themeProvider.dart';
import 'package:workify/views/home/forYouTab.dart';

class HomeView extends StatefulWidget {
  static const List<Tab> tabs = <Tab>[
    Tab(text: 'Zeroth'),
    Tab(text: 'First'),
    Tab(text: 'Second'),
  ];

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with SingleTickerProviderStateMixin {
  TabController? _tabController;
  @override
  void initState() {
    // initialise your tab controller here
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;
    double _screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: ThemeProvider.primaryBackgroundColor,
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.timer), label: 'Workouts'),
          BottomNavigationBarItem(icon: Icon(Icons.equalizer), label: 'Analytics'),
          BottomNavigationBarItem(icon: Icon(Icons.menu_book), label: 'Meals'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Trainers'),
        ],
        selectedItemColor: ThemeProvider.primaryAccentRed,
        backgroundColor: ThemeProvider.primaryAppBarBackground,
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: ThemeProvider.primaryIconColor,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 30, 10, 0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'News Feed',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    textScaleFactor: 2,
                  ),
                  Icon(Icons.search, color: Colors.white),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, -0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: TabBar(
                    tabs: [
                      Text('For you'),
                      Text('Global'),
                      Text('Plan'),
                    ],
                    controller: _tabController,
                    labelColor: Colors.white,
                    isScrollable: true,
                    labelPadding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                    indicatorColor: ThemeProvider.primaryAccentRed,
                    indicatorPadding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                  ),
                ),
              ),
              SizedBox(width: _screenWidth, height: 1, child: Container(color: ThemeProvider.secondaryTextColor)),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: TabBarView(
                  physics: AlwaysScrollableScrollPhysics(),
                  controller: _tabController,
                  children: [
                    ForYouTab(),
                    Text('22222', style: TextStyle(color: Colors.white)),
                    Text('33333', style: TextStyle(color: Colors.white)),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
