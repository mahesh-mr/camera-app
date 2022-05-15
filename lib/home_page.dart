

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:gallery_saver/gallery_saver.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
File? image;
  Future pickImage(ImageSource source) async{
   final image = await ImagePicker().pickImage(source: source);
   if(image==null)return;
  //  final imageTemporary = File(image.path);
  final imagePermanently = await saveImagePermanently(image.path);
   setState(() =>this.image =imagePermanently);
   
  
  }
  //  Future getImage(ImageSource source) async{
  //  final image = await ImagePicker().pickImage(source:ImageSource.camera );
  //  if(image==null)return;
  // //  final imageTemporary = File(image.path);
  // final imagePermanently = await saveImagePermanently(image.path);
  //  setState(() =>this.image =imagePermanently);
  //   GallerySaver.saveImage(image.path,albumName: 'data');

    
  
  // }
    takepicc()async{
    final image =await ImagePicker().pickImage(source: ImageSource.camera);
    if (image==null)return;
    setState(() {
       {
      final  images=File(image.path);
        GallerySaver.saveImage(image.path,albumName: 'data');

        
      }
    });}
  
  Future<File> saveImagePermanently(String imagepath)async{
    final directory =await getApplicationDocumentsDirectory();
    final name = basename(imagepath);
    final image = File('${directory.path}/$name');
    return File(imagepath).copy(image.path);
  }
  @override
  Widget build(BuildContext context) {
    return 
Scaffold(
  appBar: AppBar(
    title:   IconButton(onPressed: ()=> takepicc(), icon: Icon(Icons.camera_alt_outlined,size: 40,)),
    actions: [
  Padding(
    padding: const EdgeInsets.only(right: 10),
    child: IconButton(onPressed: ()=>pickImage (ImageSource.gallery), icon: Icon(Icons.image,size: 40,)),
  ),
    ],
  ),
 
      body: SafeArea(
        child: Center(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                children: [
                
                  
                  
                   
               
                image !=null? Image.file(image!):Card(color: Color.fromARGB(255, 251, 252, 251),),
               
                 
                 
                 
                ],
              ),
            ),
          ),
        ),
      ),
      
    );
  }
 


}