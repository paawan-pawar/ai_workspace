import 'package:flutter/material.dart';
import '../../core/theme/app_spacing.dart';
import '../../data/mock_data.dart';
import '../../components/kpi_card.dart';
import '../../components/chart_card.dart';
import '../../components/recent_activity_card.dart';
import '../../components/my_tasks_table_card.dart';
import 'layout_helpers.dart';

class GenericDashboardLayout extends StatelessWidget {
  const GenericDashboardLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Row 1 — 4 KPI cards
          ResponsiveGrid(
            minTileWidth: 240,
            gap: AppSpacing.md,
            children: MockData.dashboardKpis
                .map((k) => KpiCard(
                      label: k['label'] as String,
                      value: k['value'] as String,
                      delta: k['delta'] as String,
                      icon: k['icon'] as IconData,
                    ))
                .toList(),
          ),
          const SizedBox(height: AppSpacing.lg),

          // Row 2 — chart (2/3) + recent activity (1/3)
          TwoOneSplit(
            gap: AppSpacing.lg,
            left: const ChartCard(
              title: 'Activity Overview',
              insight: 'Resolved tickets trending +18% this week.',
            ),
            right: const RecentActivityCard(),
          ),
          const SizedBox(height: AppSpacing.lg),

          // Row 3 — My Tasks table (full width)
          const MyTasksTableCard(),
          const SizedBox(height: AppSpacing.lg),
        ],
      ),
    );
  }
}