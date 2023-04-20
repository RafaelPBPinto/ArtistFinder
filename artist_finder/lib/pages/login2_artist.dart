import 'package:flutter/material.dart';

// Referências:
// https://www.youtube.com/watch?v=Dh-cTQJgM-Q

import 'package:flutter/material.dart';
import 'package:artist_finder/components/my_textfield.dart';
import 'package:artist_finder/components/my_button.dart';
import 'package:artist_finder/components/operationdata.dart';
import 'package:artist_finder/models/Contratant.dart';
import 'package:artist_finder/components/url.dart';

class Login2Artist extends StatefulWidget {
  const Login2Artist({Key? key}) : super(key: key);
  @override
  _Login2ArtistState createState() => _Login2ArtistState();
}

class _Login2ArtistState extends State<Login2Artist> {
  // text editing controllers
  final typeController = TextEditingController();
  final descController = TextEditingController();
  String? type = '';
  List<String> types = ['Musico', 'Humorista', 'Palhaco', 'Outro'];
  @override
  Widget build(BuildContext context) {
    // sign user in

    // sign user up
    void signUserUp() {}

    return Scaffold(
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
              const SizedBox(height: 10),

              /* // Divider
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[400],
                      ),
                    ),
                  ],
                ),
              ),
 */
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
                      hintText: 'Descreve-te!',
                      hintStyle: TextStyle(color: Colors.grey[500])),
                  maxLines: 10,
                  onChanged: null,
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
              )
            ]),
          ),
        ),
      ),
    );
  }
}
