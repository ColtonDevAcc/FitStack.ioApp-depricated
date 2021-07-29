import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:openfoodfacts/model/SearchResult.dart';
import 'package:openfoodfacts/model/parameter/SearchTerms.dart';
import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:workify/theme/theme.dart';

class CreateMealPlanView extends StatelessWidget {
  const CreateMealPlanView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = new TextEditingController();

    List<Parameter> productSearchParameters = <Parameter>[
      PageSize(size: 10),
      SearchTerms(terms: [searchController.text]),
      const SortBy(option: SortOption.PRODUCT_NAME),
    ];

    SearchResult searchResult = SearchResult();

    GetSearchResult() async {
      searchResult = await OpenFoodAPIClient.searchProducts(
        User(userId: 'cbristow99@gmail.com', password: 'Colton99'),
        ProductSearchQueryConfiguration(
          parametersList: productSearchParameters,
          fields: [ProductField.ALL],
        ),
      );
    }

    return Scaffold(
      backgroundColor: Apptheme.mainBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'CREATE UPLOAD',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(LineIcons.arrowLeft, color: Colors.black),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
            child: Row(
              children: [
                Text(
                  'Upload',
                  style: TextStyle(
                    color: Apptheme.mainButonColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 2),
                Icon(LineIcons.upload, color: Apptheme.mainButonColor),
              ],
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
            child: TextField(
              cursorColor: Colors.grey,
              decoration: InputDecoration(
                hintText: 'Add Meal Name',
                fillColor: Colors.grey,
                border: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: TextField(
              style: TextStyle(color: Colors.black),
              cursorColor: Colors.black,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(10),
                ),
                prefixIcon: Icon(
                  LineIcons.search,
                  color: Apptheme.mainButonColor,
                ),
                labelText: 'Search',
                labelStyle: TextStyle(color: Colors.black),
                focusColor: Apptheme.mainCardColor,
                fillColor: Apptheme.mainCardColor,
                filled: true,
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          Container(
            height: 300,
            child: FutureBuilder(
              future: GetSearchResult(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.none &&
                    snapshot.hasData == null) {
                  //print('project snapshot data is: ${projectSnap.data}');
                  return Text(
                    'NULL',
                    style: TextStyle(color: Colors.black),
                  );
                }
                return ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Column(
                      children: <Widget>[
                        Text(
                          searchResult.products![index].productName
                                      .toString() ==
                                  'null'
                              ? 'empty'
                              : 'notEmpty',
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

productTab({name: String}) {
  return ListTile();
}
