import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final friends = [
  'Aman',
  'Purnendu',
  'Vedant',
  'Gaurav',
  'Harsh',
  'Allu',
  'Shukla',
  'Kishore',
  'Gagan',
  'Faizan',
  'Pallav',
  'Birender'
];

final recentSearch = ['Gagan', 'Faizan', 'Pallav', 'Birender'];

class FriendSearch extends SearchDelegate<String?> {
  @override
  ThemeData appBarTheme(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;
    return theme.copyWith(
      appBarTheme: AppBarTheme(
        elevation: 1,
        brightness: colorScheme.brightness,
        backgroundColor: colorScheme.brightness == Brightness.dark
            ? Colors.grey[900]
            : Colors.white,
        iconTheme: theme.primaryIconTheme.copyWith(color: Colors.grey),
        textTheme: theme.textTheme,
      ),
      inputDecorationTheme: searchFieldDecorationTheme ??
          InputDecorationTheme(
            hintStyle: GoogleFonts.roboto(color: Colors.blueGrey.shade400),
            border: InputBorder.none,
          ),
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(
          Icons.clear,
          color: Colors.amber,
        ),
        onPressed: () {
          // addDocToFirebase();
          if (query.isEmpty) {
            close(context, null);
          } else {
            query = '';
            showSuggestions(context);
          }
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () => close(context, null),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
              radius: 50,
              child: Icon(
                Icons.person,
                size: 25,
              )),
          SizedBox(
            height: 20,
          ),
          Text(
            query,
            style: TextStyle(
                color: Colors.pink, fontSize: 34, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = query.isEmpty
        ? recentSearch
        : friends.where((element) {
            final friendL = element.toLowerCase();
            final queryL = query.toLowerCase();
            return friendL.startsWith(queryL);
          }).toList();
    return buildSuggestionsSuccess(suggestions);
  }

  Widget buildSuggestionsSuccess(List<String> suggestions) {
    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final suggestion = suggestions[index];
        return ListTile(
          onTap: () {
            query = suggestion;
            showResults(context);
          },
          leading: Icon(Icons.person),
          title: Text(suggestion),
        );
      },
    );
  }
}
