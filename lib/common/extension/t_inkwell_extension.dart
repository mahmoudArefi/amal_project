
import 'package:flutter/material.dart';

extension InkWellExtension on Widget {
  Widget onTap(  function){
    return InkWell(
      onTap: ()=>function() ,
    );
  }
}
