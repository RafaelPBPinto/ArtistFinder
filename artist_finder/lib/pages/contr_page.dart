import 'package:artist_finder/components/url.dart';
import 'package:flutter/material.dart';
import 'package:easy_search_bar/easy_search_bar.dart';

class ContrPage extends StatefulWidget {
  const ContrPage({super.key});

  @override
  State<ContrPage> createState() => _ContrPageState();
}

class _ContrPageState extends State<ContrPage> {
  int _selectedIndex = 0;
  List<String> artistname = [];
  List<String> aux = [];

  void searchValue(String query) {
    final suggestions = artistname.where((element) {
      final nameartist = element.toLowerCase();
      final input = query.toLowerCase();
      return nameartist.contains(input);
    }).toList();
    setState(() => aux = suggestions);
    print(aux);
  }

  void AddName() {
    for (var elemnt in artlist) {
      artistname.add(elemnt.username);
      aux.add(elemnt.username);
    }
  }

  void _showSearchModel() {
    final _formKey = GlobalKey<FormState>();
    final controller = TextEditingController();
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Column(children: <Widget>[
            Container(
                child: TextField(
              controller: controller,
              decoration: InputDecoration(
                  prefix: const Icon(Icons.search),
                  hintText: "Pesquise o seu artista",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(color: Colors.black))),
              onChanged: searchValue,
            )),
            Expanded(
              child: ListView.builder(
                  itemCount: aux.length,
                  itemBuilder: (contex, index) {
                    final artist = aux[index];
                    return ListTile(title: Text(artist));
                  }),
            )
          ]);
        });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (_selectedIndex == 0) {
      _showSearchModel();
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
