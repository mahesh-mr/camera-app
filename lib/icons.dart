import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mynew_cam/home_page.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class OOOO extends StatefulWidget {
  const OOOO({ Key? key }) : super(key: key);

  @override
  State<OOOO> createState() => _OOOOState();
}

class _OOOOState extends State<OOOO> {
  File? image;

  Future getImage(ImageSource source) async{
   final image = await ImagePicker().pickImage(source: source);
   if(image==null)return;
  //  final imageTemporary = File(image.path);
  final imagePermanently = await saveImagePermanently(image.path);
   setState(() =>this.image =imagePermanently);
    GallerySaver.saveImage(image.path,albumName: 'data');
  
  }

  Future<File> saveImagePermanently(String imagepath)async{
    final directory =await getApplicationDocumentsDirectory();
    final name = basename(imagepath);
    final image = File('${directory.path}/$name');
    return File(imagepath).copy(image.path);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
            buttons(titile: 'Select Image', icon: Icons.camera_alt_outlined, onclicked: (){Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const HomePage()),
  );}),
              SizedBox(height: 10,),
               buttons(titile: 'Select Image', icon: Icons.camera_alt_outlined, onclicked: ()=>getImage(ImageSource.camera))
        ],
      ),
      
    );
  }

   Widget buttons({
    required String titile,
    required IconData icon,
    required VoidCallback onclicked
  })=>ElevatedButton(style: ElevatedButton.styleFrom(minimumSize: Size.fromHeight(50),primary: Colors.white,onPrimary: Colors.black,textStyle: TextStyle(fontSize: 20)),
   onPressed: onclicked, child: Row(children: [
     Icon(icon,size: 30,),
     SizedBox(width: 16,),
   ],));
}