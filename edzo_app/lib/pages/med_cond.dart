import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

import 'package:scoped_model/scoped_model.dart';

class MedicalCondition extends StatefulWidget {
  @override
  _MedicalConditionState createState() => _MedicalConditionState();
}

class _MedicalConditionState extends State<MedicalCondition> {
  void _toggleSelectedMedCond() {
    bool isCurrentlySelected = false;

    isCurrentlySelected = !isCurrentlySelected;
    //notifyListeners();
  }

  Color color1;
  Color color2;
  Color color3;
  Color color4;
  Color color5;

  @override
  void initState() {
    super.initState();

    color1 = Colors.transparent;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/profile');
          },
        ),
        title: Text('Medical Conditions'),
        bottom: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            'Any Medical Conditions??',
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
                    _toggleSelectedMedCond();
                  });
                },
                title: Text('Asthma'),
              ),
            ),
            Container(
              color: color2,
              child: ListTile(
                enabled: true,
                onTap: () {
                  setState(() {
                    color2 = Colors.pinkAccent;
                    _toggleSelectedMedCond();
                  });
                },
                title: Text('Asthma'),
              ),
            ),
            Container(
              color: color3,
              child: ListTile(
                enabled: true,
                onTap: () {
                  setState(() {
                    color3 = Colors.pinkAccent;
                    _toggleSelectedMedCond();
                  });
                },
                title: Text('Asthma'),
              ),
            ),
            Container(
              color: color4,
              child: ListTile(
                enabled: true,
                onTap: () {
                  setState(() {
                    color4 = Colors.pinkAccent;
                    _toggleSelectedMedCond();
                  });
                },
                title: Text('Asthma'),
              ),
            ),
            Container(
              color: color5,
              child: ListTile(
                enabled: true,
                onTap: () {
                  setState(() {
                    color5 = Colors.pinkAccent;
                    _toggleSelectedMedCond();
                  });
                },
                title: Text('Asthma'),
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
                onPressed: () {},
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
