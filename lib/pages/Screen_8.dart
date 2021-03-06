import 'package:flutter/material.dart';

class ScreenEight extends StatefulWidget {
  ScreenEight({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ScreenEightState createState() => _ScreenEightState();
}

class _ScreenEightState extends State<ScreenEight>
    with SingleTickerProviderStateMixin {
  static String _choice = 'I rarely/never exercise';
  static double _dig = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        splashColor: Colors.transparent,
        child: Icon(
          Icons.arrow_forward_ios,
          color: Colors.white,
          ),
        onPressed: () => Navigator.pushNamed(context, '/home_page'),
        ),
        appBar: AppBar(
          title: Text('Step 8 of 8'),
        ),
        body: Padding(
          padding: EdgeInsets.only(
            bottom: 470,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'How often do you exercise ?',
                style: TextStyle(
                  fontFamily: 'fonts/Roboto-Bold.ttf',
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
              SizedBox(
                height: 22,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 65,
                ),
                child: Text(
                  _choice,
                  style: TextStyle(
                    fontFamily: 'fonts/Roboto-Light.ttf',
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              SliderTheme(
                data: SliderThemeData(
                  tickMarkShape: RoundSliderTickMarkShape(),
                  inactiveTickMarkColor: Colors.black,
                  thumbColor: Colors.black54,
                  trackShape: RoundedRectSliderTrackShape(),
                  activeTrackColor: Colors.black,
                  inactiveTrackColor: Colors.grey[350],
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                    right: 25,
                    left: 25,
                  ),
                  child: Slider(
                    value: _dig,
                    divisions: 4,
                    min: 0,
                    max: 40,
                    onChanged: (double value) {
                      setState(() {
                        _dig = value;
                        if (_dig == 10) {
                          _choice = 'I exercise 1-3 times a week';
                        } else if (_dig == 20) {
                          _choice = 'I exercise 3-5 times a week';
                        } else if (_dig == 30) {
                          _choice = 'I exercise 6-7 times a week';
                        } else if (_dig == 0) {
                          _choice = 'I rarely/never exercise';
                        } else {
                          _choice = 'I exercise several times a week';
                        }
                      });
                    },
                  ),
                ),
              ),
              ListTile(
                leading: Text(
                  'BEGINNER',
                  style: TextStyle(
                    fontFamily: 'fonts/Roboto-Light.ttf',
                    fontSize: 14,
                    color: Colors.grey[350],
                  ),
                ),
                trailing: Text(
                  'ADVANCED',
                  style: TextStyle(
                    fontFamily: 'fonts/Roboto-Light.ttf',
                    fontSize: 14,
                    color: Colors.grey[350],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}