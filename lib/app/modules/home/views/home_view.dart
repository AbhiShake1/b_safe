import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  static const TextStyle _textStyle = TextStyle(
    fontSize: 40,
    fontWeight: FontWeight.w700,
    letterSpacing: 2,
  );

  List<Widget> pages = [
    Text('Home'),
    Text('Profile Page Noice'),
  ];

  HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: GetX<HomeController>(builder: (controller) {
        return Center(
          child: pages[Get.find<HomeController>().currentIndex.value],
        );
      }),
      bottomNavigationBar: GetX<HomeController>(builder: (controller) {
        return NavigationBar(
          selectedIndex: Get.find<HomeController>().currentIndex.value,
          onDestinationSelected: (int newIndex) {
            Get.find<HomeController>().currentIndex.value = newIndex;
          },
          destinations: const [
            NavigationDestination(
                selectedIcon: Icon(Icons.home),
                icon: Icon(Icons.home_outlined),
                label: 'Home'),
            NavigationDestination(
                selectedIcon: Icon(Icons.account_circle),
                icon: Icon(Icons.account_circle_outlined),
                label: 'Profile'),
          ],
        );
      }),
    );
  }
}
