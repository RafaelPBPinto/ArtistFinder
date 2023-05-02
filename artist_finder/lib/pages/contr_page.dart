import 'package:artist_finder/components/my_button.dart';
import 'package:artist_finder/components/url.dart';
import 'package:flutter/material.dart';
import 'package:artist_finder/components/customsearch.dart';
import 'package:artist_finder/components/operationdata.dart';
import 'package:artist_finder/pages/artist_profile.dart';
import 'edit_contr_profile.dart';

List<String> artistname = [];

class ContrPage extends StatefulWidget {
  const ContrPage({super.key});

  @override
  State<ContrPage> createState() => _ContrPageState();
}

class _ContrPageState extends State<ContrPage> {
  int _selectedIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  void AddName() {
    for (var elemnt in artlist) {
      artistname.add(elemnt.username);
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      print(_selectedIndex);
      if (_selectedIndex == 2) {
        print("enter here");
        Scaffold.of(context).openEndDrawer();
      }
    });
    if (_selectedIndex == 0) {
      //_showSearchModel();
      showSearch(context: context, delegate: CustomSearchDelegate());
    }
  }

  void edit_contr_profile() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => EditContrProfile()));
  }

  @override
  void initState() {
    super.initState();
    AddName();
    fetchUsers(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text("ArtistFinder"),
        backgroundColor: Colors.blue[600],
        centerTitle: true,
        bottomOpacity: 10,
        actions: [
          IconButton(
              onPressed: () => fetchUsers(context),
              icon: const Icon(Icons.refresh))
        ],
      ),
      endDrawer: Drawer(
          width: MediaQuery.of(context).size.width / 1.5,
          child: DrawerHeader(
            margin: const EdgeInsets.all(10),
            child: Container(
              color: Colors.white,
              child: Column(children: [
                Text(
                  'O seu perfil\n${activecontratant.username}',
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  'Email:\n${activecontratant.email}',
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  'Data de nascimento:\n${activecontratant.data_nasc}',
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 40,
                ),
                MyButton(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    text: const Text('Voltar'),
                    color: Colors.blue[600]),
                const SizedBox(
                  height: 15,
                ),
                MyButton(
                    onTap: edit_contr_profile,
                    text: const Text('Editar perfil'),
                    color: Colors.blue[600])
              ]),
            ),
          )),
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
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
            if (_selectedIndex == 0) {
              showSearch(context: context, delegate: CustomSearchDelegate());
            }
            if (_selectedIndex == 2) {
              _scaffoldKey.currentState?.openEndDrawer();
            }
          });
        },
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
            leading: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(color: Colors.blue, width: 4)),
              child: Image.network(
                artist.image_url ?? '$api/images/DEFAULT.jpg',
                fit: BoxFit.cover,
                height: 40,
                width: 40,
              ),
            ),
            title: Text(artist.username),
            subtitle: Text("${artist.type} \nAvaliação: ${artist.avaliation}"),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ArtistProfile(
                        artist: ArtistByUsername(artist.username)))),
          );
        },
      )),
    );
  }
}
