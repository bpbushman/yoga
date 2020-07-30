import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:yoga/models/user.dart';

@lazySingleton
class FirestoreService {
  final CollectionReference _userRef = Firestore.instance.collection("users");

  Future createUser(User user) async {
    try {
      await _userRef
      .document(user.uid)
      .setData(user.toJson());
    } catch(e) {
      return e.message;
    }
  }
}