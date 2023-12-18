import 'package:brew_crew1/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // create user object based on Firebaseuser
  BrewUser? _userFromFirebaseUser(User? user) {
    return user != null ? BrewUser(uid: user.uid) : null;
  }

  // sign in anon
  Future<BrewUser?> signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
