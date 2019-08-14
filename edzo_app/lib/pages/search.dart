import 'package:flutter/material.dart';

class Search extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    //Actions for appBar
    return [
      IconButton(
        onPressed: () {},
        icon: Icon(Icons.clear),
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    //leading icon on left of appBar

    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.arrow_menu,
        progress: transitionAnimation,
      ),
      onPressed: () {},
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // show some result based on selection
    return null;
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Show when someone searches
    return null;
  }
}
