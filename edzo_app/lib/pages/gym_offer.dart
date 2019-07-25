import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class GymOfferPage extends StatelessWidget {
//Previous buildmethod
  DecorationImage _buildBackgroundImage() {
    return DecorationImage(
      fit: BoxFit.cover,
      colorFilter:
          ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.dstATop),
      image: AssetImage('assets/images/edzo_user.png'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Card(
              child: Flex(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(image: _buildBackgroundImage()),
                height: 200,
                //width: 350,
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                            alignment: Alignment.topLeft,
                            child: Icon(Icons.arrow_back)),
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
      bottomSheet: RaisedButton(
        splashColor: Colors.pinkAccent,
        color: Colors.pinkAccent,
        child: Text(
          'Done',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        onPressed: () {},
      ),
    );
  }
}
