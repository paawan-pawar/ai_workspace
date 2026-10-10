import 'package:flutter/material.dart';
import 'registry_entry.dart';
import '../models/component_spec.dart';

import '../components/kpi_card.dart';
import '../components/kpi_severity_tile.dart';
import '../components/chart_card.dart';
import '../components/bar_breakdown_card.dart';
import '../components/stacked_bar_by_owner.dart';
import '../components/client_snapshot_card.dart';
import '../components/meeting_summary_card.dart';
import '../components/open_issues_card.dart';
import '../components/email_thread_card.dart';
import '../components/talking_points_card.dart';
import '../components/anomaly_banner.dart';
import '../components/timeline_chart.dart';
import '../components/accounts_list_card.dart';
import '../components/deploy_timeline_card.dart';
import '../components/past_incidents_card.dart';
import '../components/next_steps_card.dart';
import '../components/overdue_table_card.dart';
import '../components/blockers_card.dart';
import '../components/recent_activity_card.dart';
import '../components/my_tasks_table_card.dart';
import '../components/action_bar.dart';

/// Single source of truth for every component the AI can request.
/// The layout engine NEVER generates UI — it only picks from here.
class ComponentRegistry {
  ComponentRegistry._();

  static final Map<String, RegistryEntry> _map = {
    'kpi_card': RegistryEntry(
      name: 'kpi_card',
      defaultSize: ComponentSize.small,
      builder: (_, d) => KpiCard(
        label: d['label'], value: d['value'], delta: d['delta'],
        icon: d['icon'] ?? Icons.bar_chart,
      ),
    ),
    'kpi_severity_tile': RegistryEntry(
      name: 'kpi_severity_tile',
      defaultSize: ComponentSize.small,
      builder: (_, d) => KpiSeverityTile(
        label: d['label'], value: d['value'], note: d['note'] ?? '',
        accent: d['accent'] ?? 'gray',
      ),
    ),
    'chart_card': RegistryEntry(
      name: 'chart_card',
      defaultSize: ComponentSize.large,
      builder: (_, d) => ChartCard(title: d['title'] ?? 'Chart'),
    ),
    'bar_breakdown_card': RegistryEntry(
      name: 'bar_breakdown_card',
      defaultSize: ComponentSize.medium,
      builder: (_, __) => const BarBreakdownCard(),
    ),
    'stacked_bar_by_owner': RegistryEntry(
      name: 'stacked_bar_by_owner',
      defaultSize: ComponentSize.full,
      builder: (_, __) => const StackedBarByOwner(),
    ),
    'client_snapshot_card': RegistryEntry(
      name: 'client_snapshot_card',
      defaultSize: ComponentSize.medium,
      builder: (_, __) => const ClientSnapshotCard(),
    ),
    'meeting_summary_card': RegistryEntry(
      name: 'meeting_summary_card',
      defaultSize: ComponentSize.medium,
      builder: (_, __) => const MeetingSummaryCard(),
    ),
    'open_issues_card': RegistryEntry(
      name: 'open_issues_card',
      defaultSize: ComponentSize.medium,
      builder: (_, __) => const OpenIssuesCard(),
    ),
    'email_thread_card': RegistryEntry(
      name: 'email_thread_card',
      defaultSize: ComponentSize.large,
      builder: (_, __) => const EmailThreadCard(),
    ),
    'talking_points_card': RegistryEntry(
      name: 'talking_points_card',
      defaultSize: ComponentSize.full,
      builder: (_, __) => const TalkingPointsCard(),
    ),
    'anomaly_banner': RegistryEntry(
      name: 'anomaly_banner',
      defaultSize: ComponentSize.full,
      builder: (_, __) => const AnomalyBanner(),
    ),
    'timeline_chart': RegistryEntry(
      name: 'timeline_chart',
      defaultSize: ComponentSize.large,
      builder: (_, __) => const TimelineChart(),
    ),
    'accounts_list_card': RegistryEntry(
      name: 'accounts_list_card',
      defaultSize: ComponentSize.medium,
      builder: (_, __) => const AccountsListCard(),
    ),
    'deploy_timeline_card': RegistryEntry(
      name: 'deploy_timeline_card',
      defaultSize: ComponentSize.medium,
      builder: (_, __) => const DeployTimelineCard(),
    ),
    'past_incidents_card': RegistryEntry(
      name: 'past_incidents_card',
      defaultSize: ComponentSize.medium,
      builder: (_, __) => const PastIncidentsCard(),
    ),
    'next_steps_card': RegistryEntry(
      name: 'next_steps_card',
      defaultSize: ComponentSize.full,
      builder: (_, __) => const NextStepsCard(),
    ),
    'overdue_table_card': RegistryEntry(
      name: 'overdue_table_card',
      defaultSize: ComponentSize.large,
      builder: (_, __) => const OverdueTableCard(),
    ),
    'blockers_card': RegistryEntry(
      name: 'blockers_card',
      defaultSize: ComponentSize.medium,
      builder: (_, __) => const BlockersCard(),
    ),
    'recent_activity_card': RegistryEntry(
      name: 'recent_activity_card',
      defaultSize: ComponentSize.medium,
      builder: (_, __) => const RecentActivityCard(),
    ),
    'my_tasks_table_card': RegistryEntry(
      name: 'my_tasks_table_card',
      defaultSize: ComponentSize.full,
      builder: (_, __) => const MyTasksTableCard(),
    ),
    'action_bar': RegistryEntry(
      name: 'action_bar',
      defaultSize: ComponentSize.full,
      builder: (_, __) => const ActionBar(),
    ),
  };

  static RegistryEntry? get(String name) => _map[name];
  static bool has(String name) => _map.containsKey(name);
  static List<String> allNames() => _map.keys.toList();
}