import 'package:flutter/material.dart';

class Signtile extends StatelessWidget {
  const Signtile({Key? key,required this.text,required this.ontap}) : super(key: key);

  final String text;
  final Function()? ontap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        width: MediaQuery.of(context).size.width*0.5,
        height: 50,
        decoration: BoxDecoration(
            color: Colors.blue.shade200,
            borderRadius: BorderRadius.circular(12)),
        child: Center(
            child: Text(
              text,
              style: const TextStyle(fontSize: 17),
            )),
      ),
    );
  }
}