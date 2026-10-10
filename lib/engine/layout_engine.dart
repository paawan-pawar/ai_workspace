import '../models/intent.dart';
import '../models/layout_plan.dart';
import '../models/component_spec.dart';

/// Deterministic mapping: Intent → LayoutPlan.
/// The LLM picks components; this engine decides the ordering and defaults.
class LayoutEngine {
  LayoutEngine._();

  static LayoutPlan plan(Intent intent) {
    switch (intent.type) {
      case 'client_meeting_prep':
        return _clientMeeting(intent);
      case 'usage_drop_investigation':
        return _usageDrop(intent);
      case 'overdue_work_review':
        return _overdueWork(intent);
      default:
        return _genericDashboard();
    }
  }

  static LayoutPlan _genericDashboard() => LayoutPlan(
        intent: const Intent(type: 'generic_dashboard'),
        taskLabel: 'Dashboard Overview',
        components: const [
          ComponentSpec(name: 'kpi_card', priority: 10, reason: 'Baseline metric'),
          ComponentSpec(name: 'kpi_card', priority: 10, reason: 'Baseline metric'),
          ComponentSpec(name: 'kpi_card', priority: 10, reason: 'Baseline metric'),
          ComponentSpec(name: 'kpi_card', priority: 10, reason: 'Baseline metric'),
          ComponentSpec(name: 'chart_card', priority: 8, reason: 'Activity trend'),
          ComponentSpec(name: 'recent_activity_card', priority: 7, reason: 'Live feed'),
          ComponentSpec(name: 'my_tasks_table_card', priority: 6, reason: 'Your tasks'),
        ],
      );

  static LayoutPlan _clientMeeting(Intent intent) => LayoutPlan(
        intent: intent,
        taskLabel: "Preparing for tomorrow's meeting with Acme Corp",
        components: const [
          ComponentSpec(name: 'client_snapshot_card', priority: 10, reason: 'Acme is the subject'),
          ComponentSpec(name: 'meeting_summary_card', priority: 9, reason: 'Last interaction 3 weeks ago'),
          ComponentSpec(name: 'open_issues_card', priority: 9, reason: '3 issues open'),
          ComponentSpec(name: 'email_thread_card', priority: 8, reason: '4 recent emails'),
          ComponentSpec(name: 'chart_card', priority: 8, reason: 'Usage trend for context'),
          ComponentSpec(name: 'talking_points_card', priority: 10, reason: 'Prepared for the call'),
          ComponentSpec(name: 'action_bar', priority: 5, reason: 'Standard actions'),
        ],
      );

  static LayoutPlan _usageDrop(Intent intent) => LayoutPlan(
        intent: intent,
        taskLabel: 'Investigating: Product usage drop · last 7 days',
        components: const [
          ComponentSpec(name: 'anomaly_banner', priority: 10, reason: 'Root cause detected'),
          ComponentSpec(name: 'bar_breakdown_card', priority: 9, reason: 'Segment breakdown'),
          ComponentSpec(name: 'timeline_chart', priority: 9, reason: '7-day timeline'),
          ComponentSpec(name: 'accounts_list_card', priority: 8, reason: 'Top affected accounts'),
          ComponentSpec(name: 'deploy_timeline_card', priority: 7, reason: 'Correlated deploys'),
          ComponentSpec(name: 'past_incidents_card', priority: 6, reason: 'Similar historical incidents'),
          ComponentSpec(name: 'next_steps_card', priority: 9, reason: 'Suggested remediation'),
        ],
      );

  static LayoutPlan _overdueWork(Intent intent) => LayoutPlan(
        intent: intent,
        taskLabel: 'Reviewing: Overdue work',
        components: const [
          ComponentSpec(name: 'kpi_severity_tile', priority: 10, reason: 'Total overdue'),
          ComponentSpec(name: 'kpi_severity_tile', priority: 10, reason: 'Critical >7 days'),
          ComponentSpec(name: 'kpi_severity_tile', priority: 10, reason: 'Active blockers'),
          ComponentSpec(name: 'kpi_severity_tile', priority: 10, reason: 'Owners affected'),
          ComponentSpec(name: 'stacked_bar_by_owner', priority: 9, reason: 'Distribution by owner'),
          ComponentSpec(name: 'overdue_table_card', priority: 9, reason: 'Immediate action list'),
          ComponentSpec(name: 'blockers_card', priority: 8, reason: 'Bottlenecks'),
          ComponentSpec(name: 'action_bar', priority: 5, reason: 'Batch operations'),
        ],
      );
}