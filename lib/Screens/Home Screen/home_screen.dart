import 'package:flutter/material.dart';
import 'package:sample_application/Screens/Home%20Screen/Pages/account_page.dart';
import 'package:sample_application/Screens/Home%20Screen/Pages/favorites_page.dart';
import 'package:sample_application/Screens/Home%20Screen/Pages/home_page.dart';
import 'package:sample_application/Screens/Home%20Screen/Pages/shopping_page.dart';
import 'package:sample_application/Widgets/common_widgets.dart';
import 'package:sample_application/Widgets/homescreen_widgets.dart';

ValueNotifier<int> pageIndex = ValueNotifier(0);

List<Widget> pages = [
  HomePage(),
  ShoppingPage(),
  favoritePage(),
  AccountPage(),
];

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: pageIndex,
        builder: (BuildContext context, int index, Widget? _) {
          return Scaffold(
            backgroundColor: Colors.grey.shade50,
            appBar: AppBar(
              backgroundColor: Colors.grey.shade50,
              elevation: 0,
              leading: Builder(builder: (context) {
                return IconButton(
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                    icon: Icon(Icons.sort, size: 30, color: Colors.grey));
              }),
              title: Row(children: [
                Icon(Icons.my_location, size: 20, color: Colors.red),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Dhaka, Bangladesh',
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                ),
              ]),
              actions: [
                CustomRoundButton(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: SizedBox(
                      width: 32,
                      height: 32,
                      child: Image.network(
                        'https://images.thrillophilia.com/image/upload/s--QbBBBqqB--/c_fill,g_auto/v1/attractions/images/000/002/549/original/7002229.jpg.jpg',
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                )
              ],
            ),
            drawer: Drawer(
              child: Container(
                  alignment: Alignment.center,
                  color: Colors.white,
                  child: Column(
                    children: [
                      Container(
                          alignment: Alignment.bottomCenter,
                          height: 200,
                          color: Colors.grey,
                          child: Text(
                            'Drawer',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize:26,
                              fontWeight:FontWeight.bold,
                            ),
                          )),
                    ],
                  )),
            ),
            body: pages[index],
            floatingActionButton: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              margin: EdgeInsets.only(left: 30),
              height: 70,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TabIcons(
                      icon: pageIndex.value == 0
                          ? Icons.home
                          : Icons.home_outlined,
                      index: 0,
                    ),
                    TabIcons(
                      icon: pageIndex.value == 1
                          ? Icons.shopping_bag
                          : Icons.shopping_bag_outlined,
                      index: 1,
                    ),
                    TabIcons(
                      icon: pageIndex.value == 2
                          ? Icons.favorite
                          : Icons.favorite_border,
                      index: 2,
                    ),
                    TabIcons(
                      icon: pageIndex.value == 3
                          ? Icons.person
                          : Icons.person_outline,
                      index: 3,
                    ),
                  ]),
            ),
          );
        });
  }
}
