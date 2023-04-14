import 'package:artist_finder/components/operationdata.dart';
import 'package:flutter/material.dart';
import 'package:artist_finder/components/my_textfield.dart';
import 'package:artist_finder/components/my_button.dart';
import 'package:artist_finder/models/User.dart';
import 'package:artist_finder/components/url.dart';

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

  List<bool> select = [false, false];
  User newuser = User(email: '', password: '', username: '', data_nasc: '');
  @override
  Widget build(BuildContext context) {
    void createAccount() {
      postUser(newuser);
      fetchUsers();
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
                hintText: 'Data de nascimento',
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
                onChanged: (valiue) => null,
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
