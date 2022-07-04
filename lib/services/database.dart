import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:trailapp/our_models.dart';

final authProvider = Provider<FirebaseAuth>((ref) => FirebaseAuth.instance);
final firestoreProvider = Provider<FirebaseFirestore>((ref) => FirebaseFirestore.instance);

class Database {
  final FirebaseFirestore db = FirebaseFirestore.instance;
  Future getUserDoc(id) {
    return db.collection('users').doc(id).get();
  }

}