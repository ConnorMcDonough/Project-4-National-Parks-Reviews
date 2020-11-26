import 'package:flutter/material.dart';

import '../park_json_formatter.dart';

class Reviews extends StatelessWidget {
  int index;

  ParkData parkData;

  Reviews(this.index, this.parkData);

  String acts;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        title: Text(
          parkData.data[index].name,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 35, left: 40, right: 40),
          child: Column(
            children: [
              Text(
                parkData.data[index].fullName,
                textAlign: TextAlign.center,
                style: new TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: MediaQuery.of(context).size.width / 35,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Text(
                  parkData.data[index].description,
                  textAlign: TextAlign.center,
                  style: new TextStyle(
                    fontSize: MediaQuery.of(context).size.width / 70,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Image.network(
                  parkData.data[index].images[0].url,
                  height: MediaQuery.of(context).size.width / 3.5,
                  fit: BoxFit.fill,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 30),
                child: Text(
                  activities(),
                  textAlign: TextAlign.center,
                  style: new TextStyle(
                    fontSize: MediaQuery.of(context).size.width / 70,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  activities() {
    acts="Activities at site include: "+parkData.data[index].activities[0].name;
    for(int x=1;x<int.parse(parkData.data[index].activities.length.toString());x++) {
      acts+=", "+parkData.data[index].activities[x].name;
    }

    return acts;
  }
}
