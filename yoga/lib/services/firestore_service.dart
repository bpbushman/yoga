import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:yoga/models/schedule.dart';
import 'package:yoga/models/user.dart';

@lazySingleton
class FirestoreService {
  final CollectionReference _userRef = Firestore.instance.collection("users");
  final CollectionReference _classRef = Firestore.instance.collection("classes");
  final CollectionReference _favRef = Firestore.instance.collection("favorites");
  final StreamController<List<Activity>> _classController = 
      StreamController<List<Activity>>.broadcast();

  Future setFavorite(String uid, String activity) async {
    try {
      await _favRef
        .document(uid)
        .setData({'favoriteClass' : activity});
    } catch(e) {
      return e.message;
    }
  }

  Future createUser(User user) async {
    try {
      await _userRef
      .document(user.uid)
      .setData(user.toJson());
    } catch(e) {
      return e.message;
    }
  }

  Future getUser(String uid) async {
    try{
      var userData = await _userRef.document(uid).get();
      return User.fromData(userData.data);
    } catch(e) {
      return e.message;
    }
  }
  // creating and reading a class in firestore
  Future addClass(Activity activity) async {
    try {
      await _classRef.document(activity.title).setData(activity.toJson());
      return true;
    } catch (e) {
      return e.toString();
    }
  }

  Stream listenToClasses() {
    _classRef.snapshots().listen((classSnapshot) {
      if(classSnapshot.documents.isNotEmpty) {
        var activities = classSnapshot
          .documents
          .map((snapshot) => Activity.fromJson(snapshot.data))
          .where((item) => item.title != null)
          .toList();
        _classController.add(activities);
      }
     });
    return _classController.stream;
  }
 }