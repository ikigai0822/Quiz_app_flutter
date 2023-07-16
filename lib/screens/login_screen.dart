// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:main_app/screens/main_menu.dart';
import 'package:main_app/ui/shared/color.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login Page',
      theme: ThemeData(
        scaffoldBackgroundColor: AppColor.pripmaryColor
      ),
      home: const Login(title: 'Login Screen'),
    );
  }
}

class Login extends StatefulWidget {
  const Login({super.key, required this.title});
  final String title;

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  Color? buttonColor ; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: AppColor.pripmaryColor,
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 100,
                child: Text('Welcome',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),
                )),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: TextFormField(
                    controller: emailController,
                    style: const TextStyle(color: Colors.white), // Set the text color to white
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Email",
                      labelStyle: TextStyle(color: Colors.white), // Set the label color to white
                    ),
                  ),
                ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextFormField(
                  controller: passwordController,
                  style: const TextStyle(color: Colors.white),
                  obscureText: true,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                       labelText: "Password",
                       labelStyle: TextStyle(color: Colors.white),
                  ),
                )
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16.0),
                child: Center(
                     child: ElevatedButton(
                    onPressed: () {
                      // Navigating to the MainScreen
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MainMenu(),
                        ),
                      );
                    },

                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 18.0, horizontal: 10.0),
                      child: Text(
                        "Submit",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 26.0,
                          fontWeight: FontWeight.bold,
                        ),
                        // backgroundColor: AppColor.secondaryColor,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}