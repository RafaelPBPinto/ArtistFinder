// Referências:
// https://www.youtube.com/watch?v=Dh-cTQJgM-Q

import 'package:flutter/material.dart';
import 'package:artist_finder/components/my_textfield.dart';
import 'package:artist_finder/components/my_button.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  // text editing controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // sign user in
  void signUserIn() {}

  // sign user up
  void signUserUp() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
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
            ),

            const SizedBox(height: 10),

            // Password
            MyTextField(
              controller: passwordController,
              hintText: 'Password',
              obscureText: true,
            ),

            const SizedBox(height: 10),

            // Forgot Password
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Esqueceste-te da palavra-passe?",
                    style: TextStyle(
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),

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
    );
  }
}
