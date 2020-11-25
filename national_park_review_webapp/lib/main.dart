import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:national_park_review_webapp/pages/home.dart';
import 'package:national_park_review_webapp/pages/home2.dart';
import 'package:provider/provider.dart';

import 'authentication_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthenticationService>(
          create: (_) => AuthenticationService(FirebaseAuth.instance),
        ),
        StreamProvider(
          create: (context) =>
              context.read<AuthenticationService>().authStateChanges,
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "National Park Reviews",
        theme: ThemeData(
          primaryColor: Colors.black,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: AuthenticationWrapper(),
      ),
    );
  }
}

class AuthenticationWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("AuthenticationWrapper called!");
    final firebaseuser = context.watch<User>();

    /*if (firebaseuser != null) {
      print("Logged in!");
      return Home();
    }
    ;*/
    return MyHomePage();
  }
}
