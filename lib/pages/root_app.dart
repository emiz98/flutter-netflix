import 'package:flutter/material.dart';
import 'package:netflix/json/root_app_json.dart';
import 'package:netflix/pages/coming_soon.dart';
import 'package:netflix/pages/downloads_page.dart';
import 'package:netflix/pages/favourites_page.dart';
import 'package:netflix/pages/home_page.dart';
import 'package:netflix/pages/search_page.dart';

class RootApp extends StatefulWidget {
  const RootApp({Key? key}) : super(key: key);

  @override
  _RootAppState createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int activeTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: getFooter(),
      body: getBody(),
    );
  }

  Widget getBody() {
    return IndexedStack(
      index: activeTab,
      children: [
        HomePage(),
        ComingSoonPage(),
        SearchPage(),
        FavouritesPage(),
        DownloadsPage()
      ],
    );
  }

  Widget getFooter() {
    return Container(
      height: 60,
      decoration: BoxDecoration(color: Colors.black),
      child: Padding(
        padding: const EdgeInsets.only(left: 25, right: 25, top: 0, bottom: 0),
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(items.length, (index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      activeTab = index;
                    });
                  },
                  child: Column(
                    children: [
                      Icon(
                        items[index]['icon'],
                        color: Colors.white,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(items[index]['text'],
                          style: TextStyle(color: Colors.white, fontSize: 10))
                    ],
                  ),
                );
              })),
        ),
      ),
    );
  }
}
