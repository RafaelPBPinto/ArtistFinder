import 'package:flutter/material.dart';
import 'package:artist_finder/components/common/my_button.dart';
import 'package:artist_finder/components/common/url.dart';
import 'package:artist_finder/components/common/operationdata.dart';
import 'contr_page.dart';
import 'edit_contr_profile.dart';
import '../common/login_page.dart';
import '../../models/Chat.dart';
import 'negotiation_contratant.dart';
import '../../components/contratant/chat_card.dart';

class MessagePage extends StatefulWidget {
  const MessagePage({super.key});

  @override
  State<MessagePage> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  @override
  Widget build(BuildContext context) {
    int _selectedIndex = 1;
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

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

    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: const Text("ArtistFinder"),
          backgroundColor: Colors.blue[600],
          centerTitle: true,
          bottomOpacity: 10,
          leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () => Navigator.pop(context)),
          actions: [Container()],
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
              if (_selectedIndex == 0) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const ContrPage()));
              }
              if (_selectedIndex == 2) {
                _scaffoldKey.currentState?.openEndDrawer();
              }
            });
          },
        ),
        backgroundColor: Colors.grey[300],
        body: SafeArea(
          child: ListView.builder(
            itemCount: chatsData.length,
            itemBuilder: (context, index) => ChatCard(
              chat: chatsData[index],
              press: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NegotiationPage(
                      artist: getArtist(chatsData[index].id_artist)),
                ),
              ),
            ),
          ),
        ));
  }
}
