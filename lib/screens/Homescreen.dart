import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:task_1/screens/AddContactPage.dart';
import 'Loginscreen.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const AddContactPage()));
            },
            label: Row(
              children: const [
                Icon(Icons.account_circle),
                SizedBox(
                  width: 5,
                ),
                Text("Add Contact")
              ],
            )),
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          actions: [
            InkWell(
              child: const Icon(Icons.logout),
              onTap: () {
                FirebaseAuth.instance.signOut().then((value) {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => const Loginscreen()));
                });
              },
            ),
            const SizedBox(
              width: 10,
            )
          ],
          title: const Text(
            "Contact Hub",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
          ),
        ),
        body: ListView(
          children: const [],
        )
      ),
    );
  }
}
