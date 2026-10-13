import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({super.key,required this.title,required this.press,required this.color});

  final String title;
  final void Function()? press;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(16),
                backgroundColor: color),
            onPressed: press, child: Text(title,style: TextStyle(color: Colors.white,fontSize: 20),)));
  }
}
