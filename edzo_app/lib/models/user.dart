// import 'package:flutter/material.dart';
// import 'package:flutter/foundation.dart';

import 'package:flutter/widgets.dart';

class User with ChangeNotifier {
  String id = DateTime.now().toIso8601String();
  final String username;
  final int age;
  final String sex;
  final double weight;
  final double height;
  final double chest;
  final double shoulder;
  final double forearm;
  final double hip;
  final double waist;
  final String email;
  final int contact;
  bool isallotedgym;
  bool isauth;

  User(
      {this.id,
      this.username,
      this.age,
      this.sex,
      this.isallotedgym,
      this.contact,
      this.email,
      this.weight = 0.0,
      this.height = 0.0,
      this.chest = 0.0,
      this.shoulder = 0.0,
      this.forearm = 0.0,
      this.hip = 0.0,
      this.waist = 0.0,
      this.isauth});
}
