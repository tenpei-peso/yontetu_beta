import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:beta/presentation/page/home_page/home_page_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:navigator_scope/navigator_scope.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homePageNotifier = ref.watch(homePageNotifierProvider.notifier);
    final bottomNavIndex = ref.watch(
        homePageNotifierProvider.select((state) => state.bottomNavIndex));

    return Scaffold(
      extendBody: true,
      body: NavigatorScope( // A hub of local navigators
          currentDestination: bottomNavIndex,
          destinationCount: homePageNotifier.iconList.length,
          destinationBuilder: (context, index) {
            return NestedNavigator( // A local navigator
              // Create the default page for this navigator
              builder: (context) => homePageNotifier.pageList[index],
            );
          },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.brightness_3,
          color: Colors.orangeAccent,
        ),
        onPressed: () {
          null;
        },
        //params
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar.builder(
        itemCount: homePageNotifier.iconList.length,
        backgroundColor: Colors.white,
        activeIndex: bottomNavIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.softEdge,
        splashColor: Colors.orangeAccent,
        splashSpeedInMilliseconds: 300,
        onTap: (index) {
          homePageNotifier.changeIndex(index);
        },
        tabBuilder: (int index, bool isActive) {
          final color = isActive ? Colors.orange : Colors.grey;
          return Icon(
            homePageNotifier.iconList[index],
            size: 32,
            color: color,
          );
        },
      ),
    );
  }
}
