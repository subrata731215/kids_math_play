import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kids_math_play/chatdetails/authpage.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  void signOut(BuildContext context) async {
    await FirebaseAuth.instance.signOut().then((value) => Navigator.push(
        context, MaterialPageRoute(builder: (context) => const AuthPage())));
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const DrawerHeader(
              child: Icon(
            Icons.message_outlined,
            size: 130,
          )),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('H O M E'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('S E T T I N G'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 5),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('L O G O U T'),
            onTap: () {
              signOut(context);
            },
          ),
        ],
      ),
    );
  }
}
