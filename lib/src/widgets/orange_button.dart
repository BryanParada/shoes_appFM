import 'package:flutter/material.dart';

class OrangeButton extends StatelessWidget {
  final String text;
  final double myHeight;
  final double myWidth;
  
  const OrangeButton({required this.text, this.myHeight = 50, this.myWidth = 150});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: myWidth,
      height: myHeight,
      decoration: BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.circular(100)
      ),
      child: Text('$text', style: TextStyle( color: Colors.white, fontWeight: FontWeight.bold)),

    );
  }
}