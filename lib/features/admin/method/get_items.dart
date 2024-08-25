import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

Future<List<dynamic>> getItems() async {
  try {
    final firebase = FirebaseFirestore.instance;
    final response = await firebase.collection('items').get();
    final itemList = response.docs.map((e) => e.data()).toList();
    return itemList;
  } catch (error) {
    print(error);
    return [];
  }
}
