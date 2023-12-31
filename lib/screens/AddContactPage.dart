import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddContactPage extends StatelessWidget {
  const AddContactPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CollectionReference user =
        FirebaseFirestore.instance.collection('User');

    final namecontroller = TextEditingController();
    final addresscontroller = TextEditingController();
    final phonenumcontroller = TextEditingController();
    final emailcontroller = TextEditingController();

    void createUser() {
      final data = {
        'name': namecontroller.text,
        'phonenumber': phonenumcontroller.text,
        'email': emailcontroller.text,
        'address': addresscontroller.text
      };
      user.add(data);
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Add Contact",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          TextFormField(
            controller: namecontroller,
            decoration: const InputDecoration(
              hintText: "Name",
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey)),
            ),
          ),
          const SizedBox(height: 10),
          TextFormField(
            controller: addresscontroller,
            minLines: 2,
            maxLines: 4,
            decoration: const InputDecoration(
              hintText: "Address",
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey)),
            ),
          ),
          const SizedBox(height: 10),
          TextFormField(
            controller: phonenumcontroller,
            decoration: const InputDecoration(
              hintText: "Phone Number",
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey)),
            ),
          ),
          const SizedBox(height: 10),
          TextFormField(
            controller: emailcontroller,
            decoration: const InputDecoration(
              hintText: "Email",
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey)),
            ),
          ),
          const SizedBox(height: 10),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                createUser();
                Navigator.pop(context);
                // Navigator.pushReplacement(context,
                //     MaterialPageRoute(builder: (context) => Homescreen()));
              },
              child: const Text("Submit"))
        ],
      ),
    );
  }
}
