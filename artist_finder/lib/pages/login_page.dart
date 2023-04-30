// Referências:
// https://www.youtube.com/watch?v=Dh-cTQJgM-Q

import 'package:flutter/material.dart';
import 'package:artist_finder/components/my_textfield.dart';
import 'package:artist_finder/components/my_button.dart';
import 'package:artist_finder/components/operationdata.dart';
import 'package:artist_finder/components/url.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // text editing controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  String email = '', password = '';
  //List<User> userlist = [];

  @override
  void initState() {
    super.initState();
    fetchUsers(context);
  }

  @override
  Widget build(BuildContext context) {
    // sign user in
    void signUserIn() {
      Map<String, bool> signuser = checkuser(email, password);

      if (signuser['Artist'] == true) {
        activeartist = ArtistActive(email, password);
        Navigator.of(context).pushNamed("artistpage");
      } else if (signuser["Contratant"] == true) {
        activecontratant = UserActive(email, password);
        Navigator.of(context).pushNamed("contrpage");
      } else {
        showPopUp(
            'Incorreto',
            'As credenciais não correspondem a nenhuma conta. Tente outras credenciais! ',
            context);
      }
    }

    /// sign user up
    void signUserUp() {
      Navigator.of(context).pushNamed("createAccount");
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
                onChanged: (value) {
                  email = value;
                },
              ),

              const SizedBox(height: 10),

              // Password
              MyTextField(
                controller: passwordController,
                hintText: 'Password',
                obscureText: true,
                onChanged: (value) {
                  password = value;
                },
              ),

              const SizedBox(height: 10),

              // Forgot Password

              const SizedBox(height: 25),

              // Login Button
              MyButton(
                onTap: signUserIn,
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

              Text(
                "Ainda não tem conta? Crie-a aqui em baixo !",
                style: TextStyle(
                  color: Colors.grey[600],
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
