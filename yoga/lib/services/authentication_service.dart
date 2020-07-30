import 'package:firebase_auth/firebase_auth.dart';
//import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:yoga/app/locator.dart';
import 'package:yoga/models/user.dart';
import 'package:yoga/services/firestore_service.dart';

@lazySingleton
class AuthenticationService {
  //final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirestoreService _firestoreService = locator<FirestoreService>();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<bool> isUserLoggedIn() async {
    var user = await _firebaseAuth.currentUser();
    return user != null;
  }

  Future emailSignup({String email, String password, String username}) async {
    try {
      var authResult = await _firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password);
      await _firestoreService
        .createUser(User(
          uid: authResult.user.uid,
          email: email,
          username: username
        ));
      return authResult.user != null;
    } catch(e) {
      return e.message;
    }
  }

  Future loginWithEmail({String email, String password}) async {
    try {
      var user = await _firebaseAuth
        .signInWithEmailAndPassword(email: email, password: password);
      return user != null;
    } catch (e) {
      return e.message;
    }
  }

  void signout() {
    _firebaseAuth.signOut();
  }

}