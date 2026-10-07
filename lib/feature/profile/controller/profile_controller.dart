import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {


  final List<Map<String, dynamic>> profileOptions = [
    {
      'title': 'Address',
      'icon': CupertinoIcons.location,
    },
    {
      'title': 'Notifications',
      'icon': CupertinoIcons.bell,
    },
    {
      'title': 'Settings',
      'icon': Icons.settings_outlined,
    },
    {
      'title': 'Wishlist',
      'icon': CupertinoIcons.heart,
    },
    {
      'title': 'Help & Support',
      'icon': CupertinoIcons.question_circle,
    },
    {
      'title': 'Payments',
      'icon': CupertinoIcons.creditcard,
    },
  ];
}