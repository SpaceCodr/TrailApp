import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:trailapp/our_models.dart';

final db =FirebaseFirestore.instance;

class UserModel {
  User? firebaseUser;
  String? uid;
  String? email;
  Tasks? tasks;
  PomoSettings? pomoSetting;
  int? ranking;

  static late UserModel _instance;

  UserModel._();
  factory UserModel.getInstance(){
    return _instance;
  }
  static void initialize(User user){
  //  String action = _instance == null ? "initialized" : "re_initialized";
  //  print('User has been'+ action);
    _instance = UserModel._();
    _instance.firebaseUser = user;
    _instance.uid = user.uid;
    _instance.email = user.email;
    _instance.ranking = 1;
    _instance.tasks = Tasks(db.collection("users").doc(_instance.uid));
    _instance.pomoSetting = PomoSettings(db.collection("users").doc(_instance.uid));
  }
  void assignFromUser(User user){
    firebaseUser=user;
    uid=user.uid;
    email=user.email;
    ranking=1;
    tasks=Tasks(db.collection("users").doc(this.uid));
    pomoSetting=PomoSettings(db.collection("users").doc(this.uid));
  }
  Future<bool> resetAccount() async {
    try {
      await db.collection("users").doc(this.uid).update({
        "tasks": null,
        "ranking": 1
      });
          return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}