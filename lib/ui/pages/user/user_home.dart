import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:test1/ui/pages/user/cart/cart_screen.dart';
import 'package:test1/ui/pages/user/main_page.dart';
import 'package:test1/ui/pages/user/navbar_key.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget _dailyOffers(@required String offersimage, @required Color color,
      @required String title, @required String subtitle) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.0),
      padding: EdgeInsets.only(
        left: 20.0,
      ),
      height: 120.0,
      width: 240.0,
      decoration: BoxDecoration(
          color: color, borderRadius: BorderRadius.circular(15.0)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 80.0,
                  height: 80.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    image: DecorationImage(
                        image: AssetImage(offersimage), fit: BoxFit.cover),
                  ),
                ),
              ]),
          Padding(
            padding: EdgeInsets.only(top: 23.0, left: 20.0),
            child: Column(
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 22.0,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Text(
                  subtitle,
                  style: TextStyle(
                      fontSize: 26.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w700),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _optionsYouNeed(@required int pageIndex, @required String optionimage,
      @required String name) {
    return Container(
      child: GestureDetector(
          child: Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 45.0,
                  decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage(optionimage))),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Text(
                  name,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          onTap: () {
            setState(() {
              final CurvedNavigationBarState? navState =
                  Navkey.navKey1.currentState as CurvedNavigationBarState?;
              navState?.setPage(pageIndex);
            });
          }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: Container(
          height: 800.0,
          width: double.infinity,
          decoration: BoxDecoration(
              color: Color(0xfff9fafb),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0),
              )),
          child: ListView(
            children: [
              Padding(
                  padding: EdgeInsets.only(left: 30, top: 30.0),
                  child: Text(
                    "Daily Offers",
                    style: TextStyle(
                        fontSize: 19.0,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        color: Colors.black87),
                  )),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: EdgeInsets.only(left: 30.0, top: 30.0),
                  child: Row(
                    children: [
                      _dailyOffers("images/f.png",
                          Theme.of(context).primaryColor, "Parippu", "20%"),
                      _dailyOffers("images/g.png",
                          Theme.of(context).primaryColor, "Ala", "10%"),
                      _dailyOffers("images/t.png",
                          Theme.of(context).primaryColor, "Luunu", "5%"),
                      _dailyOffers("images/profile.png",
                          Theme.of(context).primaryColor, "Malu", "3%"),
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Oprtions You Need",
                      style: TextStyle(
                        fontSize: 19.0,
                        color: Colors.black87,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20.0),
                      child: Container(
                        height: 300.0,
                        child: GridView.count(
                          crossAxisCount: 2,
                          crossAxisSpacing: 15,
                          mainAxisSpacing: 15,
                          childAspectRatio: 1.30,
                          children: [
                            _optionsYouNeed(0, 'images/productlocations.png',
                                'Product Locations'),
                            _optionsYouNeed(
                                1, 'images/shoppinglist.png', 'Shopping List'),
                            _optionsYouNeed(
                                3, 'images/shoppingcart.png', 'Shopping Cart'),
                            _optionsYouNeed(
                                4, 'images/myreceipts.png', 'My Receipts'),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
