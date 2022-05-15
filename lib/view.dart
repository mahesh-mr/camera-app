import 'dart:io';

import 'package:flutter/material.dart';

class ViewImage extends StatelessWidget {
   ViewImage({ Key? key,required this.path }) : super(key: key);
  String path;

 
  @override
  Widget build(BuildContext context) {
    return Container(
     
      child: Image.file(File(path)),
      
    );
  }
}