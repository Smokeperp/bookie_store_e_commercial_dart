import 'package:flutter/material.dart';

BottomNavigationBarItem buildBottomNavTile(String text, IconData icon) {
  return BottomNavigationBarItem(icon: Icon(icon), label: text);
}
