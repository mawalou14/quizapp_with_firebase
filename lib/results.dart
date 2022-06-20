import 'dart:ffi';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:quizz_app/artchoice.dart';

class result extends StatefulWidget {
  int marks;
  result({Key? key, required this.marks}) : super(key: key);

  @override
  State<result> createState() => _resultState(marks);
}

class _resultState extends State<result> {
  int marks;
  _resultState(this.marks);
  List<String> images = [
    "images/art.png",
    "images/science.png",
    "images/art.png",
  ];
  String message = "";
  String image = "";
  @override
  void initState() {
    if (marks <= 35) {
      image = images[0];
      message = "You should try hrd \n" + "Your Score $marks";
    } else if (marks > 35) {
      image = images[1];
      message = "You can do better \n" + "Your Score $marks";
    } else if (marks >= 50) {
      image = images[0];
      message = "Average \n" + "Your Score $marks";
    } else if (marks >= 60) {
      image = images[0];
      message = "Good \n" + "Your Score $marks";
    } else if (marks >= 80) {
      image = images[0];
      message = "Very good \n" + "Your Score $marks";
    } else if (marks >= 90) {
      image = images[0];
      message = "Woow you've got it \n" + "Your Score $marks";
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "RESULTS",
        ),
        centerTitle: true,
      ),
      body: Column(children: <Widget>[
        Center(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Center(
              child: Text(
                "QuizStar",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Center(
              child: Text(
                "Challenge Make Great",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 70,
        ),
        Container(
          child: Column(
            children: <Widget>[
              Material(
                child: Container(
                  width: 120.0,
                  height: 120.0,
                  child: ClipRect(
                    child: Image(image: AssetImage(image)),
                  ),
                ),
              ),
              Padding(
                  padding: EdgeInsets.symmetric(
                vertical: 5.0,
                horizontal: 10.0,
              )),
              Center(
                child: Text(
                  message,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15.0),
                ),
              )
            ],
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Center(
              child: Text(
                "",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 50,
            ),
            Flexible(
              child: Divider(
                color: Colors.black,
                height: 5,
                thickness: 3,
                indent: 20,
                endIndent: 20,
              ),
            ),
            Text(
              "My Record",
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
            Flexible(
              child: Divider(
                color: Colors.black,
                height: 2,
                thickness: 1,
                indent: 20,
                endIndent: 20,
              ),
            ),
            SizedBox(
              width: 50,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 50,
            ),
            Text("Wins"),
            Text(
              marks.toString(),
              style: TextStyle(fontSize: 24, color: Colors.green),
            ),
            Text("Wins"),
            Text(
              (100 - marks).toString(),
              style: TextStyle(fontSize: 24, color: Colors.red),
            ),
            SizedBox(
              width: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => artchoice(),
                    ));
                  },
                  child: Text(
                    "Continue",
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                )
              ],
            )
          ],
        )
      ]),
    );
  }
}
