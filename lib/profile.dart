import 'package:flutter/material.dart';
import 'pages/LeaderBoard.dart';
import 'pages/OverallStats.dart';
import 'pages/PlanDetails.dart';

void main() {
  runApp(
    Profile(
      title: 'Profile Page',
    ),
  );
}

class Profile extends StatefulWidget {
  Profile({Key key, String title}) : super(key: key);

  _ProfileState createState() {
    return _ProfileState();
  }
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children:<Widget>[
            Center(
          child: Padding(
            padding: EdgeInsets.only(top: 10),
            child: Column(
              children: <Widget>[
                ListTile(
                  contentPadding: EdgeInsets.only(left: 15),
                  title: Row(
                    children: <Widget>[
                      IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.black,
                          )),
                      SizedBox(width: 100),
                      Text('LOMASH DUBEY',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      SizedBox(width: 80),
                      Icon(
                        Icons.notifications,
                        color: Colors.black,
                        size: 25,
                      ),
                      SizedBox(width: 20),
                      Icon(
                        Icons.more_horiz,
                        color: Colors.black,
                        size: 25,
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Icon(
                          Icons.account_circle,
                          color: Colors.black,
                          size: 95,
                        ),
                        Column(
                          children: <Widget>[
                            Text('Current Weight :',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black45)),
                            SizedBox(height: 8),
                            Text('75 Kgs',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black45)),
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Text('Target Weight :',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black45)),
                            SizedBox(height: 8),
                            Text('50 Kgs',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black45)),
                          ],
                        ),
                      ],
                      ),
                ),
                Container(
                  decoration: BoxDecoration(
                      border: BorderDirectional(bottom: BorderSide(width: 1))),
                  child: ButtonBar(
                    alignment: MainAxisAlignment.start,
                    children: <Widget>[
                        FlatButton(
                          padding: EdgeInsets.symmetric(horizontal: 50),
                          onPressed: () => null,
                          child: Icon(Icons.graphic_eq, color: Colors.black),
                        ),
                      Container(
                        decoration: BoxDecoration(
                            border: BorderDirectional(
                                start: BorderSide(width: 1),
                                end: BorderSide(width: 1))),
                        child: FlatButton(
                          padding: EdgeInsets.symmetric(horizontal: 70),
                          onPressed: () => null,
                          child: Icon(Icons.fastfood, color: Colors.black),
                        ),
                      ),
                      FlatButton(
                        padding: EdgeInsets.symmetric(horizontal: 50),
                        onPressed: () => null,
                        child:
                            Icon(Icons.accessibility_new, color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ],
              ),
                ),
                ),
                        Flexible(
                          child: PageView(
                    controller: PageController(
                      initialPage: 0,
                      keepPage: true,
                    ),
                    allowImplicitScrolling: true,
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                          ListView(
                              scrollDirection: Axis.vertical,
                        children: <Widget>[
                                ListTile(
                                contentPadding: EdgeInsets.only(bottom: 20, top: 20),
                                title: Text(
                                  'OVERALL :',
                                  style: TextStyle(
                                    fontSize: 35,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                subtitle: Leaderboard(),
                              ),
                                ListTile(
                                contentPadding: EdgeInsets.only(top: 50, bottom: 40),
                                title: Text(
                                  'CURRENT :',
                                  style: TextStyle(
                                    fontSize: 35,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                subtitle: Leaderboard(),
                                ),
                        ],
                      ),
                        Plandetails(),
                         Overallstats(),
                    ],
                  ),
                  ),
  
        ],
        ),
        ),
    );
  }
}
