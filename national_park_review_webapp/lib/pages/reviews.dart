import 'package:flutter/material.dart';

import '../park_json_formatter.dart';

class Reviews extends StatelessWidget {
  int index;

  ParkData parkData;

  Reviews(this.index, this.parkData);
  final TextEditingController reviewContent = TextEditingController();

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
                child: Text(
                  parkData.data[index].images[0].caption,
                  textAlign: TextAlign.center,
                  style: new TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: MediaQuery.of(context).size.width / 80,
                  ),
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
              Container(
                margin: EdgeInsets.only(top: 30),
                child: Text(
                  parkData.data[index].weatherInfo,
                  textAlign: TextAlign.center,
                  style: new TextStyle(
                    fontSize: MediaQuery.of(context).size.width / 70,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 40),
                child: Text(
                "Reviews",
                textAlign: TextAlign.center,
                style: new TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: MediaQuery.of(context).size.width / 45,
                ),
              ),
              ),
              Card(
                  margin: EdgeInsets.only(top: 30),
                  color: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextField(
                      controller: reviewContent,
                      maxLines: 8,
                      decoration: InputDecoration.collapsed(
                          hintText: "Enter your review here!"),
                    ),
                  )),
              Container(
                margin: EdgeInsets.only(top: 100),
              )
            ],
          ),
        ),
      ),
    );
  }

  activities() {
    acts = "Activities at site include: " +
        parkData.data[index].activities[0].name;
    for (int x = 1;
        x < int.parse(parkData.data[index].activities.length.toString());
        x++) {
      acts += ", " + parkData.data[index].activities[x].name;
    }

    return acts;
  }
}
