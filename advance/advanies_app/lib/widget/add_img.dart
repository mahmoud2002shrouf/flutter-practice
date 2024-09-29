import 'dart:io';

import 'package:flutter/material.dart';
import "package:image_picker/image_picker.dart";
class AddImg extends StatefulWidget {
const AddImg({ Key? key ,required this.onTakeImage}) : super(key: key);
final void Function(File image) onTakeImage;

  @override
  State<AddImg> createState() => _AddImgState();
}

class _AddImgState extends State<AddImg> {
  File? _selectedImg;
  void _takePhoto()async{
      final image=ImagePicker();
      final img=await image.pickImage(source: ImageSource.camera,maxWidth: 600);
      if(img==null){
        return;
      }
      setState(() {
      _selectedImg=File( img.path); 
        
      });
      widget.onTakeImage(_selectedImg!);

    }
  @override
  Widget build(BuildContext context){
    
        Widget content=TextButton.icon(onPressed: _takePhoto, label: const Text("take photo"),icon: const Icon(Icons.camera_alt),);
        if(_selectedImg!=null){
          content=GestureDetector(onDoubleTap: _takePhoto,child: Image.file(_selectedImg!,fit: BoxFit.cover,width: double.infinity,height: double.infinity,));
        }

    return Container(
      height: 250,
      width: double.infinity,
      alignment: Alignment.center,
      decoration: BoxDecoration(border: Border.all(width: 1,color: Theme.of(context).colorScheme.primary.withOpacity(0.2))),
      child:content ,
    );
  }
}