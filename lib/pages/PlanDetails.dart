import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter/material.dart';

class Plandetails extends StatefulWidget{
Plandetails({Key key, String title}) : super(key: key);

_PlandetailsState createState(){
return _PlandetailsState();
}
}

class _PlandetailsState extends State<Plandetails> with SingleTickerProviderStateMixin{

static Animation<double> anim;
static AnimationController animCont ;

@override
void initState(){
  super.initState();

animCont = AnimationController(
  duration: Duration(milliseconds: 1200),
  vsync: this,
);

  anim = Tween<double>(begin: 1.0, end: 0.4).animate(animCont);
}

  @override
  Widget build(BuildContext context){
  return Column(
    children: <Widget>[
      
        Opacity(
          opacity: anim.value,
          child: RaisedButton(
        onPressed: () {
          setState(() {
            print(anim.value);
          animCont.forward();
          print(anim.value);
          });
          
        },
        child: Text(
          'PLAN - 1',
          style: TextStyle(
            color: Colors.black87,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ), 
        ),
        ),
        ),
        Opacity(
          opacity: anim.value,
          child: RaisedButton(
          onPressed: (){
            setState(() {
              print(anim.value);
            animCont.reverse();
              print(anim.value);
            });
          },
          child: Text(
            'PLAN - 2',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          ),
          ),
    ]
  );
  }
}