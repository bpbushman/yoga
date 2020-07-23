import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:yoga/models/user.dart';

@lazySingleton
class AuthenticationService {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  User _currentUser;
  User get currentUser => _currentUser;

  Future<FirebaseUser> _handleSignIn() async {
  //will hold a new authenticated user, and check if user is already signed in
    FirebaseUser user;
    bool isSignedIn = await _googleSignIn.isSignedIn();
    if (isSignedIn) {
      print('user signed in!');
      user = await _firebaseAuth.currentUser();
    } else {
  //or create a new user that can be passed into a current user object
      final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider
        .getCredential(
          idToken: googleAuth.accessToken, 
          accessToken: googleAuth.idToken);
      user = (await _firebaseAuth.signInWithCredential(credential)).user;
      print('user created');
      print(user);
    }
    return user;
  }

  void googleSignIn() async {
    var user = await _handleSignIn();
    
    _currentUser = User(
        name: user.displayName,
        uid: user.uid);
    print(_currentUser.name);
    print(_currentUser.uid);
  }
}