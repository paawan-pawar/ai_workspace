import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

enum AppPlatform { web, mobile }

class PlatformUtils {
  PlatformUtils._();

  static AppPlatform current() {
    if (kIsWeb) return AppPlatform.web;
    return AppPlatform.mobile;
  }

  static bool isWeb() => kIsWeb;
  static bool isMobile() => !kIsWeb;

  static bool isWideScreen(BuildContext ctx) =>
      MediaQuery.of(ctx).size.width >= 900;
}