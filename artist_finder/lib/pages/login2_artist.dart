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
  String? district = '';
  List<String>? city = ['', 'Choose district first'];
  List<String> types = ['Musico', 'Humorista', 'Palhaco', 'Outro'];
  List<String> districts = [];
  String? locality = '';
  XFile? imagefile;
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
    });
  }

  @override
  void initState() {
    super.initState();
    districts_pushed();
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
        showPopUp('Selecione o seu distrito! ', context);
      } else if (desc == '') {
        showPopUp(
            'Adicione uma breve descricao sobre tu como artista!', context);
      } else {
        Artist newuser = Artist(
            username: widget.username,
            email: widget.email,
            password: widget.password,
            data_nasc: widget.data_nasc,
            type: type.toString(),
            avaliation: 0,
            locality: '$locality , $district',
            description: desc,
            image_url: imagefile!.path,
            no_avaliations: 0);

        postArtist(newuser);
        Navigator.of(context).pushNamed("login");
      }
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text("ArtistFinder"),
          backgroundColor: Colors.grey[700],
          centerTitle: true,
          bottomOpacity: 10,
        ),
        backgroundColor: Colors.grey[300],
        body: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: Column(children: [
                const SizedBox(height: 50),

                // Title
                Text(
                  'Mais um passo',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                    color: Colors.grey[700],
                  ),
                ),

                const SizedBox(height: 25),
                Text(
                  'Adicione o seu distrito',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.grey[700],
                  ),
                ),

                const SizedBox(
                  height: 25,
                ),

                /// DropDown for cities
                DropdownButton<String>(
                    value: district,
                    items: districts.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      setState(() {
                        district = value;
                        city = cities[district];
                        locality = city?[0];
                      });
                    }),

                const SizedBox(
                  height: 15,
                ),

                Text(
                  'Qual é a sua localidade?',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.grey[700],
                  ),
                ),

                const SizedBox(
                  height: 15,
                ),

                DropdownButton<String>(
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

                Text(
                  'Qual é o seu tipo de artista?',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.grey[700],
                  ),
                ),

                const SizedBox(
                  height: 25,
                ),

                DropdownButton<String>(
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
                      });
                    }),

                const SizedBox(
                  height: 25,
                ),

                ElevatedButton(
                    onPressed: () => {pickImage()},
                    child: const Text('Pick image')),
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
