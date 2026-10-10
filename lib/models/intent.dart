/// Intent recognized by the AI layer.
class Intent {
  final String type; // e.g. 'client_meeting_prep'
  final Map<String, String> entities;
  final double confidence;
  final String? clarifyingQuestion;

  const Intent({
    required this.type,
    this.entities = const {},
    this.confidence = 1.0,
    this.clarifyingQuestion,
  });

  factory Intent.fallback() => const Intent(
        type: 'generic_dashboard',
        confidence: 0.0,
      );

  bool get needsClarification =>
      clarifyingQuestion != null && confidence < 0.6;
}