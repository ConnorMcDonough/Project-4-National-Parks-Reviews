import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../authentication_service.dart';

class SignInPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  SignInPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        title: const Text(
          'Sign in',
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(
              top: 20,
              left: MediaQuery.of(context).size.width / 4,
              right: MediaQuery.of(context).size.width / 4),
          child: Column(
            children: [
              Icon(
                Icons.terrain_sharp,
                size: 90,
              ),
              TextField(
                controller: emailController,
                enableSuggestions: false,
                autocorrect: false,
                decoration: InputDecoration(
                  icon: Icon(Icons.account_circle),
                  labelText: "Email",
                ),
              ),
              TextField(
                controller: passwordController,
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
                decoration: InputDecoration(
                  icon: Icon(Icons.lock),
                  labelText: "Password",
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 30),
                child: RaisedButton(
                  onPressed: () {
                    try {
                      context.read<AuthenticationService>().signIn(
                            email: emailController.text.trim(),
                            password: passwordController.text.trim(),
                          );
                      Navigator.pop(context);
                    } on FirebaseAuthException catch (e) {
                      e.message;
                    }
                  },
                  child: Text("Sign in"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
