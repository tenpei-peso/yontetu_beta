import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
      backgroundColor: Color(0xFFd2ddde),
      body: Column(
        children: [
          Row(
            children: [
              Icon(
                Icons.favorite,
                color: Color(0xFFee7d50),
              ),
              Icon(
                Icons.favorite,
                color: Color(0xFFee7d50),
              ),
              Icon(
                Icons.favorite,
                color: Color(0xFFee7d50),
              )
            ],
          )
        ],
      ),
    );
  }
}
