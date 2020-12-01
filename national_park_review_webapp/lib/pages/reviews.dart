import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import '../park_json_formatter.dart';

class Reviews extends StatefulWidget {
  Reviews(this.index, this.parkData);
  ParkData parkData;
  int index;
  @override
  State<StatefulWidget> createState() {
    return ReviewsState(this.index, this.parkData);
  }
}

class ReviewsState extends State<Reviews> {
  int index;
  final DatabaseReference = FirebaseDatabase.instance;
  final firestoreInstance = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;
  final TextEditingController nameController = TextEditingController();

  ParkData parkData;

  ReviewsState(this.index, this.parkData);
  final TextEditingController reviewContent = TextEditingController();

  String acts;
  String uid;
  int numOfReivews = 0;
  bool setNumOfReviews = false;
  String loggedInStatus = "Not Logged in! (Non-validated Review)";
  bool loggedIn = false;

  @override
  Widget build(BuildContext context) {
    final ref = DatabaseReference.reference();
    if (FirebaseAuth.instance.currentUser != null) {
      FirebaseAuth auth = FirebaseAuth.instance;
      uid = auth.currentUser.uid;
      print("uid: " + uid);
      loggedInStatus = "Logged in! (Validated Review)";
      loggedIn = true;
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
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      if (setNumOfReviews == false) {
                        setState(() {
                          numOfReivews = snap.data.docs.length;
                        });
                        setNumOfReviews = true;
                      }
                    });
                  }
                  return Container();
                },
              ),
              Text(
                parkData.data[index].fullName,
                textAlign: TextAlign.center,
                style: new TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: (MediaQuery.of(context).size.width > 800.0)
                        ? MediaQuery.of(context).size.width / 35
                        : 40),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Text(
                  parkData.data[index].description,
                  textAlign: TextAlign.center,
                  style: new TextStyle(
                      fontSize: (MediaQuery.of(context).size.width > 800.0)
                          ? MediaQuery.of(context).size.width / 85
                          : 20),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Image.network(
                  parkData.data[index].images[0].url,
                  height: (MediaQuery.of(context).size.width > 800.0)
                      ? MediaQuery.of(context).size.width / 4.5
                      : 220,
                  fit: BoxFit.fill,
                ),
              ),
              Container(
                child: Text(
                  parkData.data[index].images[0].caption,
                  textAlign: TextAlign.center,
                  style: new TextStyle(
                      fontStyle: FontStyle.italic,
                      fontSize: (MediaQuery.of(context).size.width > 800.0)
                          ? MediaQuery.of(context).size.width / 100
                          : 10),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 30),
                child: Text(
                  activities(),
                  textAlign: TextAlign.center,
                  style: new TextStyle(
                      fontSize: (MediaQuery.of(context).size.width > 800.0)
                          ? MediaQuery.of(context).size.width / 85
                          : 20),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 30),
                child: Text(
                  parkData.data[index].weatherInfo,
                  textAlign: TextAlign.center,
                  style: new TextStyle(
                      fontSize: (MediaQuery.of(context).size.width > 800.0)
                          ? MediaQuery.of(context).size.width / 85
                          : 20),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 40),
                child: Text(
                  "Reviews",
                  textAlign: TextAlign.center,
                  style: new TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: (MediaQuery.of(context).size.width > 800.0)
                          ? MediaQuery.of(context).size.width / 65
                          : 34),
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
                child: Text(
                  loggedInStatus,
                  textAlign: TextAlign.center,
                  style: new TextStyle(
                      fontStyle: FontStyle.italic,
                      fontSize: (MediaQuery.of(context).size.width > 800.0)
                          ? MediaQuery.of(context).size.width / 80
                          : 14),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    left: (MediaQuery.of(context).size.width > 800.0)
                        ? MediaQuery.of(context).size.width / 3
                        : 20,
                    right: (MediaQuery.of(context).size.width > 800.0)
                        ? MediaQuery.of(context).size.width / 3
                        : 20),
                child: TextField(
                  controller: nameController,
                  enableSuggestions: false,
                  autocorrect: false,
                  decoration: InputDecoration(
                    icon: Icon(Icons.account_circle),
                    labelText: "Name",
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 30),
                child: RaisedButton(
                  onPressed: () {
                    if (reviewContent.text != null &&
                        nameController.text != null) {
                      if (loggedIn == true) {
                        reviewContent.text += " (VALIDATED REVIEW ✔)";
                      }
                      setState(() {
                        sendReview(reviewContent.text, nameController.text);
                        reviewContent.text = "";
                        nameController.text = "";
                      });
                    }
                  },
                  child: Text("Submit Review"),
                ),
              ),
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
          return snap.hasData
              ? Text(
                  snap.data.data()["reviewer"] +
                      ": " +
                      snap.data.data()["review"],
                  textAlign: TextAlign.center,
                  style: new TextStyle(
                    fontSize: (MediaQuery.of(context).size.width > 800.0)
                      ? MediaQuery.of(context).size.width/72
                      : 19,
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

  Future<void> sendReview(String reviewContent, String name) async {
    CollectionReference park =
        FirebaseFirestore.instance.collection(parkData.data[index].name);
    park
        .doc(numOfReivews.toString())
        .set({"review": reviewContent, "reviewer": name});

    numOfReivews++;
    return;
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
