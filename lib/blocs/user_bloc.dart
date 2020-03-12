import 'package:firebase_auth/firebase_auth.dart';

class UserBloc {
  final _auth = FirebaseAuth.instance;

  Future<FirebaseUser> get user => _auth.currentUser();

  void signUp(String email, String password) {
    _auth.createUserWithEmailAndPassword(email: email, password: password);
  }

  Future<bool> signIn(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return true;
    } catch (error) {
      print('Error: $error');
      return false;
    }
  }
}
