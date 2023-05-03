import 'package:flutter/material.dart';
import 'package:artist_finder/components/my_textfield.dart';
import 'package:artist_finder/components/url.dart';
import 'package:artist_finder/components/my_button.dart';
import 'package:image_picker/image_picker.dart';
import 'package:artist_finder/components/operationdata.dart';
import 'package:artist_finder/models/Artist.dart';

class EditArtProfile extends StatefulWidget {
  const EditArtProfile({super.key});

  @override
  State<EditArtProfile> createState() => _EditArtProfileState();
}

class _EditArtProfileState extends State<EditArtProfile> {
  String email = '';
  String password = '';
  String username = '';

  final emailController = TextEditingController();
  final userController = TextEditingController();
  final passController = TextEditingController();
  final typeController = TextEditingController();
  final descController = TextEditingController();
  final localController = TextEditingController();

  String desc = '';
  List<String>? city = ['', 'Choose district first'];
  List<String> types = ['Musico', 'Humorista', 'Palhaco', 'Outro'];
  List<String> districts = [];
  XFile? imagefile;
  bool addedimage = false;
  List<String?> local = ['', ''];
  final ImagePicker picker = ImagePicker();
  String? cityaux = '';

  void splitLocality() {
    if (activeartist.locality != '') {
      local = activeartist.locality.split(RegExp(r'\s*,\s*'));
      cityaux = local[0];
    }
  }

  void putArtistProfile() {
    if (username == '') {
      username = activeartist.username;
    }
    if (email == '') {
      email = activeartist.email;
    }

    if (password == '') {
      password = activeartist.password;
    }
    if (desc == '') {
      desc = activeartist.description;
    }

    Artist newuser = Artist(
        username: username,
        email: email,
        password: password,
        data_nasc: activeartist.data_nasc,
        type: activeartist.type,
        avaliation: activeartist.avaliation,
        locality: '$cityaux , ${local[1]}',
        description: desc,
        image_url: imagefile?.path ?? 'None',
        no_avaliations: activeartist.no_avaliations);

    editArtist(context, newuser);
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content:
          Text("Perfil editado com sucesso!Entre de novo com os novos dados"),
      backgroundColor: Colors.black,
      duration: Duration(seconds: 2),
    ));
    Navigator.of(context).pushNamed("login");
  }

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
    splitLocality();
    city = cities[local[1]];
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
        body: SafeArea(
            child: Center(
                child: SingleChildScrollView(
                    child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Text(
              'Altere aqui o seu username',
              style: TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 15,
                color: Colors.grey[700],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            MyTextField(
                controller: userController,
                hintText: activeartist.username,
                obscureText: true,
                onChanged: (value) {
                  username = value;
                }),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Altere aqui o seu email',
              style: TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 15,
                color: Colors.grey[700],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            MyTextField(
                controller: emailController,
                hintText: activeartist.email,
                obscureText: true,
                onChanged: (value) {
                  email = value;
                }),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Altere aqui a sua palavra-passe',
              style: TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 15,
                color: Colors.grey[700],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            MyTextField(
                controller: passController,
                hintText: activeartist.password,
                obscureText: true,
                onChanged: (value) {
                  password = value;
                }),
            const SizedBox(
              height: 50,
            ),
            const SizedBox(height: 25),
            Text(
              'Altere o seu distrito',
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
                value: local[1],
                items: districts.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? value) {
                  setState(() {
                    local[1] = value;
                    city = cities[local[1]];
                    cityaux = city![0];
                  });
                }),

            const SizedBox(
              height: 15,
            ),

            Text(
              'Altere a sua localidade!',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.grey[700],
              ),
            ),

            const SizedBox(
              height: 15,
            ),
            const SizedBox(
              height: 15,
            ),

            DropdownButton<String>(
              value: cityaux,
              items: city?.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? value) {
                setState(() {
                  cityaux = value;
                });
              },
            ),

            const SizedBox(
              height: 25,
            ),
            Text(
              'Altere a sua foto de perfil!',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.grey[700],
              ),
            ),

            const SizedBox(
              height: 25,
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
              height: 25,
            ),
            Text(
              'Altere a sua atual descricao',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.grey[700],
              ),
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
                    hintText: activeartist.description,
                    hintStyle: TextStyle(color: Colors.grey[500])),
                maxLines: 10,
                onChanged: (String value) {
                  desc = value;
                },
              ),
            ),

            MyButton(
                onTap: putArtistProfile,
                text: const Text('Submeter'),
                color: Colors.blue[600]),
            const SizedBox(
              height: 20,
            )
          ],
        )))));
  }
}
