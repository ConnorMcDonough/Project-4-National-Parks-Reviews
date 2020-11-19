import 'dart:html';

import 'package:flutter/material.dart';

double collapsableHeight = 0.0;
double size;

class Signup extends StatelessWidget {
  Signup();

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).size.width < 800.0) {
      if (collapsableHeight == 0.0) {
        collapsableHeight = 240.0;
        size = 240;
      } else if (collapsableHeight == 240.0) {
        collapsableHeight = 0.0;
        size = 120;
      }
    }
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            children: [
              Column(
                children: [
                  Text("Signup")
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
