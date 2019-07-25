import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './user_wogym.dart';
import '../provider/users.dart';

class MyProfile extends StatelessWidget {
  final String id;
  MyProfile({this.id});
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
        title: Text(
          'My Profile',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Card(
              child: Container(
                height: 180,
                alignment: Alignment.topRight,
                child: Icon(Icons.edit),
              ),
            ),
            Card(
              child: ListTile(
                onTap: () {
                  Navigator.pushReplacementNamed(context, '/userinfo',
                      arguments: id);
                },
                leading: Icon(
                  Icons.supervised_user_circle,
                  size: 20,
                  color: Colors.black,
                ),
                title: Text(
                  'Basic Information',
                  style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  'Update your Basic Information',
                  style: TextStyle(fontSize: 15),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black,
                ),
              ),
            ),
            Card(
              child: ListTile(
                onTap: () {
                  Navigator.pushReplacementNamed(context, '/goal');
                },
                leading: Icon(
                  Icons.dashboard,
                  size: 30,
                  color: Colors.black,
                ),
                title: Text(
                  'Goal',
                  style: TextStyle(fontSize: 12.0),
                ),
                subtitle: Text(
                  'Update your Goal',
                  style: TextStyle(fontSize: 20),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black,
                ),
              ),
            ),
            Card(
              child: ListTile(
                onTap: () {
                  Navigator.pushReplacementNamed(context, '/medcond');
                },
                leading: Icon(
                  Icons.add_alert,
                  size: 30,
                  color: Colors.black,
                ),
                title: Text(
                  'Medical Conditions',
                  style: TextStyle(fontSize: 12.0),
                ),
                subtitle: Text(
                  'Update your Medical Condition',
                  style: TextStyle(fontSize: 20),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black,
                ),
              ),
            ),
            Card(
              child: ListTile(
                onTap: () {
                  Navigator.pushReplacementNamed(context, '/foodpref');
                },
                leading: Icon(
                  Icons.fastfood,
                  size: 30,
                  color: Colors.black,
                ),
                title: Text(
                  'Food Preferences',
                  style: TextStyle(fontSize: 12.0),
                ),
                subtitle: Text(
                  'Update your Food Preferences',
                  style: TextStyle(fontSize: 20),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
