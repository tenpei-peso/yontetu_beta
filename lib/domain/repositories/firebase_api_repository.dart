import 'package:beta/infrastructure/firebase_api_repository_impl.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final firebaseApiRepositoryProvider = Provider<FirebaseApiRepository>((ref) {
  return FirebaseApiRepositoryImpl();
});

abstract class FirebaseApiRepository {
  Stream<User?> watchAuthState();
  Future<User?> signIn(String email, String password);
  Future<void> signOut();
// 他のFirebaseのメソッドもここに追加
}