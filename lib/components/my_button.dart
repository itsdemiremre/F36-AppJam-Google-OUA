import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {

final Function()? onTab;

  const MyButton({super.key, required this.onTab,required this.text});
  
  final String text ;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTab,
      child: Container(
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.symmetric(horizontal: 25.0),
        decoration: BoxDecoration(
          color: Color.fromARGB(250, 66, 131, 241),
          borderRadius: BorderRadius.circular(15)
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
            ),
        ),
      ),
    );
  }
}