import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
 

class ImagePickerWidget extends StatefulWidget {
  @override
  _ImagePickerWidgetState createState() => _ImagePickerWidgetState();
}

class _ImagePickerWidgetState extends State<ImagePickerWidget> {

  final picker = ImagePicker();

  Future getImage() async {
    final PickedFile  pickedFile = await picker.getImage(source: ImageSource.camera);
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      CircleAvatar( radius: 60),
      FlatButton.icon(
          textColor: Theme.of(context).primaryColor,
          icon: Icon(Icons.image),
          label: Text('Pick image'),
          onPressed: (){
            getImage();
          }
          )
    ],);
  }
}
