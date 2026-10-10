import 'intent.dart';
import 'component_spec.dart';

/// The full plan for rendering a workspace state.
class LayoutPlan {
  final Intent intent;
  final List<ComponentSpec> components;
  final String taskLabel;   // shown in breadcrumb
  final DateTime createdAt;

  LayoutPlan({
    required this.intent,
    required this.components,
    required this.taskLabel,
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();

  List<ComponentSpec> get sorted =>
      [...components]..sort((a, b) => b.priority.compareTo(a.priority));
}