import 'package:awesome_emojis/emojis.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:line_icons/line_icons.dart';
import 'package:openfoodfacts/model/parameter/SearchTerms.dart';
import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:openfoodfacts/utils/QueryType.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:workify/repositories/auth_repository.dart';
import 'package:workify/theme/theme.dart';
import 'package:workify/views/mealPlan_View/children_Views/productScanner_View.dart';

class AddProductView extends ConsumerWidget {
  const AddProductView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    var currentUser = context.read(authRepositoryProvider).getCurrentUser();

    TextEditingController searchController = new TextEditingController();
    String productSearchTerm = '';

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

    var productsAdded;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            Navigator.push(context, MaterialPageRoute(builder: (context) => QRCodeScanner())),
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
            Text('Products Added '),
            SizedBox(height: 10),
            // Expanded(
            //     child: Center(
            //   child: productCatalog.when(
            //     data: (data) => Text(data.toString()),
            //     loading: () => CircularProgressIndicator(),
            //     error: (e, st) => Text('error $e'),
            //   ),
            // )),
            GestureDetector(
              onTap: () {
                print('start');
                productsAdded.forEach((e) async {
                  int getWeekNumber({day: int}) {
                    if (day >= 1 && day <= 7) {
                      return 1;
                    } else if (day >= 8 && day <= 15) {
                      return 2;
                    } else if (day >= 16 && day <= 23) {
                      return 3;
                    } else if (day >= 24 && day <= 31) {
                      return 4;
                    } else {
                      return 1;
                    }
                  }

                  Map<String, dynamic> structuredProductMap = {};
                  structuredProductMap.addAll(e.nutriments!.toData());
                  structuredProductMap.addAll(e.toData());
                  var newEntries = {'dateTimeSubmitted': DateTime.now()};
                  structuredProductMap.addEntries(newEntries.entries);

                  await FirebaseFirestore.instance
                      .collection('UserInfo')
                      .doc(currentUser!.uid)
                      .collection('UserEvents')
                      .doc('AddMealEvent')
                      .collection(
                          'Y${DateTime.now().year}-M${DateTime.now().month}-D${DateTime.now().day}')
                      .doc()
                      .set(structuredProductMap);

                  await FirebaseFirestore.instance
                      .collection('UserInfo')
                      .doc(currentUser.uid)
                      .collection('UserEvents')
                      .doc('AddMealEvent')
                      .collection(
                          'Y${DateTime.now().year}-M${DateTime.now().month}-W${getWeekNumber(day: DateTime.now().day.toInt())}')
                      .doc()
                      .set(structuredProductMap);

                  await FirebaseFirestore.instance
                      .collection('UserInfo')
                      .doc(currentUser.uid)
                      .collection('UserEvents')
                      .doc('AddMealEvent')
                      .collection('Y${DateTime.now().year}-M${DateTime.now().month}')
                      .doc()
                      .set(structuredProductMap);
                });
                print('end');
              },
              child: Container(
                height: 80,
                width: double.infinity,
                decoration: BoxDecoration(color: Apptheme.mainButonColor),
                child: Center(
                  child: Text(
                    'Add to meal plan',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
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
                onChanged: (searchValue) {},
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
                      itemCount:
                          searchResult.pageSize! < 25 ? searchResult.count : searchResult.pageSize,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Apptheme.mainCardColor,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: GestureDetector(
                              onTap: () {},
                              child: searchResult.products![index].productName != null
                                  ? productListTile(product: searchResult.products![index])
                                  : Text(''),
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
}

class productListTile extends StatelessWidget {
  const productListTile({Key? key, required this.product}) : super(key: key);
  final Product product;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: product.imageFrontSmallUrl == null
          ? Center(
              child: Text('?'),
            )
          : AspectRatio(
              aspectRatio: 5.0 / 9.0,
              child: Image(
                fit: BoxFit.cover,
                image: NetworkImage(
                  product.imageFrontSmallUrl.toString(),
                ),
              ),
            ),
      title: Text(
        product.productName != null ? '${product.productName}' : '?',
        style: TextStyle(color: Colors.black),
      ),
      subtitle: Row(
        children: [
          productStatsTab(
            value: product.nutriments!.energyServing != null
                ? (product.nutriments!.energyServing! / 4.2).round()
                : product.nutriments!.energyKcal100g != null
                    ? '${product.nutriments!.energyKcal100g!.round()}'
                    : '?',
            valueIndicator: '${Emojis.fire}',
          ),
          productStatsTab(
            value: product.nutriments!.energyServing != null
                ? product.nutriments!.proteinsServing!.round()
                : product.nutriments!.proteins != null
                    ? '${product.nutriments!.proteins!.round()}'
                    : '?',
            valueIndicator: '${Emojis.flexedBiceps}',
          ),
          productStatsTab(
            value: product.nutriscore != null ? '${product.nutriscore!.toUpperCase()}' : '?',
            valueIndicator: '${Emojis.redHeart}',
          ),
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
        label: Text(value != 'null' ? '$value' : '?'),
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
