import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


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
  return AuthNotifier(ref);
});

class AuthNotifier extends StateNotifier<AuthState> {
  final Ref ref;

  AuthNotifier(this.ref) : super(AuthState()) {
    Future.microtask(() {
      _init();
    });
  }

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  _init() async {
    FirebaseAuth.instance
        .authStateChanges()
        .listen((User? user) {
      if (user == null) {
        state = state.copyWith(isLogin: false);
      } else {
        state = state.copyWith(isLogin: true);
      }
    });
  }

  Future<void> signIn() async {
    try {
      final result = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      final User? user = result.user;
      final String uid = user!.uid;
      state = state.copyWith(currentUser: user);
      print(state.currentUser);
      // await createFirestoreUser(uid: uid);
    } on FirebaseAuthException catch (e) {
      debugPrint(e.toString());
    }
  }

  void signOut() async {
    await FirebaseAuth.instance.signOut();
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
