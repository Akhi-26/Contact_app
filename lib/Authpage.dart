import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:task_1/screens/Homescreen.dart';
import 'package:task_1/screens/Loginscreen.dart';

class Authpage extends StatelessWidget {
  const Authpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context ,AsyncSnapshot<User?>snapshot){
          if(snapshot.connectionState==ConnectionState.waiting){
            return const CircularProgressIndicator();
          }else{
            if(snapshot.hasData){
              return const Homescreen();
            }
            else{
              return const Loginscreen();
            }
          }
    },
    );
  }
}
