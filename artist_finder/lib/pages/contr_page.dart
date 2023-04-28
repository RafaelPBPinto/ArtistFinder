import 'package:artist_finder/components/url.dart';
import 'package:flutter/material.dart';
import 'package:artist_finder/components/customsearch.dart';
import 'package:artist_finder/components/operationdata.dart';
import 'package:artist_finder/pages/artist_profile.dart';

List<String> artistname = [];

class ContrPage extends StatefulWidget {
  const ContrPage({super.key});

  @override
  State<ContrPage> createState() => _ContrPageState();
}

class _ContrPageState extends State<ContrPage> {
  int _selectedIndex = 0;

  void AddName() {
    for (var elemnt in artlist) {
      artistname.add(elemnt.username);
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (_selectedIndex == 0) {
      //_showSearchModel();
      showSearch(context: context, delegate: CustomSearchDelegate());
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
          backgroundColor: Colors.blue[600],
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
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ArtistProfile(
                          artist: ArtistByUsername(artist.username)))),
            );
          },
        )));
  }
}
