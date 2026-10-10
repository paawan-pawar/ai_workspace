import 'package:flutter/material.dart';

import 'core/theme/app_theme.dart';
import 'navigation/app_router.dart';

class AiWorkspaceApp extends StatelessWidget {
  const AiWorkspaceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IntentOS',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      initialRoute: AppRouter.initial,
      routes: AppRouter.routes,
      onGenerateRoute: AppRouter.onGenerateRoute,
      onUnknownRoute: AppRouter.onUnknownRoute,
    );
  }
}