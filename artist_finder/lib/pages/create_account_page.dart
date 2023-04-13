import 'package:flutter/material.dart';
import 'package:artist_finder/components/my_textfield.dart';
import 'package:artist_finder/components/my_button.dart';

class CreateAccountPage extends StatelessWidget {
  CreateAccountPage({super.key});

  // text editing controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void createAccount() {}

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
              ),

              const SizedBox(height: 10),

              // Username
              MyTextField(
                controller: emailController,
                hintText: 'Username',
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

              // Confirm Password
              MyTextField(
                controller: passwordController,
                hintText: 'Confirm Password',
                obscureText: true,
              ),

              const SizedBox(height: 10),

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
