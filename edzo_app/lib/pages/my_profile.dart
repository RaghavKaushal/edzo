import 'package:image_picker/image_picker.dart';
import 'dart:io';
import '../provider/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import './user_wogym.dart';
import 'package:barcode_scan/barcode_scan.dart';

class MyProfile extends StatefulWidget {
  // final String id;
  // MyProfile({this.id});

  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  // final String id;
  // _MyProfileState(this.id);

  File _storedImage;

  Future<void> _takePicture() async {
    final imageFile =
        await ImagePicker.pickImage(source: ImageSource.camera, maxHeight: 600);
  }

  String result = "Hey There";

  Future _scanQR() async {
    try {
      String qrResult = await BarcodeScanner.scan();
      setState(() {
        result = qrResult;
      });
    } on PlatformException catch (error) {
      if (error.code == BarcodeScanner.CameraAccessDenied) {
        setState(() {
          result = 'Camera Permission Denied';
        });
      } else {
        setState(() {
          result = "Unknown Error $error";
        });
      }
    } on FormatException {
      setState(() {
        result = "You pressed the back button before scanning anything";
      });
    } catch (error) {
      setState(() {
        result = "Unknown Error $error";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // final userID = ModalRoute.of(context).settings.arguments as String;
    final user = Provider.of<User>(context);
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
                child: IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: _takePicture,
                ),
              ),
            ),
            Consumer<User>(
              builder: (context, user, child) => Card(
                child: ListTile(
                  onTap: () {
                    Navigator.pushReplacementNamed(context, '/userinfo',
                        arguments: user.id);
                    print(user.id);
                  },
                  leading: Icon(
                    Icons.supervised_user_circle,
                    size: 20,
                    color: Colors.black,
                  ),
                  title: Text(
                    'Basic Information',
                    style:
                        TextStyle(fontSize: 10.0, fontWeight: FontWeight.bold),
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
            Card(
              child: ListTile(
                leading: Icon(Icons.scanner),
                title: Text('Scan for attendance'),
                onTap: () {
                  _scanQR;
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
