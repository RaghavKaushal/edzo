import 'package:flutter/material.dart';

class BMI extends StatefulWidget {
  @override
  _BMIState createState() => _BMIState();
}

class _BMIState extends State<BMI> {
  Future bmiPopUp(BuildContext context) async {
    double _value;
    onChanged(
      double value,
    ) {
      setState(() {
        _value = value;
        debugPrint(_value.toString());
      });
    }

    await showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            backgroundColor: Colors.amber,
            contentPadding: EdgeInsets.all(0),
            children: <Widget>[
              SimpleDialogOption(
                child: Container(
                  height: 300,
                  width: 600,
                  color: Colors.amber,
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.accessibility,
                              size: 60,
                            ),
                            Text(
                              'BMI',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 50),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Container(
                        // color: Colors.brown,// setting height
                        child: Text(
                            'Calculates BMI, lorem ipsum coming in 3..2...1..sdfjblSYfsKGVfhtesfddsyfdhysdfvsytfdk',
                            style:
                                TextStyle(color: Colors.white, fontSize: 20)),
                      ),
                      Container(
                        child: LinearProgressIndicator(
                          value: _value,
                          semanticsLabel: 'Target',
                          semanticsValue: '2500/2700',
                          backgroundColor: Colors.white,
                          valueColor: AlwaysStoppedAnimation<Color>(
                              Colors.pinkAccent[200]),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(
        child: Text('CLICK ME !!!!!!!!!!'),
        onPressed: () {
          bmiPopUp(context);
        },
      ),
    );
  }
}
