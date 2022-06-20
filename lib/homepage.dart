import 'package:flutter/material.dart';
import 'package:quizz_app/artchoice.dart';

class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  List<String> images = [
    "images/art.jpg",
    "images/science.jpg",
    "images/art.jpg",
    "images/science.jpg",
    "images/art.jpg",
    "images/science.jpg",
    "images/art.jpg",
    "images/science.jpg",
    "images/art.jpg",
    "images/science.jpg",
    "images/art.jpg",
    "images/science.jpg",
  ];
  Widget customcard(String lang, String image) {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => artchoice(),
          ));
        },
        child: Material(
          color: Colors.indigo,
          elevation: 10.0,
          borderRadius: BorderRadius.circular(20.0),
          child: Container(
            child: Column(
              children: <Widget>[
                Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                  child: Material(
                    elevation: 5,
                    borderRadius: BorderRadius.circular(100),
                    child: Container(
                      height: 120,
                      width: 120,
                      padding: EdgeInsets.all(5.0),
                      child: ClipOval(child: Image(image: AssetImage(image))),
                    ),
                  ),
                ),
                Center(
                  child: Text(lang),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffeaeaea),
      body: ListView(children: <Widget>[
        customcard("Art", images[0]),
        customcard("Science", images[1]),
        customcard("Art", images[2]),
        customcard("sciences", images[3]),
        customcard("Art", images[4]),
        customcard("Art", images[5]),
        customcard("Art", images[6]),
        customcard("Art", images[7]),
        customcard("Art", images[8]),
        customcard("Art", images[9]),
        customcard("Art", images[10]),
        customcard("Art", images[11]),
      ]),
    );
  }
}
