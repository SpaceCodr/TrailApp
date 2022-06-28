import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:trailapp/our_models.dart';


class UserModel {
//  User? firebaseUser;
  final String? id;
  final String email;
//  final Tasks tasks;
  final PomoSettings pomoSetting;
  final int ranking;
  UserModel(
      {this.id,
        required this.email,
        required this.pomoSetting,
        required this.ranking,
      });

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'pomoSetting': pomoSetting,
      'ranking': ranking
    };
  }

  UserModel.fromDocumentSnapshot(DocumentSnapshot<Map<String, dynamic>> doc)
      : id = doc.id,
        email = doc.data()!["email"],
        pomoSetting = PomoSettings.fromMap(doc.data()!["pomoSetting"]),
        ranking = doc.data()!["ranking"];
}