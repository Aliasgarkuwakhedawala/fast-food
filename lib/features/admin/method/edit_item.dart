import 'dart:io';
import 'package:fast_food/features/admin/screen/admin_screen.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

Future<void> editItem(
  BuildContext context,
  String id,
  String name,
  String desc,
  String price,
  String discount,
  String time,
  File? image,
  String prevImage,
) async {
  try {
    final _firebase = FirebaseFirestore.instance;

    if (image != null) {
      final firebaseRef = await FirebaseStorage.instance
          .ref()
          .child('item_image')
          .child('$name.jpg');
      await firebaseRef.putFile(image);
      final imageURL = await firebaseRef.getDownloadURL();
      final response = await _firebase.collection('items').doc(id).set({
        'id': id,
        'name': name,
        'description': desc,
        'price': price,
        'discount': discount,
        'time': time,
        'image': imageURL,
      });
    } else {
      final response = await _firebase.collection('items').doc(id).set({
        'id': id,
        'name': name,
        'description': desc,
        'price': price,
        'discount': discount,
        'time': time,
        'image': prevImage,
      });
    }
    Navigator.of(context).pop();
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => AdminPanelScreen(),
      ),
    );
  } catch (error) {
    print(error);
  }
}
