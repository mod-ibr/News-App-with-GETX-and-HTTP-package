import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:news_app_getx_http/controller/News_controller.dart';
import 'package:news_app_getx_http/view/bottom_nav_bar/science.dart';
import 'package:news_app_getx_http/view/bottom_nav_bar/technology.dart';

import 'bottom_nav_bar/health.dart';

class HomeView extends GetWidget {
  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [
      Health(),
      Technology(),
      Science(),
    ];
    NewsController controller = Get.put(NewsController());

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("News App"),
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.health_and_safety), text: 'Health'),
              Tab(
                icon: Icon(Icons.mobile_friendly),
                text: 'Technology',
              ),
              Tab(
                icon: Icon(Icons.science),
                text: "Science",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Health(),
            Technology(),
            Science(),
          ],
        ),
      ),
    );
    // Scaffold(
    //   bottomNavigationBar: BottomNavigationBar(
    //     selectedItemColor: Colors.red,
    //     currentIndex: controller.currentIndex.value,
    //     onTap: (val) {
    //       print('==========================');
    //       print('Page :$val');
    //       print('==========================');

    //       controller.currentIndex.value = val;
    //     },
    //     items: const [
    //       BottomNavigationBarItem(label: "Sports", icon: Icon(Icons.sports)),
    //       BottomNavigationBarItem(label: "Science", icon: Icon(Icons.science)),
    //       BottomNavigationBarItem(
    //           label: "health", icon: Icon(Icons.health_and_safety)),
    //     ],
    //   ),
    //   body: GetX<NewsController>(
    //       builder: (controller) => screens[controller.currentIndex.value]),
    // );
  }
}
