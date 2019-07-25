import 'package:edzo_app/pages/insights.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './user_wogym.dart';

class SummaryPage extends StatefulWidget {
  @override
  _SummaryPageState createState() => _SummaryPageState();
}

class _SummaryPageState extends State<SummaryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => UserwoGym()),
            );
          },
        ),
        centerTitle: true,
        title: Text(
          'Summary',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        bottom: AppBar(
          automaticallyImplyLeading: false,
          title: Text('date'),
        ),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(10),
              height: 70,
              color: Color(0xFFFF1919),
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.filter_hdr,
                    size: 20,
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  Text(
                    'Target Achieved',
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                  SizedBox(
                    width: 170,
                  ),
                  Text(
                    '0%',
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              height: 70,
              color: Color(0xFF0000E1),
              child: ListTile(
                leading: Icon(Icons.bubble_chart),
                title: Text(
                  'My Insights',
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
                subtitle: Text(
                  'View',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => InsightsPage()),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
