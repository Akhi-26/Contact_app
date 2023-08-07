import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class AddContactPage extends StatelessWidget {
  const AddContactPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final namecontroller=TextEditingController();
    final addresscontroller=TextEditingController();
    final phonenumcontroller=TextEditingController();
    final emailcontroller=TextEditingController();


    final name=namecontroller.text;
    final phone=phonenumcontroller.text;

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
        children:  [
          TextFormField(
            controller: namecontroller,
            decoration: const InputDecoration(
              hintText: "Name"
            ),
          ),
          TextFormField(
            controller: addresscontroller,
            minLines: 2,
            maxLines: 4,
            decoration: const InputDecoration(
                hintText: "Address",
            ),
          ),
          TextFormField(
            controller: phonenumcontroller,
            decoration: const InputDecoration(
                hintText: "Phone Number"
            ),
          ),
          TextFormField(
            controller: emailcontroller,
            decoration: const InputDecoration(
                hintText: "Email"
            ),
          ),
          const SizedBox(height: 20,),
          ElevatedButton(onPressed: (){
            createUser(name:name, phone: phone,);
          }, child: const Text("Submit"))
        ],
      ),
    );
  }
  Future createUser({required String name,required String phone})async {
    final docUser= FirebaseFirestore.instance.collection('users');

    final json={
      'name':name,
      'phoneNumber':phone,
    };
     docUser.add(json);
  }
}
