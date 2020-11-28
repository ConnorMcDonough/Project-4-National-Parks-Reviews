import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../authentication_service.dart';

class LogOutPage extends StatelessWidget {
  LogOutPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
          title: const Text(
            'Logout',
          ),
        ),
        body: Center(
          child: Container(
            width: 500,
            height: 100,
            //margin: EdgeInsets.only(top: 10),
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Text(
                "LOGOUT",
                style: new TextStyle(
                  color: Colors.black,
                  fontSize: 40.0,
                ),
              ),
              color: Colors.red[800],
              onPressed: () {
                context.read<AuthenticationService>().signOut();
                Navigator.pop(context);
              },
            ),
          ),
        ));
  }
}
