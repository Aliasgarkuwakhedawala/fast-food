import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fast_food/features/admin/screen/admin_screen.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

final uuid = Uuid();
// function to store the data into firebase using uuid for unique id to each item
Future<void> addItem(BuildContext context, String name, String desc,
    String price, String discount, String time, File image) async {
  try {
    final firebaseRef = await FirebaseStorage.instance
        .ref()
        .child('item_image')
        .child('$name.jpg');
    await firebaseRef.putFile(image);
    final imageURL = await firebaseRef.getDownloadURL();
    final id = uuid.v4();
    await FirebaseFirestore.instance.collection('items').doc(id).set({
      'id': id,
      'name': name,
      'description': desc,
      'price': price,
      'discount': discount,
      'time': time,
      'image': imageURL,
    });
    // navigating back once data is uploaded
    Navigator.of(context).pop();
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => AdminPanelScreen(),
      ),
    );
  } catch (error) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(error.toString() ?? 'Authentication failes!'),
      ),
    );
  }

  return;
}
