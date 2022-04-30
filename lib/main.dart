import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import './palette/palette.dart';

import 'ui/pages/auth/login.dart';
import 'ui/pages/user/main_page.dart';
import 'ui/pages/splash.dart';
import 'ui/pages/admin/admin_home.dart';
import 'ui/pages/cashier/cashier_home.dart';
import 'utils/auth_healper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // primarySwatch: const Color(0xFFFA8900),
        primarySwatch: Palette.kToDark,
        inputDecorationTheme: InputDecorationTheme(
            contentPadding: const EdgeInsets.all(
              16.0,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4.0),
            )),
      ),
      home: AnimatedSplashScreen(
          splash: Container(
              height: 150.0,
              width: 150.0,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("images/logo111.png")))),
          backgroundColor: Color(0xfffa8900),
          duration: 2500,
          splashTransition: SplashTransition.scaleTransition,
          nextScreen: MainScreen()),
    );
  }
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data != null) {
            UserHelper.saveUser(snapshot.data!);
            return StreamBuilder<DocumentSnapshot>(
              stream: FirebaseFirestore.instance
                  .collection("users")
                  .doc(snapshot.data!.uid)
                  .snapshots(),
              // initialData: initialData,
              builder: (BuildContext context,
                  AsyncSnapshot<DocumentSnapshot> snapshot) {
                if (snapshot.hasData && snapshot.data != null) {
                  final user = (snapshot.data!.data() as Map<String, dynamic>);
                  if (user['role'] == 'admin') {
                    return AdminHomePage();
                  } else if (user['role'] == 'cashier') {
                    return CashierHomePage();
                  } else {
                    return MainPage();
                  }
                } else {
                  return Material(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
              },
            );
          }

          return LoginPage();
        });
  }
}
