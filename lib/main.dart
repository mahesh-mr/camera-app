import 'package:flutter/material.dart';
import 'package:mynew_cam/home_page.dart';
import 'package:mynew_cam/icons.dart';

void main(List<String> args) {
  runApp(Oncam());
  
}
class Oncam extends StatelessWidget {
  const Oncam({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      
    );
  }
}