import 'package:artist_finder/components/common/my_button.dart';
import 'package:artist_finder/components/common/url.dart';
import 'package:artist_finder/components/contratant/filter.dart';
import 'package:artist_finder/pages/common/login_page.dart';
import 'package:flutter/material.dart';
import 'package:artist_finder/components/contratant/customsearch.dart';
import 'package:artist_finder/components/common/operationdata.dart';
import 'package:artist_finder/pages/artist/artist_profile.dart';
import 'edit_contr_profile.dart';
import 'message_page.dart';

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

  void logout() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Terminar sessão'),
          content: const Text('Tem a certeza que deseja terminar sessão?'),
          actions: <Widget>[
            Row(children: [
              ElevatedButton(
                style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.green)),
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
                child: const Text("Cancelar"),
              ),
              const SizedBox(
                width: 10,
              ),
              ElevatedButton(
                style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.red)),
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
                child: const Text("Confirmar"),
              ),
            ])
          ],
        );
      },
    ).then((confirmed) {
      // Código para executar após a confirmação
      if (confirmed) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginPage()));
      }
    });
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
        leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () => showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Terminar sessão'),
                      content: const Text(
                          'Tem a certeza que deseja terminar sessão?'),
                      actions: <Widget>[
                        Row(children: [
                          ElevatedButton(
                            style: const ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll(Colors.green)),
                            onPressed: () {
                              Navigator.of(context).pop(false);
                            },
                            child: const Text("Cancelar"),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          ElevatedButton(
                            style: const ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll(Colors.red)),
                            onPressed: () {
                              Navigator.of(context).pop(true);
                            },
                            child: const Text("Confirmar"),
                          ),
                        ])
                      ],
                    );
                  },
                ).then((confirmed) {
                  // Código para executar após a confirmação
                  if (confirmed) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginPage()));
                  }
                })),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const DropdownButtonApp()));
              },
              icon: const Icon(Icons.filter_alt))
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
                    color: Colors.blue[600]),
                const SizedBox(
                  height: 15,
                ),
                MyButton(
                    onTap: logout,
                    text: const Text('Terminar sessão'),
                    color: Colors.blue[600]),
              ]),
            ),
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showSearch(context: context, delegate: CustomSearchDelegate());
        },
        backgroundColor: Colors.blue[600],
        child: const Icon(
          Icons.search,
          color: Colors.white,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.mic),
            label: 'Artistas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Chat',
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
            if (_selectedIndex == 1) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const MessagePage())); // RAFA -- NESTA PAGINA
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
            subtitle: Text(
                "${artist.type} , ${artist.subtype} \nAvaliação: ${artist.avaliation}"),
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
