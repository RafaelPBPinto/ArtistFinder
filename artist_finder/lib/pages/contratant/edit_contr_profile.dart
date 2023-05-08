import 'package:artist_finder/components/common/my_button.dart';
import 'package:artist_finder/pages/common/login_page.dart';
import 'package:flutter/material.dart';
import 'package:artist_finder/components/common/url.dart';
import 'package:artist_finder/components/common/my_textfield.dart';
import 'package:artist_finder/components/common/operationdata.dart';

class EditContrProfile extends StatefulWidget {
  const EditContrProfile({super.key});

  @override
  State<EditContrProfile> createState() => _EditContrProfileState();
}

class _EditContrProfileState extends State<EditContrProfile> {
  String email = '';
  String password = '';
  String username = '';

  final emailController = TextEditingController();
  final userController = TextEditingController();
  final passController = TextEditingController();
  void posteditedContratant() {
    if (email == '') {
      email = activecontratant.email;
    }
    if (password == '') {
      password = activecontratant.password;
    }
    if (username == '') {
      username = activecontratant.username;
    }
    ContratantEdited(context, activecontratant, email, password, username);
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text(
          "Conta editada com sucesso!\nVolte a fazer o login com os seus novos dados"),
      backgroundColor: Colors.black,
      duration: Duration(seconds: 2),
    ));
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const LoginPage()));
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
                hintText: activecontratant.username,
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
                hintText: activecontratant.email,
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
                hintText: activecontratant.password,
                obscureText: true,
                onChanged: (value) {
                  password = value;
                }),
            const SizedBox(
              height: 50,
            ),
            MyButton(
                onTap: posteditedContratant,
                text: const Text('Submeter'),
                color: Colors.blue[600]),
          ],
        )))));
  }
}
