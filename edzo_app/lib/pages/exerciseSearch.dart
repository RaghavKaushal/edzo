import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edzo_app/pages/exercise_screen.dart';
import '../services/searchserviceExercise.dart';
import 'package:flutter/material.dart';

class SearchExercise extends StatefulWidget {
  @override
  _SearchExerciseState createState() => _SearchExerciseState();
}

class _SearchExerciseState extends State<SearchExercise> {
  var queryResultSet = [];
  var tempSearchStore = [];
  initiateSearch(String value) {
    if (value.length == 0) {
      setState(() {
        queryResultSet = [];
        tempSearchStore = [];
      });
    }
    var captilizedValue =
        value.substring(0, 1).toUpperCase() + value.substring(1);
    if (queryResultSet.length == 0 && value.length == 1) {
      SearchService().searchByName(value).then(
        (QuerySnapshot docs) {
          for (int i = 0; i < docs.documents.length; ++i) {
            queryResultSet.add(docs.documents[i].data);
          }
        },
      );
    } else {
      tempSearchStore = [];
      queryResultSet.forEach((element) {
        if (element['name'].startsWith(captilizedValue)) {
          setState(() {
            tempSearchStore.add(element);
          });
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              onChanged: (val) {
                initiateSearch(val);
              },
              decoration: InputDecoration(
                prefixIcon: IconButton(
                  color: Colors.black,
                  icon: Icon(Icons.arrow_back),
                  iconSize: 20.0,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                contentPadding: EdgeInsets.only(left: 25),
                hintText: 'Search Exercise',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4.0),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          GridView.count(
            padding: EdgeInsets.only(left: 10, right: 10),
            crossAxisCount: 2,
            crossAxisSpacing: 4,
            mainAxisSpacing: 4,
            primary: false,
            shrinkWrap: true,
            children: tempSearchStore.map((element) {
              return buildResultCard(element);
            }).toList(),
          )
        ],
      ),
    );
  }
}

// might have conflict in context....wrong context
Widget buildResultCard(data, {BuildContext context}) {
  var name = data['name'];
  var calBurned = data['calBurned'];
  return Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    elevation: 2.0,
    child: GestureDetector(
      onTap: () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (BuildContext context) => ExerciseScreen(
              name: name,
              calBurned: calBurned,
            ),
          ),
        );
      },
      child: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              Text(
                data['name'],
              ),
              Text(
                data['calBurned'].toString(),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
