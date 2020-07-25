import 'package:firebase_auth/firebase_auth.dart';
//import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
//import 'package:yoga/models/user.dart';

@lazySingleton
class AuthenticationService {
  //final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future emailSignup ({String email,  String password}) async {
    try {
      var authResult = await _firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password);
      return authResult.user != null;
    } catch(e) {
      return e.message;
    }
  }

}