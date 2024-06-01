import 'package:flutter/material.dart';

class AText extends StatelessWidget {
  const AText(this.text, {this.fontSize, this.color,this.fontFamily,this.fontWeight, super.key});

  final String text;
  final double? fontSize;
  final Color? color;
  final String? fontFamily ;
  final FontWeight ? fontWeight ;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        color: color,
         fontFamily: fontFamily,
        fontWeight: fontWeight,
      ),
    );
  }
}
