import 'package:fitstack/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class AddExcersizeInformation_View extends StatelessWidget {
  const AddExcersizeInformation_View({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          TextFormField(
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(
              label: Text('Title*'),
              suffixIcon: Icon(Icons.title_outlined),
            ),
          ),
          Row(
            children: [
              Expanded(
                flex: 2,
                child: TextFormField(
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    hintText: 'tag1, tag2, tag3',
                    label: Text('Tags'),
                    suffixIcon: Icon(LineIcons.tags),
                  ),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                flex: 1,
                child: TextFormField(
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    label: Text('Reps*'),
                  ),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                flex: 1,
                child: TextFormField(
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    label: Text('Sets*'),
                  ),
                ),
              ),
            ],
          ),
          TextFormField(
            style: TextStyle(color: Colors.black),
            textInputAction: TextInputAction.newline,
            keyboardType: TextInputType.multiline,
            maxLines: 3,
            decoration: InputDecoration(
              label: Text('Description'),
              suffixIcon: Icon(Icons.description_outlined),
              focusColor: Apptheme.mainButonColor,
            ),
          ),
        ],
      ),
    );
  }
}
