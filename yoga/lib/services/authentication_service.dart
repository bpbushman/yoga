import 'package:firebase_auth/firebase_auth.dart';
//import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:yoga/app/locator.dart';
import 'package:yoga/models/user.dart';
import 'package:yoga/services/firestore_service.dart';

@lazySingleton
class AuthenticationService {
  final FirestoreService _firestoreService = locator<FirestoreService>();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  User _currentUser;
  User get currentUser => _currentUser;

  Future _populateCurrentUser(FirebaseUser user) async {
    if(user != null) {
      _currentUser = await _firestoreService.getUser(user.uid);
    }
  }

  Future<bool> isUserLoggedIn() async {
    var user = await _firebaseAuth.currentUser();
    await _populateCurrentUser(user);
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
      var authResult = await _firebaseAuth
        .signInWithEmailAndPassword(email: email, password: password);
      await _populateCurrentUser(authResult.user);
      return authResult.user != null;
    } catch (e) {
      return e.message;
    }
  }

  void signout() {
    _firebaseAuth.signOut();
  }

}