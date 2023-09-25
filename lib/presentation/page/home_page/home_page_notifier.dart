import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../blue_page/blue_page.dart';
import '../green_page/green_page.dart';
import '../orange_page/orange_page.dart';
import '../red_page/red_page.dart';

part 'home_page_notifier.freezed.dart';

@freezed
class HomePageState with _$HomePageState {
  factory HomePageState({
    @Default(0) int bottomNavIndex,
  }) = _HomePageState;
}

final homePageNotifierProvider =
StateNotifierProvider<HomePageNotifier, HomePageState>((ref) {
  return HomePageNotifier(ref);
});

class HomePageNotifier extends StateNotifier<HomePageState> {
  final Ref ref;

  HomePageNotifier(this.ref) : super(HomePageState()) {
    Future.microtask(() {
      _init();
    });
  }

  //ボトムバーに並べるアイコンのリスト
  final iconList = <IconData>[
    Icons.brightness_4,
    Icons.brightness_5,
    Icons.brightness_6,
    Icons.brightness_7,
  ];

  //真ん中を除くページのリスト
  final pageList = [
    const RedPage(),
    const BluePage(),
    const OrangePage(),
    const GreenPage(),
  ];

  _init() {
  }

  void changeIndex(int index) {
    state = state.copyWith(bottomNavIndex: index);
  }
}