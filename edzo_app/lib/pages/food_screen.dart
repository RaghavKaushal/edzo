import 'package:edzo_app/pages/firestore.dart';
import 'package:edzo_app/services/exercise.dart';
import 'package:flutter/material.dart';

class FoodScreen extends StatefulWidget {
  @override
  _FoodScreenState createState() => _FoodScreenState();
}

class _FoodScreenState extends State<FoodScreen> {
  double _bodyHeight = 0.0;
  @override
  Widget build(BuildContext context) {
    // print();
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
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) => Search(),
                          ),
                        );
                      },
                      child: Container(
                        color: Colors.black38,
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
                    Icon(Icons.add),
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
                    Icon(Icons.add),
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
                    Icon(Icons.add),
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
                    Icon(Icons.add),
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
