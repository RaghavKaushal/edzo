import 'package:flutter/material.dart';
import './user_wogym.dart';

class GymServicesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
              child: Flex(
            children: <Widget>[
              Container(
                //decoration: BoxDecoration(image: _buildBackgroundImage()),
                height: 200,
                //width: 350,
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                            alignment: Alignment.topLeft,
                            child: IconButton(
                              icon: Icon(Icons.arrow_back),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => UserwoGym()),
                                );
                              },
                            )),
                        Container(
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.star),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    Container(
                      //height: 10,
                      child: Text(
                        'XYZ Gym',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      alignment: Alignment.bottomLeft,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      // height: 15,
                      child: Text(
                        'Dwarka, Sec 3',
                        //     style: TextStyle(
                        //       height: 10,
                      ),
                      //   ),
                      alignment: Alignment.bottomLeft,
                    ),
                  ],
                ),
              ),
            ],
            direction: Axis.vertical,
          )),
          Card(
            margin: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(8.0),
                  height: 50,
                  width: 80,
                  alignment: Alignment.center,
                  child: Text(
                    'Cross-fit',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  decoration: BoxDecoration(color: Colors.pinkAccent),
                ),
                Container(
                  margin: EdgeInsets.all(8.0),
                  height: 50,
                  width: 80,
                  alignment: Alignment.center,
                  child: Text(
                    'Weight Training',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  decoration: BoxDecoration(color: Colors.red),
                ),
                Container(
                  margin: EdgeInsets.all(8.0),
                  height: 50,
                  width: 80,
                  alignment: Alignment.center,
                  child: Text(
                    'HIIT training',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  decoration: BoxDecoration(color: Colors.deepOrange),
                ),
              ],
            ),
          ),
          Card(
            child: Column(
              children: <Widget>[
                ListTile(
                  title: TextFormField(
                    autofocus: true,
                    cursorColor: Colors.pink,
                    decoration: InputDecoration(labelText: 'Service Name'),
                  ),
                ),
                ListTile(
                  title: TextFormField(
                    autofocus: true,
                    cursorColor: Colors.pink,
                    decoration: InputDecoration(labelText: 'Offer Price'),
                  ),
                ),
                ListTile(
                  title: TextFormField(
                    autofocus: true,
                    cursorColor: Colors.pink,
                    decoration: InputDecoration(labelText: 'Orignal Price'),
                  ),
                ),
                ListTile(
                  title: TextFormField(
                    autofocus: true,
                    cursorColor: Colors.pink,
                    decoration: InputDecoration(labelText: 'Description'),
                  ),
                ),
                ListTile(
                  title: TextFormField(
                    autofocus: true,
                    cursorColor: Colors.pink,
                    decoration: InputDecoration(labelText: 'Duration'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      resizeToAvoidBottomPadding: false,
      bottomSheet: ButtonTheme(
        buttonColor: Colors.pinkAccent,
        height: 57.0,
        minWidth: double.infinity,
        child: MaterialButton(
          color: Colors.pinkAccent,
          onPressed: () {},
          child: Text(
            'Done',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
