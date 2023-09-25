import 'package:beta/presentation/page/blue_page/blue_page.dart';
import 'package:beta/presentation/page/green_page/green_page.dart';
import 'package:beta/presentation/page/orange_page/orange_page.dart';
import 'package:beta/presentation/page/red_page/red_page.dart';
import 'package:beta/presentation/page/yellow_page/yellow_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../../domain/notifiers/auth_notifier.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authNotifier = ref.watch(authNotifierProvider.notifier);

    // ボトムバーに表示したい画面のリスト
    final _pages = [
      const RedPage(),
      const BluePage(),
      const YellowPage(),
      const GreenPage(),
      const OrangePage(),
    ];

    // どのページを初期画面にするか
    PersistentTabController _controller =
        PersistentTabController(initialIndex: 0);

    return Scaffold(
      body: PersistentTabView(
        context,
        controller: _controller,
        screens: _pages, // 宣言した画面のリストを設定
        navBarStyle: NavBarStyle.style1, // navBarのstyleを設定
        itemAnimationProperties: const ItemAnimationProperties(
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: const ScreenTransitionAnimation(
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        items: [
          // 画面数の分、「PersistentBottomNavBarItem」を設定
          PersistentBottomNavBarItem(
            textStyle: const TextStyle(
              fontSize: 14,
            ),
            iconSize: 30,
            // 選択時のIcon
            icon: const Icon(
              Icons.home,
            ),
            // ラベル
            title: 'ホーム',
            // 選択時のColor
            activeColorPrimary: Colors.red,
            // 非選択時のColor
            inactiveColorPrimary: Theme.of(context).disabledColor,
          ),
          PersistentBottomNavBarItem(
            textStyle: const TextStyle(
              fontSize: 14,
            ),
            iconSize: 30,
            // 選択時のIcon
            icon: const Icon(
              Icons.person,
            ),
            // ラベル
            title: 'プロフィール',
            // 選択時のColor
            activeColorPrimary: Colors.blue,
            // 非選択時のColor
            inactiveColorPrimary: Theme.of(context).disabledColor,
          ),
          PersistentBottomNavBarItem(
            textStyle: const TextStyle(
              fontSize: 14,
            ),
            iconSize: 30,
            // 選択時のIcon
            icon: const Icon(
              Icons.task_alt,
            ),
            // ラベル
            title: 'クエスト',
            // 選択時のColor
            activeColorPrimary: Colors.yellow,
            // 非選択時のColor
            inactiveColorPrimary: Theme.of(context).disabledColor,
          ),
          PersistentBottomNavBarItem(
            textStyle: const TextStyle(
              fontSize: 14,
            ),
            iconSize: 30,
            // 選択時のIcon
            icon: const Icon(
              Icons.pets,
            ),
            // ラベル
            title: '育成',
            // 選択時のColor
            activeColorPrimary: Colors.green,
            // 非選択時のColor
            inactiveColorPrimary: Theme.of(context).disabledColor,
          ),
          PersistentBottomNavBarItem(
            textStyle: const TextStyle(
              fontSize: 14,
            ),
            iconSize: 30,
            // 選択時のIcon
            icon: const Icon(
              Icons.settings,
            ),
            // ラベル
            title: '設定',
            // 選択時のColor
            activeColorPrimary: Colors.orange,
            // 非選択時のColor
            inactiveColorPrimary: Theme.of(context).disabledColor,
          ),
        ],
      ),
    );
  }
}
