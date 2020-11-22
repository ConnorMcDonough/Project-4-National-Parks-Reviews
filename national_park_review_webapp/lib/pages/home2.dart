
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../authentication_service.dart';

class Home extends StatelessWidget {
  final DatabaseReference = FirebaseDatabase.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;

  static String firstName;
  static String lastName;
  static String email;
  static bool isNewAccount = false;
  static String companyName;
  static String welcomeMsg = "Welcome back";

  final firestoreInstance = FirebaseFirestore.instance;

  Home();

  @override
  Widget build(BuildContext context) {
    final User user = auth.currentUser;
    final uid = user.uid;
    final ref = DatabaseReference.reference();

    return WillPopScope(
      onWillPop: () async => false,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.blue,
          body: SingleChildScrollView(
            child: Container(
              margin:
                  EdgeInsets.only(top: MediaQuery.of(context).size.height / 8),
              child: Column(
                children: [
                  Container(
                    width: 500,
                    height: 100,
                    //margin: EdgeInsets.only(top: 10),
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Text(
                        "CHECK-UP",
                        style: new TextStyle(
                          color: Colors.white,
                          fontSize: 40.0,
                        ),
                      ),
                      color: Colors.grey[850],
                      onPressed: () {
                      },
                    ),
                  ),
                  Container(
                    width: 500,
                    height: 100,
                    //margin: EdgeInsets.only(top: 10),
                    padding: EdgeInsets.only(top: 20),
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),

                      ),
                      child: Text(
                        "Assign Admin Preferences",
                        style: new TextStyle(
                          color: Colors.white,
                          fontSize: 40.0,
                        ),
                      ),
                      color: Colors.grey[850],
                      onPressed: () {
                      },
                    ),
                  ),
                  Container(
                    width: 500,
                    height: 100,
                    //margin: EdgeInsets.only(top: 10),
                    padding: EdgeInsets.only(top: 20),
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),

                      ),
                      child: Text(
                        "Check Database",
                        style: new TextStyle(
                          color: Colors.white,
                          fontSize: 40.0,
                        ),
                      ),
                      color: Colors.grey[850],
                      onPressed: () {
                      },
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: RaisedButton(

                            child: Text(
                              "SIGN OUT",
                              style: new TextStyle(
                                fontSize: 14.0,
                                color: Colors.white,
                              ),
                            ),
                            color: Colors.grey[700],
                            onPressed: () {
                              context.read<AuthenticationService>().signOut();
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

