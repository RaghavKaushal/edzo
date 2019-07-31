import 'package:flutter/material.dart';
import '../helpers/httprequest.dart';
import '../models/http_exception.dart';
import '../models/exercise.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  String type = 'movie';
  Widget build(BuildContext context) {
    return Scaffold(
        // body: FutureBuilder<List<Exercise>>(
        //   initialData: List<Exercise>(0),
        //   future: getExercise(type),
        //   builder:               (BuildContext context, AsyncSnapshot<List<Exercise>> snapshot) =>
        //             StaggeredGridView.countBuilder(
        //               addAutomaticKeepAlives: true,
        //               itemCount: snapshot.data.length,
        //               primary: false,
        //               crossAxisCount: 4,
        //               mainAxisSpacing: 4.0,
        //               crossAxisSpacing: 4.0,
        //               itemBuilder: (context, index) =>
        //                   Tile(snapshot.data[index], changeTheme),
        //               staggeredTileBuilder: (index) => new StaggeredTile.fit(2),
        //             ),
        // ),
        );
  }
}

// import 'package:flutter/material.dart';
// import 'package:dio/dio.dart';

// class Search extends StatefulWidget {
//   @override
//   _SearchState createState() => _SearchState();
// }

// class _SearchState extends State<Search> {
//   @override
//   final TextEditingController _filter = new TextEditingController();
//   final dio = new Dio(); // for http requests
//   String _searchText = "";
//   List exercises = new List(); // exercises we get from API
//   List filteredExercises = new List(); // names filtered by search text
//   Icon _searchIcon = new Icon(Icons.search);
//   Widget _appBarTitle = new Text('Search Example');
//   final String baseUrl = 'https://edzo-7ea7e.firebaseio.com/db5/exercises';

//   _ExamplePageState() {
//     _filter.addListener(() {
//       if (_filter.text.isEmpty) {
//         setState(() {
//           _searchText = "";
//           filteredExercises = exercises;
//         });
//       } else {
//         setState(() {
//           _searchText = _filter.text;
//         });
//       }
//     });
//   }

//   @override
//   void initState() {
//     this._getExercises();
//     super.initState();
//   }

//   void _getExercises() async {
//     final response = await dio.get(baseUrl);
//     List tempList = new List();
//     for (int i = 0; i < response.data[''].length; i++) {
//       tempList.add(response.data['exercises'][i]);
//     }

//     setState(() {
//       exercises = tempList;
//       exercises.shuffle();
//       filteredExercises = exercises;
//     });
//   }

//   void _searchPressed() {
//     setState(() {
//       if (this._searchIcon.icon == Icons.search) {
//         this._searchIcon = new Icon(Icons.close);
//         this._appBarTitle = new TextField(
//           controller: _filter,
//           decoration: new InputDecoration(
//               prefixIcon: new Icon(Icons.search), hintText: 'Search...'),
//         );
//       } else {
//         this._searchIcon = new Icon(Icons.search);
//         this._appBarTitle = new Text('Search Example');
//         filteredExercises = exercises;
//         _filter.clear();
//       }
//     });
//   }

//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: _buildBar(context),
//       body: Container(
//         child: _buildList(),
//       ),
//       resizeToAvoidBottomPadding: false,
//     );
//   }

//   Widget _buildBar(BuildContext context) {
//     return new AppBar(
//       centerTitle: true,
//       title: _appBarTitle,
//       leading: new IconButton(
//         icon: _searchIcon,
//         onPressed: _searchPressed,
//       ),
//     );
//   }

//   Widget _buildList() {
//     if (!(_searchText.isEmpty)) {
//       List tempList = new List();
//       for (int i = 0; i < filteredExercises.length; i++) {
//         if (filteredExercises[i]['exercises']
//             .toLowerCase()
//             .contains(_searchText.toLowerCase())) {
//           tempList.add(filteredExercises[i]);
//         }
//       }
//       filteredExercises = tempList;
//     }
//     return ListView.builder(
//       itemCount: exercises == null ? 0 : filteredExercises.length,
//       itemBuilder: (BuildContext context, int index) {
//         return new ListTile(
//           title: Text(filteredExercises[index]['exercises']),
//           onTap: () => print(filteredExercises[index]['exercises']),
//         );
//       },
//     );
//   }
// }
