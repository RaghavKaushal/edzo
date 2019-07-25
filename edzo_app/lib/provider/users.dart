import 'dart:convert';

import 'package:flutter/material.dart';
import '../models/user.dart';
import 'package:http/http.dart' as http;

class Users with ChangeNotifier {
  List<User> _userslist = [
    User(
        age: 20,
        chest: 20,
        contact: 9560160352,
        email: 'raghavakaushal@gmail.com',
        forearm: 20,
        height: 181,
        hip: 21,
        name: 'raghav',
        shoulder: 20,
        waist: 20,
        weight: 82,
        id: '1'),
    User(
        age: 20,
        chest: 20,
        contact: 9560160352,
        email: 'raghavakaushalfam@gmail.com',
        forearm: 20,
        height: 181,
        hip: 21,
        name: 'raghav',
        shoulder: 20,
        waist: 20,
        weight: 82,
        id: '2'),
    User(
        age: 20,
        chest: 20,
        contact: 9560160352,
        email: 'raghavakaushalfam@gmail.com',
        forearm: 20,
        height: 181,
        hip: 21,
        name: 'raghafdsdv',
        shoulder: 20,
        waist: 20,
        weight: 82,
        id: '3')
  ];

  final String authToken;

  Users(this.authToken, this._userslist);

  List<User> get userlist {
    return [..._userslist];
  }

  Future<void> updateUser(String id, User newUser) async {
    final userIndex = _userslist.indexWhere((user) => user.id == id);
    if (userIndex >= 0) {
      final url =
          'https://emailingdemo-a6ca1.firebaseio.com/user/$id.json?auth=$authToken';
      await http.patch(url,
          body: json.encode({
            'name': newUser.name,
            'age': newUser.age,
            'email': newUser.email,
            'contact': newUser.contact,
            'sex': newUser.sex,
            'height': newUser.height,
            'weight': newUser.weight,
          }));
      _userslist[userIndex] = newUser;
      notifyListeners();
    }
  }

  User findById(String id) {
    return _userslist.firstWhere((prod) => prod.id == id);
  }

  Future<void> fetchandssetuser() async {
    final url =
        'https://emailingdemo-a6ca1.firebaseio.com/user.json?auth=$authToken';
    try {
      final response = await http.get(url);
      print(json.decode(response.body));
      final List<User> loadedUser = [];
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      extractedData.forEach((userID, userData) {
        loadedUser.add(User(
            id: userID,
            age: userData['age'],
            contact: userData['contact'],
            email: userData['email'],
            weight: userData['weight'],
            height: userData['height']));
      });
      _userslist = loadedUser;
      notifyListeners();
    } catch (error) {
      throw (error);
    }
  }

  Future<void> addUser(User user) async {
    final url =
        'https://emailingdemo-a6ca1.firebaseio.com/user.json?auth=$authToken';
    try {
      final response = await http.post(
        url,
        body: json.encode({
          'name': user.name,
          'age': user.age,
          'contact': user.contact,
          'email': user.email,
          'weight': user.weight,
          'height': user.height
        }),
      );
      final newUser = User(
          name: user.name,
          age: user.age,
          contact: user.contact,
          email: user.email,
          weight: user.weight,
          chest: user.chest,
          forearm: user.forearm,
          height: user.height,
          hip: user.hip,
          shoulder: user.shoulder,
          waist: user.waist,
          isauth: true,
          id: json.decode(response.body)['name']);
      _userslist.add(newUser);
      notifyListeners();
    } catch (error) {
      throw (error);
    }
  }
}

//json.decode(response.body)['name']
