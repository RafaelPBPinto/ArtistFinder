import 'package:artist_finder/components/url.dart';
import 'package:flutter/material.dart';

List<String> artistname = [];

class ContrPage extends StatefulWidget {
  const ContrPage({super.key});

  @override
  State<ContrPage> createState() => _ContrPageState();
}

class _ContrPageState extends State<ContrPage> {
  int _selectedIndex = 0;
  List<String> aux = [];

  

  void AddName() {
    for (var elemnt in artlist) {
      artistname.add(elemnt.username);
      aux.add(elemnt.username);
    }
  }
  


  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (_selectedIndex == 0) {
      //_showSearchModel();
      showSearch(
        context: context, 
        delegate: CustomSearchDelegate()
      );
    }
  }

  @override
  void initState() {
    super.initState();
    AddName();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("ArtistFinder"),
          backgroundColor: Colors.grey[700],
          centerTitle: true,
          bottomOpacity: 10,
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Pesquisar artista',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.menu),
              label: 'Menu',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_2_rounded),
              label: 'Meu perfil',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.black,
          onTap: _onItemTapped,
        ),
        backgroundColor: Colors.grey[300],
        body: SafeArea(
            child: ListView.separated(
          separatorBuilder: (context, index) {
            return const Divider(height: 10);
          },
          itemCount: artlist.length,
          itemBuilder: (BuildContext context, index) {
            final artist = artlist[index];
            return ListTile(
              title: Text(artist.username),
              subtitle:
                  Text("${artist.type} \nAvaliação: ${artist.avaliation}"),
              trailing: const Icon(Icons.person),
              onTap: () => Navigator.of(context).pushNamed("here"),
            );
          },
        )));
  }
}

class CustomSearchDelegate extends SearchDelegate {
  // Demo list to show querying
  List<String> searchTerms = artistname;
     
  // first overwrite to
  // clear the search text
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: Icon(Icons.clear),
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
      icon: Icon(Icons.arrow_back),
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
        return ListTile(
          title: Text(result),
        );
      },
    );
  }
}
