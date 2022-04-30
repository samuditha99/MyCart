import 'package:flutter/material.dart';

import '../../main.dart';

class SplashPage extends StatefulWidget {
  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _navigatetologin();
  }

  _navigatetologin() async {
    await Future.delayed(Duration(milliseconds: 2000), () {});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => MainScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Theme.of(context).primaryColor,
        child: SafeArea(
            child: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // CircularProgressIndicator(
              //   backgroundColor: Colors.white,
              // ),
              // Text(
              //   'Loading',
              //   style: TextStyle(
              //       color: Colors.white,
              //       fontWeight: FontWeight.w400,
              //       fontSize: 18.0,
              //       fontFamily: 'Poppins'),
              // ),

              Container(
                  height: 150.0,
                  width: 150.0,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("images/logo111.png")))),
            ],
          ),
        )),
      ),
    );
  }
}
