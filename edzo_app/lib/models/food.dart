class Food {
  double carbo;
  double fat;
  String foodname;
  double kcal;
  String measure;
  double protein;
  double weight;

  Food.fromJSON(Map jsonMap) {
    this.carbo = jsonMap['carbo'];
    this.fat = jsonMap['fat'];
    this.foodname = jsonMap['foodname'];
    this.kcal = jsonMap['kcal'];
    this.measure = jsonMap['measure'];
    this.protein = jsonMap['protein'];
    this.weight = jsonMap['weight'];
  }
  Map<String, dynamic> toMap(Food food) {
    Map<String, dynamic> foodMap = Map<String, dynamic>();
    foodMap['carbo'] = this.carbo;
    foodMap['fat'] = this.fat;
    foodMap['foodname'] = this.foodname;
    foodMap['kcal'] = this.kcal;
    foodMap['measure'] = this.measure;
    foodMap['protein'] = this.protein;
    foodMap['weight'] = this.weight;

    return foodMap;
  }
}
