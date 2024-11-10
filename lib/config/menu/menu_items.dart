import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final String subTitle;
  final String link;
  final IconData icon;

  const MenuItem(
      {required this.title,
      required this.subTitle,
      required this.link,
      required this.icon});
}

const appMenuItems = <MenuItem>[
  MenuItem(
      title: "Riverpod Counter",
      subTitle: "Counter with Riverpod",
      link: "/counter",
      icon: Icons.add),
  MenuItem(
      title: "Buttons",
      subTitle: "Several buttons in Flutter",
      link: "/buttons",
      icon: Icons.smart_button_outlined),
  MenuItem(
      title: "Snackbars and Dialogs",
      subTitle: "Several dialogs and snackbars in Flutter",
      link: "/snackbar",
      icon: Icons.window_rounded),
  MenuItem(
      title: "Tutorial",
      subTitle: "Introduction to Widgets App",
      link: "/tutorial",
      icon: Icons.accessibility_new_rounded),
  MenuItem(
      title: "Infinite Scroll",
      subTitle: "Infinite Scroll and Pull to Refresh",
      link: "/infinite",
      icon: Icons.list_alt_rounded),
  MenuItem(
      title: "Theme Changer",
      subTitle: "Infinite Scroll and Pull to Refresh",
      link: "/theme-changer",
      icon: Icons.color_lens_outlined),
];
