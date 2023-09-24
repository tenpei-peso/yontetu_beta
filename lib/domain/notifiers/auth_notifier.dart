import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../repositories/firebase_api_repository.dart';

part 'auth_notifier.freezed.dart';

@freezed
class AuthState with _$AuthState {
  factory AuthState({
    User? currentUser,
    @Default(false) bool isLogin,
  }) = _AuthState;
}

final authNotifierProvider =
    StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  //firebaseApiRepositoryを注入
  final firebaseApiRepository = ref.watch(firebaseApiRepositoryProvider);
  return AuthNotifier(firebaseApiRepository);
});

class AuthNotifier extends StateNotifier<AuthState> {
  final FirebaseApiRepository _firebaseApiRepository;

  AuthNotifier(this._firebaseApiRepository) : super(AuthState()) {
    Future.microtask(() {
      _init();
    });
  }

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  _init() async {
    _firebaseApiRepository.watchAuthState().listen((User? user) {
      if (user == null) {
        state = state.copyWith(isLogin: false);
      } else {
        state = state.copyWith(isLogin: true);
      }
    });
  }

  Future<void> signUp() async {
    try {
      final User? user = await _firebaseApiRepository.signUp(
          emailController.text, passwordController.text
      );
      if (user != null) {
        state = state.copyWith(currentUser: user);
      }
    } on FirebaseAuthException catch (e) {
      debugPrint(e.toString());
    }
  }

  void signOut() async {
    await _firebaseApiRepository.signOut();
    state = state.copyWith(currentUser: null);
  }

// Future<void> createFirestoreUser({required String uid}) async {
//   final FirestoreUser firestoreUser = FirestoreUser(
//     email: emailController.text,
//     githubUserName: githubUserNameController.text,
//     uid: uid,
//     githubApiKey: githubApiKeyController.text,
//   );
//   final Map<String, dynamic> userData = firestoreUser.toJson();
//   await FirebaseFirestore.instance.collection("users").doc(uid).set(userData);
// }
}
