import 'package:flutter/material.dart';

class ScreenFour extends StatefulWidget {
  ScreenFour({Key key, String title}) : super(key: key);

  _ScreenFourState createState() => _ScreenFourState();
}

class _ScreenFourState extends State<ScreenFour> {
  static bool buttn_state = false;
  static Color buttn_color = Colors.grey;
  final List<bool> forToggleButton = [false, false];
  static String suff = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black54,
        title: Text('Step 4 of 8'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if(buttn_state == true){
            Navigator.pushNamed(context, '/fifth_screen');
          }
          else{
            return  null;
          }
        },
        backgroundColor: buttn_color,
        child: Icon(
          Icons.arrow_forward_ios,
          color: Colors.grey[200],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 75,
        ),
        child: Center(
          child: Column(
            children: <Widget>[
              Text(
                'How tall are you ?',
                style: TextStyle(
                  fontSize: 35,
                  fontFamily: 'fonts/Roboto-Bold.ttf',
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 55,
              ),
              SizedBox(
                width: 175,
                height: 70,
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      if(value.length == 3){
                        buttn_state = true;
                        buttn_color = Colors.black54;
                      }
                      else{
                        buttn_state = false;
                        buttn_color = Colors.grey;
                      }
                    });
                  },
                  maxLength: 3,
                  decoration: InputDecoration(
                    suffixText: 'cm',
                    suffixStyle: TextStyle(
                      fontSize: 20,
                    ),
                    hintText: '175',
                    hintStyle: TextStyle(
                      color: Colors.grey[500],
                    ),
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    border: InputBorder.none,
                  ),
                  keyboardType: TextInputType.number,
                  cursorColor: Colors.white,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 85,
                    color: Colors.black54,
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              ToggleButtons(
                splashColor: Colors.transparent,
                constraints: BoxConstraints(
                  minWidth: 100,
                  minHeight: 35,
                ),
                borderRadius: BorderRadius.circular(30),
                children: <Widget>[
                  Text('FT'),
                  Text('CM'),
                ],
                onPressed: (int index) {
                  setState(() {
                    if (index == 0) {
					  suff = 'FT';
                      forToggleButton[0] = true;
                      forToggleButton[1] = false;
                    } else {
					  suff = 'CM';
                      forToggleButton[1] = true;
                      forToggleButton[0] = false;
                    }
                  });
                },
                isSelected: forToggleButton,
              )
            ],
          ),
        ),
      ),
    );
  }
}