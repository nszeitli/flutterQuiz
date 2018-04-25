import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  //A stateless widget is a static widget, nothing will get updated
  @override
  Widget build(BuildContext context) {
    return new Material( // this material widget acts like a piece of paper
      color: Colors.greenAccent,
      child: new InkWell(
        onTap: ()=> print("We tapped the page"),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text("Lets Quizz", style: new TextStyle(color: Colors.white, fontSize: 50.0, fontWeight: FontWeight.bold),),
            new Text("Tap to start", style: new TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),),
          ],
        )
      )
    );
  }
}