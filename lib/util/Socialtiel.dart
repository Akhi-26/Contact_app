import 'package:flutter/material.dart';

class Socialtile extends StatelessWidget {
  const Socialtile({Key? key,required this.ontap,required this.text}) : super(key: key);

  final Function()? ontap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        width: MediaQuery.of(context).size.width*0.5,
        height: 50,
        decoration: BoxDecoration(
            color: Colors.grey.shade300,
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(12)),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(text,style: const TextStyle(fontSize: 16),)
          ],
        ),
      ),
    );
  }
}
