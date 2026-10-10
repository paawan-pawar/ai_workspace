import '../models/intent.dart';

/// Layer 1 fallback: keyword-based intent routing.
/// Runs BEFORE the LLM. If it matches, we skip the network call entirely.
class FallbackRouter {
  FallbackRouter._();

  static Intent? route(String input) {
    final t = input.toLowerCase();

    if (_any(t, ['meeting', 'client', 'prepare', 'call'])) {
      return const Intent(
        type: 'client_meeting_prep',
        entities: {'client': 'Acme Corp'},
        confidence: 0.9,
      );
    }
    if (_any(t, ['usage', 'drop', 'decline', 'metrics', 'analytics'])) {
      return const Intent(type: 'usage_drop_investigation', confidence: 0.9);
    }
    if (_any(t, ['overdue', 'late', 'blocked', 'deadline', 'delayed'])) {
      return const Intent(type: 'overdue_work_review', confidence: 0.9);
    }
    if (_any(t, ['dashboard', 'home', 'overview'])) {
      return const Intent(type: 'generic_dashboard', confidence: 1.0);
    }
    return null; // Layer 2 (LLM) will handle this
  }

  static bool _any(String haystack, List<String> needles) =>
      needles.any((n) => haystack.contains(n));
}