import 'package:awesome_emojis/emojis.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:openfoodfacts/model/SearchResult.dart';
import 'package:openfoodfacts/model/parameter/SearchTerms.dart';
import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:openfoodfacts/utils/QueryType.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:workify/theme/theme.dart';
import 'package:workify/views/mealPlan/productOverview.dart';
import 'package:workify/views/mealPlan/qrCodeScanner.dart';

class CreateMealPlanView extends StatefulWidget {
  const CreateMealPlanView({Key? key}) : super(key: key);

  @override
  _CreateMealPlanViewState createState() => _CreateMealPlanViewState();
}

class _CreateMealPlanViewState extends State<CreateMealPlanView> {
  TextEditingController searchController = new TextEditingController();

  String productSearchTerm = '';

  static List<Product> productsAdded = [];

  @override
  Widget build(BuildContext context) {
    List<Parameter> productSearchParameters = <Parameter>[
      SearchTerms(terms: [productSearchTerm]),
      const SortBy(option: SortOption.POPULARITY),
      const PageSize(size: 25),
    ];

    SearchResult searchResult = SearchResult();

    GetSearchResult() async {
      searchResult = await OpenFoodAPIClient.searchProducts(
        User(userId: 'cbristow99@gmail.com', password: 'Colton99'),
        ProductSearchQueryConfiguration(
          language: OpenFoodFactsLanguage.ENGLISH,
          parametersList: productSearchParameters,
          fields: [
            ProductField.NUTRIMENTS,
            ProductField.NAME,
            ProductField.BARCODE,
            ProductField.IMAGE_FRONT_SMALL_URL,
            ProductField.NUTRISCORE,
            ProductField.SERVING_SIZE,
          ],
        ),
        queryType: QueryType.PROD,
      );
    }

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => QRCodeScanner())),
        backgroundColor: Apptheme.secondaryAccent,
        child: Icon(LineIcons.qrcode),
      ),
      backgroundColor: Apptheme.mainBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'ADD A MEAL',
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
      body: SlidingUpPanel(
        maxHeight: MediaQuery.of(context).size.height * .7,
        minHeight: AppBar().preferredSize.height + 10,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(18.0),
          topRight: Radius.circular(18.0),
        ),
        panel: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 100,
                    child: SizedBox(height: 5),
                    padding: const EdgeInsets.all(1),
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(.3),
                      borderRadius: BorderRadius.circular(24.0),
                      boxShadow: [BoxShadow(color: Color.fromRGBO(0, 0, 0, .25), blurRadius: 16.0)],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Text('Products Added ${productsAdded.length}'),
            SizedBox(height: 10),
            Expanded(
              child: ListView(
                children: productsAdded
                    .map(
                      (child) => Dismissible(
                        direction: DismissDirection.endToStart,
                        key: UniqueKey(),
                        child: productListTile(child),
                        secondaryBackground: Container(
                          color: Colors.red,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Spacer(flex: 6),
                              Text(
                                'Delete',
                                style: TextStyle(color: Colors.white),
                              ),
                              Spacer(flex: 1),
                            ],
                          ),
                        ),
                        background: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('Delete'),
                          ],
                        ),
                        onDismissed: (DismissDirection dismissDirection) {
                          setState(() {
                            productsAdded.remove(child);
                          });
                        },
                      ),
                    )
                    .toList()
                    .cast<Widget>(),
              ),
            )
          ],
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
              child: TextField(
                cursorColor: Colors.grey,
                decoration: InputDecoration(
                  hintText: 'Add Meal Name (NOT REQUIRED)',
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
                      itemCount: searchResult.count! < 50 ? searchResult.count : searchResult.pageSize,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Apptheme.mainCardColor,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  productsAdded.add(searchResult.products![index]);
                                });
                              },
                              child: productListTile(searchResult.products![index]),
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
      ),
    );
  }

  ListTile productListTile(Product searchResult) {
    return ListTile(
      leading: searchResult.imageFrontSmallUrl == null
          ? Text('?')
          : AspectRatio(
              aspectRatio: 5.0 / 9.0,
              child: Image(
                fit: BoxFit.cover,
                image: NetworkImage(
                  searchResult.imageFrontSmallUrl.toString(),
                ),
              ),
            ),
      title: Text(
        searchResult.productName.toString(),
        style: TextStyle(color: Colors.black),
      ),
      subtitle: Row(
        children: [
          productStatsTab(value: searchResult.nutriments!.energyServing != null ? (searchResult.nutriments!.energyServing! / 4.2).round() : 'null', valueIndicator: '${Emojis.fire}'),
          productStatsTab(value: searchResult.nutriments!.energyServing != null ? searchResult.nutriments!.proteinsServing!.round() : 'null', valueIndicator: '${Emojis.flexedBiceps}'),
          productStatsTab(value: searchResult.nutriscore != null ? searchResult.nutriscore!.toUpperCase() : 'null', valueIndicator: '${Emojis.redHeart}'),
        ],
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(LineIcons.plus),
        ],
      ),
    );
  }

  productStatsTab({value: String, valueIndicator: String}) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 3, 0),
      child: Chip(
        elevation: 3,
        avatar: Center(
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: Text(
              valueIndicator,
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
        label: Text(value != 'null' ? '$value' : 'n/a'),
        backgroundColor: Apptheme.mainCardColor,
        shape: StadiumBorder(
          side: BorderSide(
            width: 1,
            color: Colors.redAccent,
          ),
        ),
      ),
    );
  }
}

productTab({name: String}) {
  return ListTile();
}
