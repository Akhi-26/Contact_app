import 'package:cloud_firestore/cloud_firestore.dart';
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
  Widget build(BuildContext context) {
    final CollectionReference user =
        FirebaseFirestore.instance.collection('User');

    void deleteUser(docId) {
      user.doc(docId).delete();
    }

    return SafeArea(
      child: Scaffold(
          floatingActionButton: FloatingActionButton.extended(
              backgroundColor: Colors.blue.shade200,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AddContactPage()));
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
          body: StreamBuilder(
            stream: user.orderBy('name').snapshots(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                    Colors.blue.shade100,
                    Colors.grey.shade100,
                  ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Text(
                                "My Contacts",
                                style: TextStyle(
                                    fontSize: 30, fontWeight: FontWeight.w500),
                              ),
                            ),
                            InkWell(
                              child: const Icon(
                                Icons.logout,
                                size: 30,
                              ),
                              onTap: () {
                                FirebaseAuth.instance.signOut().then((value) {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const Loginscreen()));
                                });
                              },
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 50,
                          child: TextField(
                              decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.symmetric(vertical: 5),
                            filled: true,
                            fillColor: Colors.grey.shade100,
                            hintText: "Search contacts",
                            prefixIcon: const Icon(
                              Icons.search,
                              size: 25,
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide:
                                    BorderSide(color: Colors.grey.shade200)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide:
                                    BorderSide(color: Colors.grey.shade200)),
                          )),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Expanded(
                          child: ListView.builder(
                              itemCount: snapshot.data.docs.length,
                              itemBuilder: (context, index) {
                                final DocumentSnapshot userSnap =
                                    snapshot.data.docs[index];
                                return /*Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  child: */
                                    Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Flexible(
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      height: 70,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 10),
                                            child: Container(
                                              height: 60,
                                              width: 60,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(16),
                                                  color: Colors.blue.shade200),
                                            ),
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                userSnap['name'],
                                                overflow: TextOverflow.ellipsis,
                                                style: const TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w500),
                                              ),
                                              Text(
                                                userSnap['phonenumber'],
                                                style: const TextStyle(
                                                    fontSize: 17,
                                                    fontWeight: FontWeight.w300),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              IconButton(
                                                onPressed: () {},
                                                icon: const Icon(
                                                  Icons.call_outlined,
                                                  size: 24,
                                                ),
                                              ),
                                              IconButton(
                                                onPressed: () {
                                                  Navigator.pushNamed(
                                                      context, '/update',
                                                      arguments: {
                                                        'name': userSnap['name'],
                                                        'phonenumber': userSnap[
                                                            'phonenumber'],
                                                        'address':
                                                            userSnap['address'],
                                                        'email':
                                                            userSnap['email'],
                                                        'id': userSnap.id,
                                                      });
                                                },
                                                icon: const Icon(
                                                  Icons.edit,
                                                  size: 24,
                                                ),
                                              ),
                                              IconButton(
                                                onPressed: () {
                                                  deleteUser(userSnap.id);
                                                },
                                                icon: const Icon(
                                                  Icons.delete,
                                                  size: 24,
                                                ),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                      // ),
                                    ),
                                  ),
                                );
                              }),
                        ),
                      ],
                    ),
                  ),
                );
              }
              return Container();
            },
          )),
    );
  }
}
