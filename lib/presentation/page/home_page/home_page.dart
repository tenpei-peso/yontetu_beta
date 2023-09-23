import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: const Color(0xFFd2ddde),
        body: Column(
          children: [
            const TopIconBar(),
            Container(
              color: Colors.white,
              child: const TabBar(
                tabs: <Widget>[
                  Tab(
                      icon: Icon(
                    Icons.cloud_outlined,
                    color: Color(0xFFee7d50),
                  )),
                  Tab(
                      icon: Icon(
                    Icons.beach_access_sharp,
                    color: Color(0xFFee7d50),
                  )),
                  Tab(
                      icon: Icon(
                    Icons.brightness_5_sharp,
                    color: Color(0xFFee7d50),
                  )),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: <Widget>[
                  Container(
                      color: Colors.white,
                      child: Center(
                          child: Text('くもり', style: TextStyle(fontSize: 50)
                          )
                      )
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TopIconBar extends StatelessWidget {
  const TopIconBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.12,
      child: const Align(
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.0),
                  child: Icon(
                    Icons.favorite,
                    color: Color(0xFFee7d50),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.favorite,
                    color: Color(0xFFee7d50),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Icon(
                Icons.favorite,
                color: Color(0xFFee7d50),
              ),
            )
          ],
        ),
      ),
    );
  }
}
