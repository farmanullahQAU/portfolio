import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:port/pages/about.dart';

import '../intro/view.dart';
import '../projects/view.dart';
import '../skills.dart';

class HomeViewController extends GetxController {
  final _isDark = true.obs;
  bool isHovered = false;
  bool isShow = true;
  int selectedIndex = 0;
  final List<Widget> pages = [
    IntroView(),
    const AboutView(),
    SkillsView(),
    FrontPage(),
  ];

  PageController? pageController = PageController();

  set isDark(bool val) => _isDark.value = val;
  bool get isDark => _isDark.value;

  changeTheme() {
    _isDark.toggle();
    if (Get.isDarkMode) {
      Get.changeThemeMode(ThemeMode.light);
    } else {
      Get.changeThemeMode(ThemeMode.dark);
    }
  }

  onHover(bool hover) {
    isHovered = hover;
    update(["home"]);
  }

  @override
  void onClose() {
    pageController?.dispose();
    super.onClose();
  }

  void onPageChanged(int index) {
    selectedIndex = index;
    isShow = false;
    update(["home"]);
  }

  onMenueToggle() {
    this.isShow = !isShow;
    update(["home"]);
  }

  void onDestinationSelected(int index) {
    if (index <= 3) {
      onPageChanged(index);
      pageController?.animateToPage(
        index,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }
}
