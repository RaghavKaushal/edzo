import 'package:flutter/material.dart';
import 'exerciseSearch.dart';

class ExerciseScreen extends StatelessWidget {
  final name;
  final calBurned;
  ExerciseScreen({this.name, this.calBurned});
  bool isPresent = false;
  @override
  Widget build(BuildContext context) {
    if (calBurned != null) {
      isPresent = true;
    }
    return Scaffold(
      body: new SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Card(
              child: ListTile(
                // onTap: () {
                //   Navigator.pushReplacement(
                //     context,
                //     MaterialPageRoute(
                //       builder: (BuildContext context) => SearchExercise(),
                //     ),
                //   );
                // },
                leading: Text('Exercise'),
                title: Text('data'),
                //isPresent ? Text('0Kcal') : Text(calBurned),
                trailing: DropdownButton(
                  onChanged: (_) {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (
                          BuildContext context,
                        ) =>
                            SearchExercise(),
                      ),
                    );
                  },
                  items: [
                    DropdownMenuItem(
                      value: "1",
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Icon(Icons.build),
                          SizedBox(width: 10),
                          Text(
                            "Add Exercise",
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
