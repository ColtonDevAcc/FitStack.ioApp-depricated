import 'package:awesome_emojis/emojis.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:openfoodfacts/model/SearchResult.dart';
import 'package:openfoodfacts/model/parameter/SearchTerms.dart';
import 'package:openfoodfacts/model/parameter/TagFilter.dart';
import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:openfoodfacts/utils/QueryType.dart';
import 'package:workify/theme/theme.dart';

class CreateMealPlanView extends StatefulWidget {
  const CreateMealPlanView({Key? key}) : super(key: key);

  @override
  _CreateMealPlanViewState createState() => _CreateMealPlanViewState();
}

class _CreateMealPlanViewState extends State<CreateMealPlanView> {
  TextEditingController searchController = new TextEditingController();

  String productSearchTerm = '';

  @override
  Widget build(BuildContext context) {
    List<Parameter> productSearchParameters = <Parameter>[
      SearchTerms(terms: [productSearchTerm]),
      const SortBy(option: SortOption.POPULARITY),
      const PageSize(size: 50),
      TagFilter(
        tagType: 'countries',
        contains: true,
        tagName: 'united_states',
      ),
    ];

    SearchResult searchResult = SearchResult();

    GetSearchResult() async {
      searchResult = await OpenFoodAPIClient.searchProducts(
        User(userId: 'cbristow99@gmail.com', password: 'Colton99'),
        ProductSearchQueryConfiguration(
          language: OpenFoodFactsLanguage.ENGLISH,
          parametersList: productSearchParameters,
          fields: [
            ProductField.NUTRIMENT_DATA_PER,
            ProductField.NUTRIMENTS,
            ProductField.NAME,
            ProductField.BARCODE,
            ProductField.IMAGE_FRONT_SMALL_URL,
            ProductField.NUTRISCORE
          ],
        ),
        queryType: QueryType.PROD,
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
              onChanged: (searchValue) {
                setState(() {
                  productSearchTerm = searchValue;
                });
              },
              controller: searchController,
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
          Expanded(
            child: FutureBuilder(
              future: GetSearchResult(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  //print('project snapshot data is: ${projectSnap.data}');
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Loading: \"${snapshot.connectionState.toString()}\"',
                      style: TextStyle(color: Colors.black),
                    ),
                  );
                }
                return Scrollbar(
                  child: ListView.builder(
                    itemCount: searchResult.count! < 50
                        ? searchResult.count
                        : searchResult.pageSize,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Apptheme.mainCardColor,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: ListTile(
                            leading: searchResult
                                        .products![index].imageFrontSmallUrl ==
                                    null
                                ? Text('?')
                                : AspectRatio(
                                    aspectRatio: 5.0 / 9.0,
                                    child: Image(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                        searchResult
                                            .products![index].imageFrontSmallUrl
                                            .toString(),
                                      ),
                                    ),
                                  ),
                            title: Text(
                              searchResult.products![index].productName
                                  .toString(),
                              style: TextStyle(color: Colors.black),
                            ),
                            subtitle: Row(
                              children: [
                                productStatsTab(
                                    value: searchResult.products![index]
                                                .nutriments!.energyServing !=
                                            null
                                        ? (searchResult
                                                    .products![index]
                                                    .nutriments!
                                                    .energyServing! /
                                                4.2)
                                            .round()
                                        : 'null',
                                    valueIndicator: '${Emojis.fire}'),
                                productStatsTab(
                                    value: searchResult.products![index]
                                                .nutriments!.energyServing !=
                                            null
                                        ? searchResult.products![index]
                                            .nutriments!.proteinsServing!
                                            .round()
                                        : 'null',
                                    valueIndicator:
                                        '${Emojis.flexedBiceps}${Emojis.meatOnBone}'),
                                productStatsTab(
                                    value: searchResult
                                                .products![index].nutriscore !=
                                            null
                                        ? searchResult
                                            .products![index].nutriscore!
                                            .toUpperCase()
                                        : 'null',
                                    valueIndicator: '${Emojis.redHeart}'),
                                Text('per serving')
                              ],
                            ),
                            trailing: Icon(LineIcons.arrowRight),
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Padding productStatsTab({value: String, valueIndicator: String}) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 3, 0),
      child: Text(
        value == 'null'
            ? '${Emojis.noEntry}: N -'
            : '${valueIndicator}: ${value} ',
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
    );
  }
}

productTab({name: String}) {
  return ListTile();
}
