import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import '../park_json_formatter.dart';

class Reviews extends StatelessWidget {
  int index;
  final DatabaseReference = FirebaseDatabase.instance;
  final firestoreInstance = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;

  ParkData parkData;

  Reviews(this.index, this.parkData);
  final TextEditingController reviewContent = TextEditingController();

  String acts;
  String uid;
  int numOfReivews = 0;

  @override
  Widget build(BuildContext context) {
    blah();
    final ref = DatabaseReference.reference();
    if (FirebaseAuth.instance.currentUser != null) {
      FirebaseAuth auth = FirebaseAuth.instance;
      uid = auth.currentUser.uid;
      print("uid: " + uid);
    } else {
      print("Not logged in!");
    }

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
              FutureBuilder<QuerySnapshot>(
                future: firestoreInstance
                    .collection(parkData.data[index].name)
                    .get(),
                builder: (_, snap) {
                  if (snap.hasData) {
                    numOfReivews = snap.data.docs.length;
                    print("nuRe: "+numOfReivews.toString());
                  }
                  return Container();
                },
              ),
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
              Row(
                children: <Widget>[
                  SizedBox(
                      height: MediaQuery.of(context).size.height / 1.4,
                      width: MediaQuery.of(context).size.width / 1.4,
                      child: Scrollbar(
                        thickness: 12,
                        child: new ListView.builder(
                            itemCount: numOfReivews,
                            itemBuilder: (BuildContext ctxt, int spot) =>
                                buildBody(ctxt, spot, context)),
                      )),
                ],
                mainAxisAlignment: MainAxisAlignment.center,
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

  Widget buildBody(BuildContext ctxt, int spot, context) {
    return new Container(
      margin: EdgeInsets.only(top: 25.0),
      child: FutureBuilder<DocumentSnapshot>(
        future: firestoreInstance
            .collection(parkData.data[index].name)
            .doc(spot.toString())
            .get(),
        builder: (_, snap) {
          print("build: " + parkData.data[index].name);
          return snap.hasData
              ? Text(
                  snap.data.data()["reviewer"] +
                      ": " +
                      snap.data.data()["review"],
                  textAlign: TextAlign.center,
                  style: new TextStyle(
                    fontSize: MediaQuery.of(context).size.width / 60,
                  ),
                )
              : Text("Loadings...",
                  textAlign: TextAlign.center,
                  style: new TextStyle(
                    fontWeight: FontWeight.bold,
                  ));
        },
      ),
    );
  }

  blah() {
    for (int x = 0; x < 33; x++) {
      print(parkData.data[x].name);
    }
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
