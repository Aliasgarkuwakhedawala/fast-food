import 'package:cloud_firestore/cloud_firestore.dart';

final firestore = FirebaseFirestore.instance;

Future<void> deleteItem(String id) async {
  try {
    final response = firestore.collection('items').doc(id).delete();
  } catch (e) {
    print(e);
  }
}
