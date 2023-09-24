import 'package:beta/presentation/page/auth_page/sign_in_page.dart';
import 'package:beta/presentation/page/home_page/home_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'domain/notifiers/auth_notifier.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLogin = ref
        .watch(authNotifierProvider.select((state) => state.isLogin));

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'beta',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: isLogin ? const HomePage() : const SignInPage()
    );

  }
}