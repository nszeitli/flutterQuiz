import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  final bool color;
  final VoidCallback _onTap;
  AnswerButton(this.color, this._onTap);
  
  @override
  Widget build(BuildContext context) {
  return new Expanded(
    child: new Material( // false button
    color: color == true ? Colors.greenAccent : Colors.redAccent,
      child: new InkWell(
        onTap: () => _onTap(),
          child: new Center(
            child: new Container(
              decoration: new BoxDecoration(
                border: new Border.all(color: Colors.white, width: 2.0),
              ),
              child: new Text(color == true ? "True" : "False",
                style: new TextStyle(color: Colors.white, fontSize: 40.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),
              ),
              padding: new EdgeInsets.all(20.0),
            )
          )
        ),
      ),
    );
  }
}

