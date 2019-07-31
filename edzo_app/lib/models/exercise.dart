class Exercise {
  String calBurned;
  String exercisename;
  Exercise.fromJSON(Map jsonMap) {
    this.calBurned = jsonMap['calBurned'];
    this.exercisename = jsonMap['exercisename'];
  }
  Map<String, dynamic> toMap(Exercise exercise) {
    Map<String, dynamic> exerciseMap = Map<String, dynamic>();
    exerciseMap['calBurned'] = this.calBurned;
    exerciseMap['exercisename'] = this.exercisename;
    return exerciseMap;
  }
}
