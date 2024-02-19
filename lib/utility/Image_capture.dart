import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ImageInput extends StatefulWidget {
  const ImageInput({super.key,required this.onPickImage});
  final void Function(File image) onPickImage;
  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File?_selectedImage;

  void _takePicture()async{
    final imagePicker=ImagePicker();
    final pickedImage= await imagePicker.pickImage(source: ImageSource.camera, maxWidth: 200,maxHeight: 100);

    if(pickedImage==null){
      return;
    }
    setState(() {
      _selectedImage=File(pickedImage.path);
    });

    widget.onPickImage(_selectedImage!);

  }

  void _takeGallary()async{
    final imagePicker=ImagePicker();
    final pickedImage= await imagePicker.pickImage(source: ImageSource.gallery, maxWidth: 600);

    if(pickedImage==null){
      return;
    }
    setState(() {
      _selectedImage=File(pickedImage.path);
    });

    widget.onPickImage(_selectedImage!);

  }
  @override
  Widget build(BuildContext context) {

    Widget content = Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton.icon(
            icon: const Icon(Icons.camera_alt,
            color: Colors.teal,
            ),
            label: const Text('Take Picture from Camera',
            style: TextStyle(
              color: Colors.teal
            ),
            ),
            onPressed: _takePicture,
          ),
          SizedBox(height: 20,),
          ElevatedButton(onPressed: _takeGallary,
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith((states) => Colors.teal),
              ),
              child: Text("Take from Gallary",

          )),
        ],
      ),
    );

    if(_selectedImage!=null){
      content=Container(
        height: 500,
        width: 500,
        child: Image.file( _selectedImage!,
          fit: BoxFit.cover,
          width: double.infinity,
        ),
      );
    }
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
        ),
      ),
      height: 250,
      width: double.infinity,
      alignment: Alignment.center,
      child:content,
    );
  }
}