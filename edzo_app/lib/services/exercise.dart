import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class Exercise {
  String name;
  int calBurned;

  Exercise({this.name, this.calBurned});
  factory Exercise.fromJSON(Map<dynamic, dynamic> exercise) =>
      Exercise(name: exercise['name'], calBurned: exercise['calBurned']);
}

@override
Widget build(BuildContext context) {
  return StreamBuilder<QuerySnapshot>(
    stream: Firestore.instance
        .collection("exercise")
        //  .where('name', isEqualTo: name)
        .snapshots(),
    builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
      return new ListView.builder(
        itemBuilder: (BuildContext ctxt, int index) =>
            Text(snapshot.data.toString()),
        itemCount: 2,
      );
    },
  );
}

//  Future<Exercise> getExercise(String userKey) async {
//    Completer<Exercise> completer = Completer<Exercise>();
//   String accountKey = await Preferences.getAccountKey();

//  FirebaseDatabase.instance
//     .reference()
//     .child("db5")
//     .child(accountKey)
//     .child("exercise")
//     .once()
//     .then((DataSnapshot snapshot) {
//   var exercise = new Exercise.fromSnapShot(snapshot.key, snapshot.value);
//   completer.complete(exercise);
// });

// return completer.future;
//   }
// }
//  }
