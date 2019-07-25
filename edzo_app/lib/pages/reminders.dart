import 'package:flutter/material.dart';

class RemindersPage extends StatefulWidget {
  @override
  _RemindersPageState createState() => _RemindersPageState();
}

class _RemindersPageState extends State<RemindersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Reminders',
          style: TextStyle(color: Colors.white),
        ),
        bottom: AppBar(
          leading: Icon(Icons.arrow_back),
        ),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              height: 70,
              margin: EdgeInsets.all(10),
              color: Color(0xFFFFA500),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text(
                    'Food',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  Icon(Icons.format_color_fill)
                ],
              ),
            ),
            Container(
              height: 70,
              margin: EdgeInsets.all(10),
              color: Color(0xFFFFA500),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text(
                    'Exercise',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  Icon(Icons.format_color_fill)
                ],
              ),
            ),
            Container(
              height: 70,
              margin: EdgeInsets.all(10),
              color: Color(0xFFFFA500),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text(
                    'Water',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  Icon(Icons.format_color_fill)
                ],
              ),
            ),
            Container(
              height: 70,
              margin: EdgeInsets.all(10),
              color: Color(0xFFFFA500),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text(
                    'Medicine',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  Icon(Icons.format_color_fill)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
