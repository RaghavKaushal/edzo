import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_fluid_slider/flutter_fluid_slider.dart';

class GoalPage extends StatefulWidget {
  @override
  _GoalPageState createState() => _GoalPageState();
}

class _GoalPageState extends State<GoalPage> {
  double _value = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Goals',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/profile');
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.all(5.0),
              height: 250,
              width: 500,
              color: Colors.red,
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 0, top: 10, right: 250),
                    //   color: Colors.blue, //for setting the container
                    child: Text(
                      'Weight',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 170),
                    // color: Colors.yellow, // for setting the container
                    child: Text(
                      'Current Weight: ',
                      style: TextStyle(color: Colors.white),
                    ), //make it a row
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 170),
                    child: Text(
                      'Select monthly goal',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    child: FluidSlider(
                      thumbColor: Colors.white,
                      sliderColor: Colors.red,
                      onChanged: (double newValue) {
                        setState(() {
                          _value = newValue;
                          debugPrint(_value.toString());
                        });
                      },
                      value: _value,
                      max: 150,
                      onChangeStart: (double startValue) {
                        _value = startValue;
                      },
                      onChangeEnd: (double endValue) {
                        _value = endValue;
                      },
                    ),
                  )
                ],
              ),
            ),
            Container(
              color: Colors.deepOrange,
              alignment: Alignment.topLeft,
              height: 250,
              width: 500,
              margin: EdgeInsets.all(5),
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 5),
                    child: Text(
                      'Water',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: Text('Enter Daily Goal',
                        style: TextStyle(color: Colors.white)),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text('2.91', style: TextStyle(color: Colors.white))
                ],
              ),
            )
          ],
        ),
      ),
      bottomSheet: ButtonTheme(
        buttonColor: Colors.pinkAccent,
        height: 57.0,
        minWidth: double.infinity,
        child: MaterialButton(
          color: Colors.pinkAccent,
          onPressed: () {},
          child: Text(
            'Set Goal',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
