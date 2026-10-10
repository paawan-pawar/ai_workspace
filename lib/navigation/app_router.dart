import 'package:flutter/material.dart';

import '../screens/workspace_screen.dart';

/// Central place for all named routes.
/// Today the app has only one screen (WorkspaceScreen morphs internally),
/// so this stays small. Add routes here as the app grows:
///   - /login       (auth)
///   - /settings    (preferences)
///   - /account/:id (deep link into a client account)
class AppRouter {
  AppRouter._();

  // Route names
  static const String workspace = '/';
  static const String settings = '/settings';

  // Initial route
  static const String initial = workspace;

  // Route table
  static Map<String, WidgetBuilder> get routes => {
        workspace: (_) => const WorkspaceScreen(),
        // Add future routes here:
        // settings: (_) => const SettingsScreen(),
      };

  // Handler for unknown routes (fallback to workspace)
  static Route<dynamic> onUnknownRoute(RouteSettings s) {
    return MaterialPageRoute(
      settings: s,
      builder: (_) => const WorkspaceScreen(),
    );
  }

  // Handler for generating routes on demand.
  // Useful later when we need to pass arguments (e.g., /account/acme).
  static Route<dynamic>? onGenerateRoute(RouteSettings s) {
    switch (s.name) {
      case workspace:
        return MaterialPageRoute(
          settings: s,
          builder: (_) => const WorkspaceScreen(),
        );
      // case settings:
      //   return MaterialPageRoute(
      //     settings: s,
      //     builder: (_) => const SettingsScreen(),
      //   );
      default:
        return null;
    }
  }
}