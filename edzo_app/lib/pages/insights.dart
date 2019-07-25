import 'dart:convert';
import 'package:edzo_app/pages/my_profile.dart';
import 'package:edzo_app/pages/user_wogym.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/calories_bar.dart';
import '../provider/Users.dart';
import '../models/user.dart';

class InsightsPage extends StatelessWidget {
  final String id;
  final double height;
  final double weight;
  final int age;
  final String sex;
  InsightsPage({this.id, this.height, this.weight, this.age, this.sex});
  @override
  // double _value1;
  // double _value2;
  // double _value3;
  // double _value4;
  // double _value5;
  // double _value6;
  // onChanged(double value1, value2, value3, value4, value5, value6) {
  //   // setState(() {
  //   //   _value1 = value1;
  //   //   _value2 = value2;
  //   //   _value3 = value3;
  //   //   _value4 = value4;
  //   //   _value5 = value5;
  //   //   _value6 = value6;
  //   //   debugPrint(_value1.toString());
  //   // });
  // }

//BMI POPUP

  bmiPopUp(BuildContext context) {
    final double bmi = weight / (height * height);

    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            backgroundColor: Colors.amber,
            contentPadding: EdgeInsets.all(0),
            children: <Widget>[
              SimpleDialogOption(
                child: Container(
                  height: 400,
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
                      Container(
                        // color: Colors.brown,// setting height
                        child: Text(
                            'Calculates BMI, lorem ipsum coming in 3..2...1..sdfjblSYfsKGVfhtesfddsyfdhysdfvsytfdk',
                            style:
                                TextStyle(color: Colors.white, fontSize: 20)),
                      ),
                      Container(
                        child: Text(bmi.toString()),
                      ),
                      // ADD A CHART BAR
                      Container(
                          // child: CaloriesBar(currentcal, percentcal),
                          ),
                    ],
                  ),
                ),
              )
            ],
          );
        });
  }

//bmr popup
  bmrPopUp(BuildContext context) {
    double bmrMale;
    double bmrFemale;
    double bmrformale(double w, double h, int a, String s) {
      if (s == 'M' || s == 'm') {
        bmrMale = 66 + (13.7 * weight) + (5 * height) - (6.8 * age);
        return bmrMale;
      } else if (s == 'F' || s == 'f') {
        bmrFemale = 655 + (9.6 * weight) + (1.8 * height) - (4.7 * age);
      }
    }

    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            backgroundColor: Color(0xFFFF00D2),
            contentPadding: EdgeInsets.all(0),
            children: <Widget>[
              SimpleDialogOption(
                child: Container(
                  height: 300,
                  width: 600,
                  color: Color(0xFFFF00D2),
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
                              'BMR',
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
                          //value: _value1,
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

  // Ideal Weight
  idealWeightPopUp(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            backgroundColor: Color(0xFF00FF2D),
            contentPadding: EdgeInsets.all(0),
            children: <Widget>[
              SimpleDialogOption(
                child: Container(
                  height: 300,
                  width: 600,
                  color: Color(0xFF00FF2D),
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
                              'Ideal Weight',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 35),
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
                      SizedBox(
                        height: 100,
                      ),
                      Container(
                        child: LinearProgressIndicator(
                          //  value: _value1,
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
// WATER REQUIREMENT

  waterRequirementPopUp(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            backgroundColor: Color(0xFFEA005F),
            contentPadding: EdgeInsets.all(0),
            children: <Widget>[
              SimpleDialogOption(
                child: Container(
                  height: 300,
                  width: 600,
                  color: Color(0xFFEA005F),
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
                              'Water Requirement',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 25),
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
                      SizedBox(
                        height: 100,
                      ),
                      Container(
                        child: LinearProgressIndicator(
                          //  value: _value1,
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

  //Daily Calories

  dailyCaloriesPopUp(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            backgroundColor: Color(0xFFEA005F),
            contentPadding: EdgeInsets.all(0),
            children: <Widget>[
              SimpleDialogOption(
                child: Container(
                  height: 300,
                  width: 600,
                  color: Color(0xFFEA005F),
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
                              'Water Requirement',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 25),
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
                      SizedBox(
                        height: 100,
                      ),
                      Container(
                        child: LinearProgressIndicator(
                          //  value: _value1,
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

  // Body Weight %

  //Daily Calories

  bodyfatPopUp(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            backgroundColor: Color(0xFF00EA8B),
            contentPadding: EdgeInsets.all(0),
            children: <Widget>[
              SimpleDialogOption(
                child: Container(
                  height: 300,
                  width: 600,
                  color: Color(0xFF00EA8B),
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
                              'Water Requirement',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 25),
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
                      SizedBox(
                        height: 100,
                      ),
                      Container(
                        child: LinearProgressIndicator(
                          // value: _value1,
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
    final userData = Provider.of<Users>(context);
    final userid = userData.userlist;
    print(userid);
    // print(json.decode(userData.toString()));
    // final userL = userData.
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/summary');
          },
        ),
        title: Text(
          'Insights',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    bmiPopUp(context);
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 25, top: 10),
                    height: 170,
                    width: 170,
                    color: Colors.red,
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      'BMI',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 25),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    bmrPopUp(context);
                  },
                  child: Container(
                    margin: EdgeInsets.only(
                      right: 25,
                      top: 10,
                    ),
                    height: 170,
                    width: 170,
                    color: Colors.blue,
                    alignment: Alignment.bottomCenter,
                    child: Text('BMR',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 25)),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    idealWeightPopUp(context);
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 25, top: 10),
                    height: 170,
                    width: 170,
                    color: Colors.deepOrange,
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      'Ideal Weight',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 25),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    waterRequirementPopUp(context);
                  },
                  child: Container(
                    margin: EdgeInsets.only(right: 25, top: 10),
                    height: 170,
                    width: 170,
                    color: Colors.purple,
                    alignment: Alignment.bottomCenter,
                    child: Text('Water Requirement',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 25)),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    dailyCaloriesPopUp(context);
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 25, top: 10),
                    height: 170,
                    width: 170,
                    color: Colors.yellow,
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      'Daily Calories',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 25),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    bodyfatPopUp(context);
                  },
                  child: Container(
                    margin: EdgeInsets.only(right: 25, top: 10),
                    height: 170,
                    width: 170,
                    color: Colors.cyan,
                    alignment: Alignment.bottomCenter,
                    child: Text('Body fat %',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 25)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomSheet: ButtonTheme(
        buttonColor: Colors.pinkAccent,
        // height: 57.0,
        minWidth: double.infinity,
        child: MaterialButton(
          height: 50,
          color: Colors.pinkAccent,
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MyProfile(),
                ));
          },
          child: Text(
            'Done',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
