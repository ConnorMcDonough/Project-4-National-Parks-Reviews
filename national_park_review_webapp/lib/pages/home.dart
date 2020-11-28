import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:national_park_review_webapp/pages/logout.dart';
import 'package:national_park_review_webapp/pages/reviews.dart';
import 'package:national_park_review_webapp/pages/signin.dart';
import 'package:national_park_review_webapp/pages/signup.dart';

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:national_park_review_webapp/park_json_formatter.dart';

double collapsableHeight = 0.0;
Color selected = Color(0xffffffff);
Color notSelected = Color(0xafffffff);
List<String> litems = ["1", "2", "Third", "4"];
final int lengthOfJson = 33;

class MyHomePage extends StatefulWidget {
  MyHomePage();

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static int page = 0;

  final String url =
      "https://developer.nps.gov/api/v1/parks?stateCode=ca&limit=" +
          lengthOfJson.toString() +
          "&api_key=YnnSWf8sXMzWejXgbxYnKGGPYsnwAqAXOzIjVE9A";

  @override
  Widget build(BuildContext context) {
    print("Build!");
    return Scaffold(
      body: Container(
        constraints: BoxConstraints(
          minHeight: 100,
        ),
        child: Column(
          children: [
            Image.asset(
              'assets/images/background.jpg',
              fit: BoxFit.cover,
              height: MediaQuery.of(context).size.height / 6.5,
              width: MediaQuery.of(context).size.width,
            ),
            Stack(
              children: [
                Container(
                  color: Colors.white,
                ),
                AnimatedContainer(
                  margin: EdgeInsets.only(top: 79.0),
                  duration: Duration(milliseconds: 375),
                  curve: Curves.ease,
                  height: (MediaQuery.of(context).size.width < 800.0)
                      ? collapsableHeight
                      : 0.0,
                  width: double.infinity,
                  color: Color(0xff121212),
                  child: SingleChildScrollView(
                    child: Column(
                      children: navBarItems,
                    ),
                  ),
                ),
                Container(
                  color: Color(0xff121212),
                  height: 60.0,
                  padding: EdgeInsets.symmetric(horizontal: 24.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FlatButton(
                        child: Text(
                          'National Parks Reviews, CA',
                          style: TextStyle(
                            fontSize: 22.0,
                            color: Color(0xffffffff),
                          ),
                        ),
                        onPressed: () {
                          print("oops");
                        },
                      ),
                      LayoutBuilder(
                        builder: (context, constraints) {
                          if (MediaQuery.of(context).size.width < 800.0) {
                            return NavBarButton(
                              onPressed: () {
                                if (collapsableHeight == 0.0) {
                                  setState(() {
                                    collapsableHeight = 240.0;
                                  });
                                } else if (collapsableHeight == 240.0) {
                                  setState(() {
                                    collapsableHeight = 0.0;
                                  });
                                }
                              },
                            );
                          } else {
                            return Row(
                              children: navBarItems,
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                SizedBox(
                    height: MediaQuery.of(context).size.height / 1.4,
                    width: MediaQuery.of(context).size.width / 1.4,
                    child: Scrollbar(
                      thickness: 12,
                      child: new ListView.builder(
                          itemCount: lengthOfJson,
                          itemBuilder: (BuildContext ctxt, int index) =>
                              buildBody(ctxt, index)),
                    )),
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBody(BuildContext ctxt, int index) {
    return new Container(
      margin: EdgeInsets.only(bottom: 10),
      child: FutureBuilder<http.Response>(
        future: http.get(url),
        builder: (_, response) {
          ParkData parkData;
          if (response.hasData) {
            parkData = ParkData.fromJson(jsonDecode(response.data.body));
          }
          return response.hasData
              ? Container(
                  margin: EdgeInsets.only(left: 30, right: 30),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 4,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: FlatButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Reviews(index, parkData)));
                    },
                    child: Text(
                      "" + parkData.data[index].fullName,
                      style: new TextStyle(
                        color: Colors.black,
                        fontSize: MediaQuery.of(context).size.height / 36,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ))
              : Text("Loadings...",
                  textAlign: TextAlign.center,
                  style: new TextStyle(
                    fontWeight: FontWeight.bold,
                  ));
        },
      ),
    );
  }
}

List<Widget> navBarItems = [
  NavBarItem(
    text: 'UofM-D 2020',
  ),
  NavBarItem(
    text: 'Sign in',
  ),
  NavBarItem(
    text: 'Sign up',
  ),
  NavBarItem(
    text: 'Log out',
  ),
];

class NavBarItem extends StatefulWidget {
  final String text;

  NavBarItem({
    this.text,
  });

  _NavBarItemState createState() => _NavBarItemState();
}

class _NavBarItemState extends State<NavBarItem> {
  Color color = notSelected;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          splashColor: Colors.white60,
          onTap: () {
            if (widget.text == "Sign in") {
              print("signin");
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SignInPage()));
              //Signin.openPopup(context);
            } else if (widget.text == "Sign up") {
              print("signup");
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SignUpPage()));
            } else if (widget.text == "Log out") {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LogOutPage()));
            }
          },
          child: Container(
            height: 60.0,
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(
              widget.text,
              style: TextStyle(
                fontSize: 16.0,
                color: color,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class NavBarButton extends StatefulWidget {
  Function onPressed;

  NavBarButton({
    this.onPressed,
  });

  _NavBarButtonState createState() => _NavBarButtonState();
}

class _NavBarButtonState extends State<NavBarButton> {
  Widget build(BuildContext context) {
    return Container(
      height: 55.0,
      width: 60.0,
      decoration: BoxDecoration(
        border: Border.all(
          color: Color(0xcfffffff),
          width: 2.0,
        ),
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Material(
        color: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: InkWell(
          splashColor: Colors.white60,
          onTap: () {
            setState(() {
              widget.onPressed();
            });
          },
          child: Icon(
            Icons.menu,
            size: 30.0,
            color: Color(0xcfffffff),
          ),
        ),
      ),
    );
  }
}
