import 'package:flutter/material.dart';
import "dart:math";

class CorrectWrongOverlay extends StatefulWidget{
  final bool _isCorrect;
  final VoidCallback _onTap;

  CorrectWrongOverlay(this._isCorrect, this._onTap);
  
  
  @override
  State createState() => new CorrectWrongOverlayState();
}

class CorrectWrongOverlayState extends State<CorrectWrongOverlay> with SingleTickerProviderStateMixin {
  
  Animation<double> _iconAnimation;
  AnimationController _iconAnimationController;

  @override
  void initState() {
    super.initState();
    _iconAnimationController = new AnimationController(duration: new Duration(milliseconds: 3000), vsync: this);
    _iconAnimation = new CurvedAnimation(parent: _iconAnimationController, curve:  Curves.elasticOut); 
    _iconAnimation.addListener(() => this.setState(() {}));
    _iconAnimationController.forward();
  }
  
   @override
  void dispose() {
    _iconAnimationController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return new Material(
      color: Colors.black54,
      child: new InkWell(
        onTap: () => widget._onTap(),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Container(
              decoration: new BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle
                ),
              child: new Transform.rotate(
                angle: _iconAnimation.value * 2 * pi,
                child: new Icon(widget._isCorrect == true ? Icons.done : Icons.error, size: 80.0,),
              )
            ),
            new Padding(
              padding: new EdgeInsets.only(bottom: 20.0)),
            new Text(widget._isCorrect == true ? "Correct" : "Incorrect", style: new TextStyle(color: Colors.white, fontSize: 50.0),)
          ],
        ),
      ),
    );
  }
}