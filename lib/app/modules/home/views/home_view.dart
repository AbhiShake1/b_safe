import 'package:b_safe/app/modules/home/controllers/home_controller.dart';
import 'package:b_safe/app/packages/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    const pages = <Widget>[
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
