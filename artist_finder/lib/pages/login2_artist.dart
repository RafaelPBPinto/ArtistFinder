import 'package:artist_finder/models/Artist.dart';
import 'package:flutter/material.dart';

// Referências:
// https://www.youtube.com/watch?v=Dh-cTQJgM-Q

import 'package:artist_finder/components/my_button.dart';
import 'package:artist_finder/components/operationdata.dart';
import 'package:artist_finder/components/url.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class Login2Artist extends StatefulWidget {
  final String username;
  final String password;
  final String data_nasc;
  final String email;
  const Login2Artist(
      {super.key,
      required this.username,
      required this.data_nasc,
      required this.password,
      required this.email});
  @override
  _Login2ArtistState createState() => _Login2ArtistState();
}

class _Login2ArtistState extends State<Login2Artist> {
  // text editing controllers
  final typeController = TextEditingController();
  final descController = TextEditingController();
  final localController = TextEditingController();
  String? type = 'Musico';
  String desc = '';
  String? district = 'Aveiro';
  String? style = 'Pop';
  List<String>? city = cities['Aveiro'];
  List<String> types = [];
  List<String>? styles = logintypestyle['Musico'];
  List<String> districts = [];
  String? locality = 'Águeda';
  XFile? imagefile;
  bool addedimage = false;
  final ImagePicker picker = ImagePicker();
  void districts_pushed() {
    for (String string in cities.keys) {
      districts.add(string);
    }
  }

  Future pickImage() async {
    var image = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      imagefile = image;
      showPopUp('Sucesso', 'Foto adicionada com sucesso', context);
      addedimage = true;
    });
  }

  @override
  void initState() {
    super.initState();
    districts_pushed();
    for (String element in logintypestyle.keys) {
      types.add(element);
    }
  }

  @override
  Widget build(BuildContext context) {
    // sign user in

    // sign user up
    void signUserUp() {
      if (locality == '') {
        locality = city?[0];
      }

      if (district == '') {
        showPopUp('Incompleto', 'Selecione o seu distrito! ', context);
      } else if (desc == '') {
        showPopUp('Incompleto',
            'Adicione uma breve descricao sobre tu como artista!', context);
      } else {
        Artist newuser = Artist(
            username: widget.username,
            email: widget.email,
            password: widget.password,
            data_nasc: widget.data_nasc,
            type: type.toString(),
            subtype: style,
            avaliation: 0,
            locality: '$locality , $district',
            description: desc,
            image_url: imagefile?.path,
            no_avaliations: 0);

        postArtist(context, newuser);
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Conta criada com sucesso!"),
          backgroundColor: Colors.black,
          duration: Duration(seconds: 2),
        ));
        Navigator.of(context).pushNamed("login");
      }
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text("ArtistFinder"),
          backgroundColor: Colors.blue[600],
          centerTitle: true,
          bottomOpacity: 10,
        ),
        backgroundColor: Colors.grey[300],
        body: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: Column(children: [
                const SizedBox(height: 30),

                // Title
                const Text(
                  'Só mais um passo...',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 30,
                    color: Colors.black,
                  ),
                ),

                const SizedBox(height: 10),
                const Divider(
                  thickness: 5,
                  color: Colors.blue,
                ),
                const SizedBox(height: 30),
                const Text(
                  'Adicione o seu distrito',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),

                const SizedBox(
                  height: 15,
                ),

                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue, width: 2),
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.grey[400]),

                  /// DropDown for cities
                  child: DropdownButton<String>(
                      underline: Container(),
                      focusColor: Colors.grey[300],
                      alignment: Alignment.center,
                      value: district,
                      items: districts.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                          ),
                        );
                      }).toList(),
                      onChanged: (String? value) {
                        setState(() {
                          district = value;
                          city = cities[district];
                          locality = city?[0];
                        });
                      }),
                ),
                const SizedBox(
                  height: 30,
                ),

                const Text(
                  'Adicione a sua localidade',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),

                const SizedBox(
                  height: 15,
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue, width: 2),
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.grey[400]),
                  child: DropdownButton<String>(
                    underline: Container(),
                    focusColor: Colors.grey[300],
                    alignment: Alignment.center,
                    value: locality,
                    items: city?.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      setState(() {
                        locality = value;
                      });
                    },
                  ),
                ),

                const SizedBox(
                  height: 30,
                ),
                const Divider(
                  thickness: 2.5,
                  color: Colors.blue,
                ),

                const SizedBox(
                  height: 30,
                ),

                const Text(
                  'Adicione o seu tipo de artista',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),

                const SizedBox(
                  height: 15,
                ),

                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue, width: 2),
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.grey[400]),
                  child: DropdownButton<String>(
                      underline: Container(),
                      alignment: Alignment.center,
                      focusColor: Colors.grey[300],
                      value: type,
                      items: types.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? value) {
                        setState(() {
                          type = value;
                          styles = logintypestyle[type];
                          style = styles?[0];
                        });
                      }),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  'Adicione o seu estilo de artista',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue, width: 2),
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.grey[400]),
                  child: DropdownButton<String>(
                      underline: Container(),
                      focusColor: Colors.grey[300],
                      alignment: Alignment.center,
                      value: style,
                      items: styles?.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? value) {
                        setState(() {
                          style = value;
                        });
                      }),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Divider(
                  thickness: 2.5,
                  color: Colors.blue,
                ),

                const SizedBox(
                  height: 30,
                ),
                const Text(
                  'Adicione a sua foto de perfil',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),

                const SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                  onPressed: () => {addedimage == true ? null : pickImage()},
                  style: ButtonStyle(
                      backgroundColor: addedimage == true
                          ? MaterialStateProperty.all<Color>(Colors.grey)
                          : MaterialStateProperty.all<Color>(Colors.blue)),
                  child: const Text('Selecioar foto!'),
                ),

                const SizedBox(
                  height: 30,
                ),
                const Divider(
                  thickness: 2.5,
                  color: Colors.blue,
                ),

                const SizedBox(
                  height: 30,
                ),
                const Text(
                  'Adicione uma breve descrição',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextField(
                    controller: descController,
                    obscureText: false,
                    decoration: InputDecoration(
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade400),
                        ),
                        fillColor: Colors.grey.shade200,
                        filled: true,
                        hintText: 'Descreve-te como artista!',
                        hintStyle: TextStyle(color: Colors.grey[500])),
                    maxLines: 10,
                    onChanged: (String value) {
                      desc = value;
                    },
                  ),
                ),

                const SizedBox(height: 50),

                // Create Account
                MyButton(
                  onTap: signUserUp,
                  color: Colors.green,
                  text: const Text(
                    'Criar Conta',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                )
              ]),
            ),
          ),
        ));
  }
}
