import '../models/intent.dart';
import 'fallback_router.dart';

/// Three-layer intent parser:
///   Layer 1: keyword router (instant, always available)
///   Layer 2: LLM call (with 2s timeout)
///   Layer 3: cached response (for the three demo tasks)
class IntentParser {
  final Duration timeout;

  IntentParser({this.timeout = const Duration(seconds: 2)});

  Future<Intent> parse(String input) async {
    // Layer 1 — keyword router
    final routed = FallbackRouter.route(input);
    if (routed != null) return routed;

    // Layer 2 — LLM (stub for now, wire to your GPT-OS 120b endpoint)
    try {
      // final intent = await _callLlm(input).timeout(timeout);
      // return intent;
      throw Exception('LLM not wired yet');
    } catch (_) {
      // Layer 3 — cached demo responses
      return _cachedFor(input);
    }
  }

  Intent _cachedFor(String input) {
    // Fallback to dashboard if nothing matches
    return Intent.fallback();
  }
}