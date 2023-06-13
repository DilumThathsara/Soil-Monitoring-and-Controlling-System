import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class L10n {
  static final all = [
    const Locale('en'),
    const Locale('si'),
    const Locale('ta'),
  ];

  static String getFlag(String code) {
    switch (code) {
      case 'si':
        Logger().i('Selected Sinhala Language');
        return 'සිංහල';

      case 'ta':
        return 'தமிழ்';
      default:
        return 'English';
    }
  }
}
