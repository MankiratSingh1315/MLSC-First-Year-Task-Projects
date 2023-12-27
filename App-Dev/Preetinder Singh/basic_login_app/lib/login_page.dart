import 'package:basic_login_app/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? errorMessage = "";

  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  Future<void> signInWithEmailAndPassword() async {
    try {
      await Auth().signInWithEmialAndPassword(
        email: _controllerEmail.text,
        password: _controllerPassword.text,
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: appBar(),
      backgroundColor: Colors.black,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          title(),
          Container(
            margin: const EdgeInsets.only(top: 100, bottom: 30),
            child: Column(
              children: [
                textField("Email"),
                textField("Password"),
              ],
            ),
          ),
          SizedBox(width: 250, height: 50, child: loginButton()),
          const SizedBox(
            height: 10,
          ),
          SizedBox(width: 250, height: 50, child: intentButton()),
        ],
      )),
    );
  }

  TextButton intentButton() {
    return TextButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const SignUpPage()),
        );
      },
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
        Colors.amber,
      )),
      child: const Text(
        "Sign up",
        style: TextStyle(
            color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }

  TextButton loginButton() {
    return TextButton(
      onPressed: () {
        signInWithEmailAndPassword();
      },
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
        Colors.amber,
      )),
      child: const Text(
        "Login",
        style: TextStyle(
            color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }

  Text title() {
    return const Text(
      "Login",
      style: TextStyle(
        color: Colors.white,
        fontSize: 46,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Container textField(hint) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: TextField(
        style: const TextStyle(color: Colors.black),
        decoration: InputDecoration(
            hintText: hint,
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.all(15),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(15),
            )),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      title: const Text("Login"),
      centerTitle: true,
    );
  }
}
