import 'package:flutter/material.dart';
import 'url.dart';
import 'package:artist_finder/pages/artist_profile.dart';
import 'package:artist_finder/components/operationdata.dart';
import './filter.dart';

List<String> fetchUsername() {
  List<String> artistname = [];
  for (var elemnt in artlist) {
    artistname.add(elemnt.username);
  }
  return artistname;
}

class CustomSearchDelegate extends SearchDelegate {
  // Demo list to show querying
  List<String> searchTerms = fetchUsername();

  // first overwrite to
  // clear the search text
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      ),
      IconButton(
        
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DropdownButtonApp()),
          );
        },
        icon: const Icon(Icons.filter_alt),
      ),
    ];
  }

  // second overwrite to pop out of search menu
  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  // third overwrite to show query result
  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var artist in searchTerms) {
      if (artist.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(artist);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }

  // last overwrite to show the
  // querying process at the runtime
  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var artist in searchTerms) {
      if (artist.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(artist);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];

        return GestureDetector(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      ArtistProfile(artist: ArtistByUsername(result)))),
          child: ListTile(
            title: Text(result),
          ),
        );
      },
    );
  }
}
