enum ComponentSize { small, medium, large, full }

/// Specification for one component selected by the AI.
class ComponentSpec {
  final String name;       // matches a key in ComponentRegistry
  final int priority;      // 1-10, used for sorting
  final String reason;     // human-readable "why this is here"
  final Map<String, dynamic> data; // component-specific payload
  final ComponentSize size;

  const ComponentSpec({
    required this.name,
    required this.priority,
    required this.reason,
    this.data = const {},
    this.size = ComponentSize.medium,
  });
}