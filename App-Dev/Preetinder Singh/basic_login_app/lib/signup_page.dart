import 'package:basic_login_app/login_page.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
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
          SizedBox(width: 250, height: 50, child: signUpButton()),
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
          MaterialPageRoute(builder: (context) => const LoginPage()),
        );
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

  TextButton signUpButton() {
    return TextButton(
      onPressed: () {},
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
        Colors.amber,
      )),
      child: const Text(
        "Sign Up",
        style: TextStyle(
            color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }

  Text title() {
    return const Text(
      "Sign Up",
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
      title: const Text("Sign Up"),
      centerTitle: true,
    );
  }
}
