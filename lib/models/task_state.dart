import 'layout_plan.dart';

/// One snapshot in the user's task history (for Resume chip).
class TaskState {
  final String id;
  final LayoutPlan plan;
  final DateTime activatedAt;

  TaskState({
    required this.id,
    required this.plan,
    DateTime? activatedAt,
  }) : activatedAt = activatedAt ?? DateTime.now();

  String get label => plan.taskLabel;
}