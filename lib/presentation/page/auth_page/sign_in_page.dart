import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/notifiers/auth_notifier.dart';
import '../home_page/home_page.dart';


class SignInPage extends ConsumerWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authNotifier = ref.watch(authNotifierProvider.notifier);

    return Scaffold(
      backgroundColor: const Color(0xFFFFF5E0),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.1,),
              const Text(
                '新規登録',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 30,),
              Padding(
                padding: const EdgeInsets.only(top: 28.0),
                child: TextField(controller: authNotifier.emailController, hintText: 'emailを入力してください',),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 28.0),
                child: TextField(controller: authNotifier.passwordController, hintText: 'passwordを入力してください',),
              ),
              const Align(
                  alignment: Alignment.centerRight,
                  child: Text('8文字以上12文字以下の半角英数字')
              ),
              SizedBox(height: 24,),
              SizedBox(
                height: 64,
                width: 320,
                child: ElevatedButton(
                  onPressed: () async {
                    await authNotifier.signIn();
                  },
                  style: ButtonStyle(
                    backgroundColor:
                    MaterialStateProperty.all<Color>(const Color(0xFF1a0b08)),
                    foregroundColor:
                    MaterialStateProperty.all<Color>(const Color(0xFFFFF5E0)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40.0),
                      ),
                    ),
                  ),
                  child: const Text(
                    'はじめる',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TextField extends StatelessWidget {
  const TextField({
  super.key,
  required this.controller,
  required this.hintText,
  });
  final TextEditingController controller;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        filled: true, // 背景色を有効にする
        fillColor: const Color(0xffe3dfdc), // 背景色をグレーに設定
        contentPadding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24), // テキストのパディングを設定
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40.0), // 角丸の半径を設定
          borderSide: BorderSide.none, // 枠線を非表示にする
        ),
        hintText: hintText, // ヒントテキストを設定
      ),
    );
  }
}