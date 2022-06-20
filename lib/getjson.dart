import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:quizz_app/accueil.dart';
import 'package:quizz_app/results.dart';

class getjson extends StatelessWidget {
  const getjson({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: DefaultAssetBundle.of(context).loadString("assets/quiz.json"),
        builder: (context, snapshot) {
          List mydata = json.decode(snapshot.data.toString());
          if (mydata == null) {
            return Scaffold(
              body: Center(child: Text("loading")),
            );
          } else {
            return quiz(
              mydata: mydata,
              marks: 0,
              vie: 0,
              level: 0,
              uid: '',
            );
          }
        });
  }
}

class quiz extends StatefulWidget {
  final String uid;
  var mydata;
  int marks;
  int vie;
  int level;
  quiz(
      {Key? key,
      this.mydata,
      required this.marks,
      required this.level,
      required this.vie,
      required this.uid})
      : super(key: key);

  @override
  State<quiz> createState() => _quizState(mydata, marks, level, vie, uid);
}

class _quizState extends State<quiz> {
  String message = "Score" + "0" + "-" + "Best" + "0";
  String levels = "level" + "0" + "/21";
  String vies = "5";
  final String uid;
  var mydata;
  int marks = 0;
  int vie = 5;
  int level = 0;
  _quizState(this.mydata, int marks, int level, int vie, this.uid);
  Color ch = Colors.indigo;
  Color rig = Colors.green;
  Color wro = Colors.red;

  int i = 1;
  int timer = 10;
  int click = 20;
  String showtimer = "10";
  Map<String, Color> btncolor = {
    "a": Colors.indigoAccent,
    "b": Colors.indigoAccent,
    "c": Colors.indigoAccent,
    "d": Colors.indigoAccent,
  };
  bool canceltimer = false;
  int g = 0;

  void starttimer() async {
    const onesec = Duration(seconds: 1);
    Timer.periodic(onesec, (Timer t) {
      setState(() {
        if (timer < 1) {
          t.cancel();
          nextquestion();
        } else if (canceltimer == true) {
          t.cancel();
        } else {
          timer = timer - 1;
        }
        showtimer = timer.toString();
      });
    });
  }

  void nextquestion() {
    click = 20;
    canceltimer = false;
    timer = 10;
    setState(() {
      if (i < 20) {
        level++;
        levels = 'level :' + "$level" + "/20";
        i++;
      } else {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => result(marks: marks),
        ));
      }
      btncolor["a"] = Colors.indigoAccent;
      btncolor["b"] = Colors.indigoAccent;
      btncolor["c"] = Colors.indigoAccent;
      btncolor["d"] = Colors.indigoAccent;
    });
    starttimer();
  }

  void quit() {
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) => result(marks: marks),
    ));
  }

  void checkanswer(String k) async {
    if (click == 20) {
      if (mydata[2][i.toString()] == mydata[1][i.toString()][k]) {
        marks = marks + 5;
        message = "Score" + "$marks" + "-" + "Best" + g.toString();
        ch = rig;
      } else {
        ch = wro;
        vie = vie - 1;
        vies = "$vie";
      }
      setState(() {
        btncolor[k] = ch;
        if (k != "a" &&
            mydata[2][i.toString()] == mydata[1][i.toString()]["a"]) {
          btncolor["a"] == rig;
        }
        if (k != "b" &&
            mydata[2][i.toString()] == mydata[1][i.toString()]["b"]) {
          btncolor["b"] == rig;
        }
        if (k != "c" &&
            mydata[2][i.toString()] == mydata[1][i.toString()]["c"]) {
          btncolor["c"] == rig;
        }
        if (k != "d" &&
            mydata[2][i.toString()] == mydata[1][i.toString()]["d"]) {
          btncolor["d"] == rig;
        }
        canceltimer = true;
      });
      click = 30;
      if (vie > 0) {
        Timer(Duration(seconds: 2), nextquestion);
      } else {
        Timer(Duration(seconds: 2), quit);
      }
    }
  }

  Widget choicebutton(String k) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 0.0),
      child: MaterialButton(
        onPressed: () => {checkanswer(k)},
        child: Text(
          mydata[1][i.toString()][k],
          style: TextStyle(
              fontSize: 14.0, color: Colors.white, fontWeight: FontWeight.bold),
          maxLines: 1,
        ),
        color: btncolor[k],
        splashColor: Colors.indigo[700],
        highlightColor: Colors.indigo[700],
        minWidth: 400.0,
        height: 45.0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => accueil(),
            ));
          },
        ),
        title: Text("ART QUICK QUIZ"),
        actions: [
          Text(
            vies,
            style:
                TextStyle(height: 2, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          IconButton(
            icon: const Icon(
              Icons.favorite,
              color: Colors.deepOrange,
            ),
            onPressed: () {},
          )
        ],
        toolbarHeight: 50.0,
        centerTitle: true,
      ),
      body: Scrollbar(
        child: Container(
          padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(1.0),
              color: Colors.indigoAccent,
              gradient: LinearGradient(
                  colors: [Colors.indigo.shade100, Colors.indigo.shade100],
                  begin: Alignment.bottomLeft,
                  end: Alignment.bottomRight)),
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.all(10.0),
                      width: 180,
                      padding: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.indigoAccent),
                      child: Text(
                        message,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.all(10.0),
                        padding: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.indigoAccent),
                        // color: Colors.indigoAccent,
                        child: Text(
                          levels,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ))
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(15.0),
                        color: Colors.indigoAccent),
                    margin: EdgeInsets.fromLTRB(5, 1, 5, 0),
                    padding: EdgeInsets.fromLTRB(5, 1, 5, 0),
                    alignment: Alignment.center,
                    child: Text(
                      mydata[0][i.toString()],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      ),
                    )),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  padding: EdgeInsets.fromLTRB(5, 1, 5, 0),
                  alignment: Alignment.center,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        choicebutton('a'),
                        choicebutton('b'),
                        choicebutton('c'),
                        choicebutton('d'),
                      ]),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  margin: EdgeInsets.all(0.0),
                  height: 120.0,
                  width: 120.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(200.0),
                    color: Colors.indigoAccent,
                    boxShadow: kElevationToShadow[8],
                  ),
                  child: Center(
                    child: Text(
                      showtimer,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 40.0,
                        color: Colors.white,
                        fontFamily: "Times New Roman",
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
