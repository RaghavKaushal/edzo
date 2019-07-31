import 'package:http/http.dart';
import 'dart:convert';
import '../models/exercise.dart';
import '../models/food.dart';

final String baseUrl = 'https://edzo-7ea7e.firebaseio.com/';

Future<List<Exercise>> getExercise(String type) async {
  Response response = await get('$baseUrl/db5/exercise?type=$type');
  if (response.statusCode == 200) {
    final List movies = (jsonDecode(response.body));
    return movies.map((val) => Exercise.fromJSON(val)).toList();
  } else {
    return [];
  }
}

Future<List<Food>> getFood(String type) async {
  Response response = await get('$baseUrl/db5/foods?type=$type');
  if (response.statusCode == 200) {
    final List food = (jsonDecode(response.body));
    return food.map((val) => Food.fromJSON(val)).toList();
  } else {
    return [];
  }
}
