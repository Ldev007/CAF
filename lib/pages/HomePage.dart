import 'package:flutter/material.dart';

void main() => runApp(HomePage());

class HomePage extends StatefulWidget {
  HomePage({Key key, String title}) : super(key: key);

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<bool> selections = [true, false, false, false, false];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white24,
            titleSpacing: 300,
            title: IconButton(
              onPressed: () => null,
              icon: Icon(
                Icons.account_circle,
                size: 35,
              ),
            ),
          ),
          body: Align(
            alignment: Alignment(0, 0.92),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.black,
              ),
              child: ToggleButtons(
                selectedBorderColor: Colors.transparent,
                fillColor: Colors.transparent,
                borderColor: Colors.transparent,
                onPressed: (int index) {
                  setState(() {
                    if (index == 0) {
                      selections[1] = false;
                      selections[2] = false;
                      selections[3] = false;
                      selections[4] = false;
                    } else if (index == 1) {
                      selections[0] = false;
                      selections[2] = false;
                      selections[3] = false;
                      selections[4] = false;
                    } else if (index == 2) {
                      selections[0] = false;
                      selections[1] = false;
                      selections[3] = false;
                      selections[4] = false;
                    } else if (index == 3) {
                      selections[0] = false;
                      selections[1] = false;
                      selections[2] = false;
                      selections[4] = false;
                    } else {
                      selections[0] = false;
                      selections[1] = false;
                      selections[2] = false;
                      selections[3] = false;
                    }
                  });
                },
                isSelected: selections,
                children: <Widget>[
                  IconButton(
                    onPressed: () => null,
                    icon: Icon(
                      Icons.home,
                      color: Colors.white,
                    ),
                  ),
                  IconButton(
                    onPressed: () => null,
                    icon: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                  ),
                  IconButton(
                    onPressed: null,
                    icon: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                  IconButton(
                    onPressed: () =>
                        Navigator.pushNamed(context, '/profile_page'),
                    icon: Icon(
                      Icons.account_circle,
                      color: Colors.white,
                    ),
                  ),
                  IconButton(
                    onPressed: () => Navigator.pushNamed(context, '/tracker'),
                    icon: Icon(
                      Icons.trip_origin,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
