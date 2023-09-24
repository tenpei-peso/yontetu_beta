import 'package:beta/domain/repositories/firebase_api_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseApiRepositoryImpl implements FirebaseApiRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Stream<User?> watchAuthState() => _firebaseAuth.authStateChanges();

  @override
  Future<User?> signIn(String email, String password) async {
    final result = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
    return result.user;
  }

  @override
  Future<void> signOut() => _firebaseAuth.signOut();

}