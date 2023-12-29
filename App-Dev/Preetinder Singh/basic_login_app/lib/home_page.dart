import 'package:basic_login_app/auth.dart';
import 'package:basic_login_app/login_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  final User? user = Auth().currentUser;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<void> signOut() async {
    await Auth().signOut();
  }

  int _currentIndex = 0;

  List<Widget> body = const [
    Icon(
      Icons.home,
      color: Colors.white,
    ),
    Icon(
      Icons.menu,
      color: Colors.white,
    ),
    Icon(
      Icons.person,
      color: Colors.white,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      bottomNavigationBar: bottomNavbar(),
      // backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            body[_currentIndex],
            logoutButton(context),
          ],
        ),
      ),
    );
  }

  BottomNavigationBar bottomNavbar() {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: (int newIndex) {
        setState(() {
          _currentIndex = newIndex;
        });
      },
      items: const [
        BottomNavigationBarItem(
          label: "Home",
          icon: Icon(Icons.home),
        ),
        BottomNavigationBarItem(
          label: "Menu",
          icon: Icon(Icons.menu),
        ),
        BottomNavigationBarItem(
          label: "Profile",
          icon: Icon(Icons.person),
        ),
      ],
    );
  }

  SizedBox logoutButton(BuildContext context) {
    return SizedBox(
      width: 250,
      height: 50,
      child: TextButton(
        onPressed: () {
          signOut();
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const LoginPage()));
        },
        style: const ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(Colors.amber),
        ),
        child: const Text(
          "Logout",
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}

AppBar appBar() => AppBar(
      title: const Text("Home Page"),
      centerTitle: true,
      backgroundColor: Colors.black,
      titleTextStyle: const TextStyle(
        color: Colors.white,
        fontSize: 26,
      ),
    );
