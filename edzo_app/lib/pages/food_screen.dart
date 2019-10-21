import 'package:edzo_app/pages/foodSearch.dart';
import 'package:edzo_app/pages/user_wogym.dart';
import 'package:flutter/material.dart';

class FoodScreen extends StatefulWidget {
  final carbo;
  final fat;
  final kcal;
  final protein;
  FoodScreen({this.carbo, this.fat, this.kcal, this.protein});
  @override
  _FoodScreenState createState() => _FoodScreenState();
}

class _FoodScreenState extends State<FoodScreen> {
  final carbo;
  final fat;
  final kcal;
  final protein;
  _FoodScreenState({this.carbo, this.fat, this.kcal, this.protein});
  // double _bodyHeightBreakfast = 0.0;
  // double _bodyHeightMidMorning = 0.0;
  // double _bodyHeightlunch = 0.0;
  // double _bodyHeightDinner = 0.0;
  double _bodyHeight = 0.0;
  @override
  Widget build(BuildContext context) {
    // var totalcarbo = 0;
    // var totalfat = 0;
    // var totalkcal = 0;
    // var totalprotein = 0;
    return new Scaffold(
      backgroundColor: Colors.white,
      body: new SingleChildScrollView(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Card(
              child: new Container(
                height: 50.0,
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    GestureDetector(
                      child: Container(
                        child: Text(
                          'BreakFast',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                          textDirection: TextDirection.ltr,
                        ),
                      ),
                    ),
                    new IconButton(
                      icon: new Icon(Icons.keyboard_arrow_down),
                      onPressed: () {
                        setState(() {
                          this._bodyHeight = 50.0;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            new Card(
              child: new AnimatedContainer(
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Add food'),
                    IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (BuildContext context) => SearchFood(),
                          ),
                        );
                      },
                    ),
                    new IconButton(
                      icon: new Icon(Icons.keyboard_arrow_up),
                      onPressed: () {
                        setState(() {
                          this._bodyHeight = 0.0;
                        });
                      },
                    ),
                  ],
                ),
                curve: Curves.easeInOut,
                duration: const Duration(milliseconds: 500),
                height: _bodyHeight,
                // color: Colors.red,
              ),
            ),
            new Card(
              child: new Container(
                height: 50.0,
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      'Mid Morning',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                      textDirection: TextDirection.ltr,
                    ),
                    new IconButton(
                      icon: new Icon(Icons.keyboard_arrow_down),
                      onPressed: () {
                        setState(() {
                          this._bodyHeight = 50.0;
                        });
                      },
                    )
                  ],
                ),
              ),
            ),
            new Card(
              child: new AnimatedContainer(
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (BuildContext context) => SearchFood(),
                          ),
                        );
                      },
                    ),
                    Text('Add food'),
                    new IconButton(
                      icon: new Icon(Icons.keyboard_arrow_up),
                      onPressed: () {
                        setState(() {
                          this._bodyHeight = 0.0;
                        });
                      },
                    ),
                  ],
                ),
                curve: Curves.easeInOut,
                duration: const Duration(milliseconds: 500),
                height: _bodyHeight,
                // color: Colors.red,
              ),
            ),
            new Card(
              child: new Container(
                height: 50.0,
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      'Lunch',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                      textDirection: TextDirection.ltr,
                    ),
                    new IconButton(
                      icon: new Icon(Icons.keyboard_arrow_down),
                      onPressed: () {
                        setState(() {
                          this._bodyHeight = 50.0;
                        });
                      },
                    )
                  ],
                ),
              ),
            ),
            new Card(
              child: new AnimatedContainer(
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (BuildContext context) => SearchFood(),
                          ),
                        );
                      },
                    ),
                    Text('Add food'),
                    new IconButton(
                      icon: new Icon(Icons.keyboard_arrow_up),
                      onPressed: () {
                        setState(() {
                          this._bodyHeight = 0.0;
                        });
                      },
                    ),
                  ],
                ),
                curve: Curves.easeInOut,
                duration: const Duration(milliseconds: 500),
                height: _bodyHeight,
                // color: Colors.red,
              ),
            ),
            new Card(
              child: new Container(
                height: 50.0,
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      'Supper',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                      textDirection: TextDirection.ltr,
                    ),
                    new IconButton(
                      icon: new Icon(Icons.keyboard_arrow_down),
                      onPressed: () {
                        setState(() {
                          this._bodyHeight = 50.0;
                        });
                      },
                    )
                  ],
                ),
              ),
            ),
            new Card(
              child: new AnimatedContainer(
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () {
                        UserwoGym(
                          proteinIntake: protein,
                        );
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (BuildContext context) => SearchFood(),
                          ),
                        );
                      },
                    ),
                    Text('Add food'),
                    new IconButton(
                      icon: new Icon(Icons.keyboard_arrow_up),
                      onPressed: () {
                        setState(() {
                          this._bodyHeight = 0.0;
                        });
                      },
                    ),
                  ],
                ),
                curve: Curves.easeInOut,
                duration: const Duration(milliseconds: 500),
                height: _bodyHeight,
                // color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
