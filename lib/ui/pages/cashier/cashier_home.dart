import 'package:flutter/material.dart';
import 'package:test1/utils/auth_healper.dart';

class CashierHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
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
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // StreamBuilder(
              //   stream: stream,
              //   initialData: initialData,
              //   builder: (BuildContext context, AsyncSnapshot snapshot) {
              //     return Container(
              //       child: child,
              //     );
              //   },
              // ),
            ],
          ),
        ));
  }
}
