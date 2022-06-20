import 'dart:async';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:connectivity/connectivity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quizz_app/group.dart';
import 'package:quizz_app/homepage.dart';
import 'package:quizz_app/login.dart';
import 'package:quizz_app/parameter.dart';
import 'package:quizz_app/statistic.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class accueil extends StatefulWidget {
  const accueil({Key? key}) : super(key: key);

  @override
  State<accueil> createState() => _accueilState();
}

class _accueilState extends State<accueil> {
  int _selectedIndex = 0;
  static const TextStyle optionstyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static List<Widget> _widgetOptions = <Widget>[
    homepage(),
    statistic(),
    group(),
    parameter(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Play"),
        centerTitle: true,
      ),
      body: Scrollbar(
          child: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      )),
      bottomNavigationBar: CurvedNavigationBar(
        color: Colors.white,
        buttonBackgroundColor: Colors.white,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 600),
        height: 50,
        items: const <Widget>[
          Icon(
            Icons.games,
            size: 30,
          ),
          Icon(
            Icons.stacked_bar_chart,
            size: 30,
          ),
          Icon(
            Icons.view_list_sharp,
            size: 30,
          ),
          Icon(
            Icons.settings,
            size: 30,
          ),
        ],
        onTap: _onItemTapped,
      ),
    );
  }
}
