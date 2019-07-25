import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './my_profile.dart';
import '../provider/users.dart';

class FoodPref extends StatefulWidget {
  @override
  _FoodPrefState createState() => _FoodPrefState();
}

class _FoodPrefState extends State<FoodPref> {
  void _toggleSelectedfoodpref() {
    bool isSelected = false;

    isSelected = !isSelected;
    //notifyListeners();
  }

  Color color1;
  Color color2;
  Color color3;
  Color color4;
  Color color5;
  Color color6;
  Color color7;
  Color color8;
  Color color9;
  Color color10;

  @override
  void initState() {
    super.initState();

    color1 = Colors.transparent;
    color2 = Colors.transparent;
    color3 = Colors.transparent;
    color4 = Colors.transparent;
    color5 = Colors.transparent;
    color6 = Colors.transparent;
    color7 = Colors.transparent;
    color8 = Colors.transparent;
    color9 = Colors.transparent;
    color10 = Colors.transparent;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/profile');
          },
        ),
        title: Text('Food Preference'),
        bottom: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            'Please select Food Preference',
            textAlign: TextAlign.center,
          ),
          backgroundColor: Colors.white30,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              color: color1,
              child: ListTile(
                enabled: true,
                onTap: () {
                  setState(() {
                    color1 = Colors.pinkAccent;
                    _toggleSelectedfoodpref();
                  });
                },
                title: Text('Burger'),
              ),
            ),
            Container(
              color: color2,
              child: ListTile(
                enabled: true,
                onTap: () {
                  setState(() {
                    color2 = Colors.pinkAccent;
                    _toggleSelectedfoodpref();
                  });
                },
                title: Text('Nachos'),
              ),
            ),
            Container(
              color: color3,
              child: ListTile(
                enabled: true,
                onTap: () {
                  setState(() {
                    color3 = Colors.pinkAccent;
                    _toggleSelectedfoodpref();
                  });
                },
                title: Text('Pizza'),
              ),
            ),
            Container(
              color: color4,
              child: ListTile(
                enabled: true,
                onTap: () {
                  setState(() {
                    color4 = Colors.pinkAccent;
                    _toggleSelectedfoodpref();
                  });
                },
                title: Text('Cheese Cake'),
              ),
            ),
            Container(
              color: color5,
              child: ListTile(
                enabled: true,
                onTap: () {
                  setState(() {
                    color5 = Colors.pinkAccent;
                    _toggleSelectedfoodpref();
                  });
                },
                title: Text('Choco Lava Cake'),
              ),
            ),
            Container(
              color: color6,
              child: ListTile(
                enabled: true,
                onTap: () {
                  setState(() {
                    color6 = Colors.pinkAccent;
                    _toggleSelectedfoodpref();
                  });
                },
                title: Text('Oreo shake'),
              ),
            ),
            Container(
              color: color7,
              child: ListTile(
                enabled: true,
                onTap: () {
                  setState(() {
                    color7 = Colors.pinkAccent;
                    _toggleSelectedfoodpref();
                  });
                },
                title: Text('Sandwich'),
              ),
            ),
            Container(
              color: color8,
              child: ListTile(
                enabled: true,
                onTap: () {
                  setState(() {
                    color8 = Colors.pinkAccent;
                    _toggleSelectedfoodpref();
                  });
                },
                title: Text('Ice Cream'),
              ),
            ),
            Container(
              color: color9,
              child: ListTile(
                enabled: true,
                onTap: () {
                  setState(() {
                    color9 = Colors.pinkAccent;
                    _toggleSelectedfoodpref();
                  });
                },
                title: Text('Paneer'),
              ),
            ),
            Container(
              color: color10,
              child: ListTile(
                enabled: true,
                onTap: () {
                  setState(() {
                    color10 = Colors.pinkAccent;
                    _toggleSelectedfoodpref();
                  });
                },
                title: Text('Ptani XD'),
              ),
            ),
            ListTile(
              title: TextFormField(
                decoration: InputDecoration(labelText: 'Any other (Specify)'),
              ),
            ),
            SizedBox(height: 143),
            ButtonTheme(
              buttonColor: Colors.pinkAccent,
              height: 57.0,
              minWidth: double.infinity,
              child: MaterialButton(
                color: Colors.pinkAccent,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyProfile()),
                  );
                },
                child: Text(
                  'Done',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
