import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UpdateContactPage extends StatelessWidget {
  const UpdateContactPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {



    final CollectionReference user =
    FirebaseFirestore.instance.collection('User');

    final namecontroller = TextEditingController();
    final addresscontroller = TextEditingController();
    final phonenumcontroller = TextEditingController();
    final emailcontroller = TextEditingController();

    updateDonor(docId){
      final data = {
        'name':namecontroller.text,
        'phonenumber':phonenumcontroller.text,
        'address':addresscontroller.text,
        'email':emailcontroller.text
      };
      user.doc(docId).update(data);
    }

    final args = ModalRoute.of(context)!.settings.arguments as Map;

    namecontroller.text=args['name'];
    addresscontroller.text=args['address'];
    phonenumcontroller.text=args['phonenumber'];
    emailcontroller.text=args['email'];
    final docId=args['id'];

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Update Contact",
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
                updateDonor(docId);
                Navigator.pop(context);
                // Navigator.pushReplacement(context,
                //     MaterialPageRoute(builder: (context) => Homescreen()));
              },
              child: const Text("Update"))
        ],
      ),
    );
  }
}
