import 'package:firebase_auth/firebase_auth.dart';
import 'package:sample_app/authentification/user.dart';

class Auth {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<dynamic> registerUser(email, password) async {
    AuthResult result = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    FirebaseUser user = result.user;

    return userFromFirebase(user);
  }

  User userFromFirebase(user) {
    return User(email: user.email, uid: user.uid);
  }
}
