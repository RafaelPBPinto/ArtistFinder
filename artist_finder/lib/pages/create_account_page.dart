import 'package:artist_finder/components/operationdata.dart';
import 'package:flutter/material.dart';
import 'package:artist_finder/components/my_textfield.dart';
import 'package:artist_finder/components/my_button.dart';
import 'package:artist_finder/models/User.dart';
import 'package:artist_finder/components/url.dart';
import 'package:string_validator/string_validator.dart';

class CreateAccountPage extends StatefulWidget {
  @override
  _CreateAccountPageState createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  // text editing controllers
  final userController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPassController = TextEditingController();
  final datanasController = TextEditingController();
  String aux = '';
  List<bool> select = [false, false];
  User newuser = User(email: '', password: '', username: '', data_nasc: '');
  @override
  Widget build(BuildContext context) {
    /// Function to show a PopUp when an error creating account appears
    void showPopUp(String string) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Incompleto'),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Text('Esqueceu-se de adicionar $string'),
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child: const Text('Voltar'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            );
          });
    }

    /// Function to create an account
    /// Verify if the users have nothing empty, if the two passwwords are equal and if the date format is right
    void createAccount() {
      if (newuser.email == '') {
        showPopUp('email');
      } else if (newuser.username == '') {
        showPopUp('username');
      } else if (newuser.data_nasc == '') {
        showPopUp('data de nascimento');
      } else if (newuser.password == '') {
        showPopUp('password');
      } else if (newuser.password != aux) {
        showPopUp('palavras passes iguais');
      } else if (!select[0] && !select[1]) {
        showPopUp('o tipo de utilizador');
      } else if (!isDate(newuser.data_nasc)) {
        showPopUp(
            'formato de data de nascimento correta.\nDeverá ser da seguinte forma:\n\taaaa-mm-dd');
      } else {
        postUser(newuser, select);
        fetchUsers();
        Navigator.of(context).pushNamed("login");
      }
    }

    void loginButton() {
      Navigator.of(context).pushNamed("login");
    }

    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(children: [
              const SizedBox(height: 50),

              // Logo
              const Icon(
                Icons.mic,
                size: 100,
              ),

              const SizedBox(height: 20),

              // Title
              Text(
                'ArtistFinder',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                  color: Colors.grey[700],
                ),
              ),

              const SizedBox(height: 25),

              // Email
              MyTextField(
                controller: emailController,
                hintText: 'E-mail',
                obscureText: false,
                onChanged: (valiue) {
                  newuser.email = valiue;
                },
              ),

              const SizedBox(height: 10),

              // Username
              MyTextField(
                controller: userController,
                hintText: 'Username',
                obscureText: false,
                onChanged: (valiue) {
                  newuser.username = valiue;
                },
              ),

              const SizedBox(height: 10),

              MyTextField(
                controller: datanasController,
                hintText: 'Data de nasc , Formato: aaaa-mm-dd',
                obscureText: false,
                onChanged: (valiue) {
                  newuser.data_nasc = valiue;
                },
              ),

              const SizedBox(height: 10),

              // Password
              MyTextField(
                controller: confirmPassController,
                hintText: 'Password',
                obscureText: true,
                onChanged: (valiue) {
                  aux = valiue;
                },
              ),

              const SizedBox(height: 10),

              // Confirm Password
              MyTextField(
                controller: passwordController,
                hintText: 'Confirm Password',
                obscureText: true,
                onChanged: (valiue) {
                  newuser.password = valiue;
                },
              ),

              const SizedBox(height: 10),

              ToggleButtons(
                isSelected: select,
                onPressed: (int index) {
                  setState(() {
                    select[index] = !select[index];
                    if (index == 0) {
                      select[1] = false;
                    } else if (index == 1) {
                      select[0] = false;
                    }
                  });
                },
                borderColor: Colors.grey.shade400,
                selectedBorderColor: Colors.grey[300],
                fillColor: Colors.black,
                borderRadius: BorderRadius.circular(30),
                borderWidth: 5,
                constraints:
                    const BoxConstraints(minHeight: 100, minWidth: 100),
                children: [
                  Text("Artista",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: !select[0] ? Colors.grey[700] : Colors.white)),
                  Text("Contratante",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: !select[1] ? Colors.grey[700] : Colors.white))
                ],
              ),

              const SizedBox(
                height: 10,
              ),
              // Create Account Button
              MyButton(
                onTap: createAccount,
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

              const SizedBox(height: 50),

              // Divider
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

              const SizedBox(height: 50),

              // Login Button
              MyButton(
                onTap: loginButton,
                color: Colors.black,
                text: const Text(
                  'Iniciar Sessão',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
