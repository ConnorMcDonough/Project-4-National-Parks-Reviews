import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import '../authentication_service.dart';
import '../main.dart';

class SignUpPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SignUpPageState();
  }
}

class SignUpPageState extends State<SignUpPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController emailControllerRetype = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordControllerRetype =
      TextEditingController();

  String accountErrorMessage = "";
  SignUpPageState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        title: const Text(
          'Sign up',
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
                controller: emailControllerRetype,
                enableSuggestions: false,
                autocorrect: false,
                decoration: InputDecoration(
                  icon: Icon(Icons.account_circle),
                  labelText: "Retype Email",
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
              TextField(
                controller: passwordControllerRetype,
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
                decoration: InputDecoration(
                  icon: Icon(Icons.lock),
                  labelText: "Retype Password",
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 30),
                child: RaisedButton(
                  onPressed: () {
                    if (emailController.text != "" &&
                        emailController.text == emailControllerRetype.text &&
                        passwordController.text != "" &&
                        passwordController.text ==
                            passwordControllerRetype.text) {
                      //signs up
                      context.read<AuthenticationService>().signUp(
                            email: emailController.text.trim(),
                            password: passwordController.text.trim(),
                          );
                      //signs out
                      context.read<AuthenticationService>().signOut();
                      //signs in

                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => MyApp()));
                    } else if (emailController.text == "" ||
                        passwordController.text == "") {
                      setState(() {
                        accountErrorMessage = "Email or password are empty!";
                      });
                    } else if (emailController.text !=
                            emailControllerRetype.text ||
                        passwordController.text !=
                            passwordControllerRetype.text) {
                      setState(() {
                        accountErrorMessage = "Email or password do not match!";
                      });
                    }
                  },
                  child: Text("Sign up"),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Text(accountErrorMessage,
                    style: new TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
