import 'dart:html';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../authentication_service.dart';

class Signin {
  static TextEditingController emailController = TextEditingController();
  static TextEditingController passwordController = TextEditingController();
  static openPopup(context) {
    Alert(
        context: context,
        title: "LOGIN",
        content: Column(
          children: <Widget>[
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                icon: Icon(Icons.account_circle),
                labelText: 'Email',
              ),
            ),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                icon: Icon(Icons.lock),
                labelText: 'Password',
              ),
            ),
            RaisedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    try {
                      context.read<AuthenticationService>().signIn(
                            email: emailController.text.trim(),
                            password: passwordController.text.trim(),
                          );
                    } on FirebaseAuthException catch (e) {
                      e.message;
                    }
                  },
                  child: Text("Sign in"),
                )
          ],
        ),
        buttons: [
          DialogButton(
            onPressed: () {
              print(emailController.text.trim());
              print(passwordController.text.trim());
              context.read<AuthenticationService>().signIn(
                    email: emailController.text.trim(),
                    password: passwordController.text.trim(),
                  );
              Navigator.pop(context);
            },
            child: Text(
              "LOGIN",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          )
        ]).show();
  }
}
