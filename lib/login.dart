import 'dart:async';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:connectivity/connectivity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quizz_app/accueil.dart';

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Login"),
        centerTitle: true,
      ),
      body: FutureBuilder(
          future: FirebaseFirestore.instance.collection('point').get(),
          builder: (context, snapshot) {
            return SingleChildScrollView(
                child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 60.0),
                  child: Center(
                    child: Container(
                      width: 200,
                      height: 150,
                      child: Image.asset('assets/icon.png'),
                    ),
                  ),
                ),
                Container(
                  width: 250,
                  height: 50,
                  child: ElevatedButton(
                    child: Text("START"),
                    onPressed: () async {
                      checkinternetconnection();
                    },
                  ),
                ),
                SizedBox(
                  height: 130,
                )
              ],
            ));
          }),
    );
  }

  void checkinternetconnection() async {
    var result = await Connectivity().checkConnectivity();
    if (result == ConnectivityResult.none) {
      _showDialog('No Internet', "You're not connected to the internet");
    } else if (result == ConnectivityResult.mobile) {
      _showDialog('Internet', "You're connected over mobile data");
      Navigator.push(context, MaterialPageRoute(builder: (_) => accueil()));
    } else if (result == ConnectivityResult.wifi) {
      _showDialog('Internet', "You're connected over wifi data");
      Navigator.push(context, MaterialPageRoute(builder: (_) => accueil()));
    }
  }

  _showDialog(title, text) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(title),
            content: Text(text),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('okay'),
              )
            ],
          );
        });
  }
}
