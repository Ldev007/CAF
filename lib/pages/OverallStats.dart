import 'package:flutter/material.dart';

class Overallstats extends StatefulWidget{
Overallstats({Key key, String title}) : super(key: key);

_OverallstatsState createState(){
return _OverallstatsState();
}
}

class _OverallstatsState extends State<Overallstats>{

  @override
  Widget build(BuildContext context){
  return Expanded(child: Container(color: Colors.blue,),);
  }
}