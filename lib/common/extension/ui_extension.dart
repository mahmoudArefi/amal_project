import 'package:flutter/material.dart';

extension PaddingExtension on Widget {

  Widget test([Color ?color]){
    return Container(
      color:color??Colors.green.withOpacity(0.8),
      child: this,
    );
  }

  Widget paddedAll(double padding) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: this,
    );
  }

  Widget paddedLTRB(double left, double top, double right, double bottom) {
    return Padding(
      padding: EdgeInsets.fromLTRB(left, top, right, bottom),
      child: this,
    );
  }

  Widget paddedSymmetric({double vertical = 0.0, double horizontal = 0.0}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: vertical, horizontal: horizontal),
      child: this,
    );
  }

  Widget paddedOnly({
    double top = 0.0,
    double bottom = 0.0,
    double left = 0.0,
    double right = 0.0,
  }) {
    return Padding(
      padding:  EdgeInsets.only(top: top ,bottom: bottom,left: left,right: right),
      child: this,
    );
  }
}
