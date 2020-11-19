import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:national_park_review_webapp/pages/about.dart';
import 'package:national_park_review_webapp/pages/signin.dart';

double collapsableHeight = 0.0;
Color selected = Color(0xffffffff);
Color notSelected = Color(0xafffffff);

class MyHomePage extends StatefulWidget {
  MyHomePage();

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static int page = 0;
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
                          'National Parks Reviews, MI',
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
            Container(child: _buildChild()),
          ],
        ),
      ),
    );
  }
}

Widget _buildChild() {
  print("Page=" + _MyHomePageState.page.toString());
  if (_MyHomePageState.page == 0) {
    return Signin();
  } else if (_MyHomePageState.page == 1) {
    return About();
  } else if (_MyHomePageState.page == 2) {
  } else if (_MyHomePageState.page == 3) {
  } else if (_MyHomePageState.page == 4) {}
  return Container();
}

List<Widget> navBarItems = [
  NavBarItem(
    text: 'About',
  ),
  NavBarItem(
    text: 'Sign in',
  ),
  NavBarItem(
    text: 'Sign up',
  ),
  NavBarItem(
    text: 'Contact',
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
            if (widget.text == "About") {
                setState(() {
                  print("pb=" + _MyHomePageState.page.toString());
                  _MyHomePageState.page = 1;
                  print("pa=" + _MyHomePageState.page.toString());
                });
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
