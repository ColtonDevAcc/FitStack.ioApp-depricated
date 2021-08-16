import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:workify/theme/theme.dart';

class ProductDetailsSmallCardList extends StatelessWidget {
  final List listQuerry;
  final String title;
  const ProductDetailsSmallCardList({Key? key, required this.listQuerry, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          listQuerry != null
              ? Container(
                  child: Wrap(
                    children: listQuerry
                        .map(
                          (item) => Padding(
                            padding: const EdgeInsets.fromLTRB(2, 2, 0, 0),
                            child: Container(
                              padding: EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Apptheme.secondaryAccent,
                              ),
                              child: Text(
                                '${item}',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        )
                        .toList()
                        .cast<Widget>(),
                  ),
                )
              : Text('No $title found'),
        ],
      ),
    );
  }
}
