import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

@override
Widget build(BuildContext context) {
  Stream<QuerySnapshot> getAllCyclingExecises() {
    return Firestore.instance.collection('exercise').snapshots();
  }

  return StreamBuilder<QuerySnapshot>(
      stream: getAllCyclingExecises(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        return new ListView.builder(
          itemBuilder: (BuildContext ctxt, int index) =>
              Text(snapshot.data.toString()),
          itemCount: 2,
        );
        // snapshot.data.documents.elementAt(index) -> this gives document stored at a given
        // index as received from the search query
      });
}
