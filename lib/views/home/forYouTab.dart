import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:workify/views/home/forYouView.dart';

class ForYouTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    double _screenWidth = MediaQuery.of(context).size.width;
    // ignore: unused_local_variable
    double _screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: ListView(
        children: [
          verticleCard(image: Image.asset('assets/images/dumbell.png', fit: BoxFit.cover), context: context),
          verticleCard(image: Image.asset('assets/images/gymGirl.png', fit: BoxFit.cover), context: context),
          verticleCard(image: Image.asset('assets/images/dumbell.png', fit: BoxFit.cover), context: context),
          verticleCard(image: Image.asset('assets/images/gymGirl.png', fit: BoxFit.cover), context: context),
          verticleCard(image: Image.asset('assets/images/dumbell.png', fit: BoxFit.cover), context: context),
          verticleCard(image: Image.asset('assets/images/gymGirl.png', fit: BoxFit.cover), context: context),
        ],
      ),
    );
  }
}

Padding verticleCard({image: Image, context: BuildContext}) {
  return Padding(
    padding: EdgeInsets.all(5),
    child: GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => ForYouView()));
      },
      child: Container(
        height: 200,
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          child: Stack(
            alignment: Alignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Container(
                  child: image,
                  width: 400,
                ),
              ),
              ListTile(
                title: Text('asdfasdf', style: TextStyle(color: Colors.white)),
                trailing: Icon(Icons.arrow_forward_ios, color: Colors.white),
                subtitle: Text('asdfffffffffff', style: TextStyle(color: Colors.white)),
              )
            ],
          ),
        ),
      ),
    ),
  );
}
