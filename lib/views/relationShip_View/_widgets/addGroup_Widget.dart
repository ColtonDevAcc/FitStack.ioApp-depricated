import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:workify/theme/theme.dart';

class AddGroup_Widget extends StatelessWidget {
  const AddGroup_Widget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    // ignore: unused_local_variable
    String searchValue = '';

    return StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        return Container(
          height: 400,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Container(
                  child: TextField(
                    onChanged: (value) {
                      setState(() {
                        searchValue = value;
                      });
                    },
                    style: TextStyle(color: Colors.black),
                    controller: searchController,
                    decoration: InputDecoration(
                      fillColor: Apptheme.mainCardColor,
                      hintText: 'Enter a name for this group',
                      prefixIcon: Icon(
                        searchValue != '' ? LineIcons.times : LineIcons.pushed,
                        color: Apptheme.mainButonColor,
                      ),
                      icon: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          LineIcons.times,
                          color: Apptheme.mainButonColor,
                        ),
                      ),
                      filled: true,
                      labelStyle: TextStyle(color: Colors.black),
                      focusColor: Apptheme.mainCardColor,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Apptheme.mainCardColor),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Apptheme.mainCardColor),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text(searchValue),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
