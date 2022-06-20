import 'dart:async';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:connectivity/connectivity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quizz_app/accueil.dart';
import 'package:quizz_app/getjson.dart';
import 'package:quizz_app/group.dart';
import 'package:quizz_app/homepage.dart';
import 'package:quizz_app/login.dart';
import 'package:quizz_app/parameter.dart';
import 'package:quizz_app/statistic.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class artchoice extends StatefulWidget {
  const artchoice({Key? key}) : super(key: key);

  @override
  State<artchoice> createState() => _artchoiceState();
}

class _artchoiceState extends State<artchoice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => accueil()));
          },
        ),
        title: Text("QUIZ"),
      ),
      body: Scrollbar(
          child: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(15),
            child: Column(children: <Widget>[
              SizedBox(
                width: 60,
                height: 20,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                      child: InkWell(
                          onTap: () {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => getjson()));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              color: Colors.green,
                              border: Border.all(width: 1, color: Colors.white),
                            ),
                            child: Text("1"),
                          )))
                ],
              )
            ]),
          )
        ],
      )),
    );
  }
}
