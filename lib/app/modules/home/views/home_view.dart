import 'package:b_safe/app/packages/extensions/extensions.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = const [
      Text('Home'),
      Text('Profile Page Noice'),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: Center(
        child: pages[controller.currentIndex.value].obx,
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: controller.currentIndex.value,
        onDestinationSelected: (i) => controller.currentIndex.value = i,
        destinations: const [
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.account_circle),
            icon: Icon(Icons.account_circle_outlined),
            label: 'Profile',
          ),
        ],
      ).obx,
    );
  }
}
