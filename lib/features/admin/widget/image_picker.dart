import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

// This is the separate widget to pick image

class ImagePickerWidget extends StatefulWidget {
  const ImagePickerWidget({super.key, required this.onPickImage});
  final void Function(File image) onPickImage;

  @override
  State<ImagePickerWidget> createState() {
    return _ImagePickerState();
  }
}

class _ImagePickerState extends State<ImagePickerWidget> {
  File? _selectedImage;

  void _takePicture() async {
    final imagePicker = ImagePicker();
    final pickedImage =
        await imagePicker.pickImage(source: ImageSource.gallery, maxWidth: 600);

    if (pickedImage == null) {
      return;
    }
    setState(() {
      _selectedImage = File(pickedImage.path);
    });
    widget.onPickImage(_selectedImage!);
  }

  @override
  Widget build(BuildContext context) {
    Widget child = TextButton.icon(
      onPressed: _takePicture,
      icon: const Icon(
        Icons.camera,
        color: Colors.black,
      ),
      label: const Text(
        'Take Picture',
        style: TextStyle(color: Colors.black),
      ),
    );

    if (_selectedImage != null) {
      child = GestureDetector(
        onTap: _takePicture,
        child: Image.file(
          _selectedImage!,
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
        ),
      );
    }

    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.grey),
      ),
      height: 250,
      width: double.infinity,
      alignment: Alignment.center,
      child: child,
    );
  }
}
