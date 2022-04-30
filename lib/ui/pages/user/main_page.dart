import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:test1/ui/pages/user/cart/cart_screen.dart';
import 'package:test1/ui/pages/user/my_account.dart';
import 'package:test1/ui/pages/user/navbar_key.dart';
import 'package:test1/ui/pages/user/product_search.dart';
import 'package:test1/ui/pages/user/shpping_list.dart';
import 'package:test1/ui/pages/user/user_home.dart';
import 'package:test1/utils/auth_healper.dart';

import 'my_bills.dart';

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int index = 2;
  // final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  final screens = [
    ShoppingListPage(),
    SearchPage(),
    HomePage(),
    CartScreen(),
    AccountPage(),
  ];

  @override
  Widget build(BuildContext context) {
    final items = <Widget>[
      Icon(
        Icons.search_sharp,
        size: 30,
      ),
      Icon(
        Icons.list_alt,
        size: 30,
      ),
      Icon(
        Icons.home,
        size: 30,
      ),
      Icon(
        Icons.add_shopping_cart_outlined,
        size: 30,
      ),
      Icon(
        Icons.receipt_long,
        size: 30,
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        toolbarHeight: 70.0,
        title: Image.asset(
          "images/logo111.png",
          height: 99.0,
          width: 160.0,
        ),
        actions: [
          IconButton(
            onPressed: () {
              AuthHealper.logOut();
            },
            icon: Icon(Icons.exit_to_app),
          ),
        ],
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          iconTheme: IconThemeData(color: Colors.black),
        ),
        child: CurvedNavigationBar(
            color: Theme.of(context).primaryColor,
            backgroundColor: Colors.transparent,
            height: 60.0,
            index: index,
            items: items,
            key: Navkey.navKey1,
            onTap: (index) => setState(() => this.index = index),
            animationCurve: Curves.easeOutQuint),
      ),
      body: screens[index],
    );
  }
}
