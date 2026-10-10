import 'package:flutter/material.dart';
import '../../core/theme/app_spacing.dart';
import '../../data/mock_data.dart';
import '../../components/action_bar.dart';
import '../../components/blockers_card.dart';
import '../../components/kpi_severity_tile.dart';
import '../../components/overdue_table_card.dart';
import '../../components/stacked_bar_by_owner.dart';
import 'layout_helpers.dart';

class OverdueWorkLayout extends StatelessWidget {
  const OverdueWorkLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Row 1 — 4 severity KPI tiles
          ResponsiveGrid(
            minTileWidth: 220,
            gap: AppSpacing.md,
            children: MockData.overdueKpis
                .map((k) => KpiSeverityTile(
                      label: k['label'] as String,
                      value: k['value'] as String,
                      note: k['note'] as String,
                      accent: k['accent'] as String,
                    ))
                .toList(),
          ),
          const SizedBox(height: AppSpacing.lg),

          // Row 2 — stacked bars by owner (full width)
          const StackedBarByOwner(),
          const SizedBox(height: AppSpacing.lg),

          // Row 3 — overdue table (2/3) + blockers (1/3)
          TwoOneSplit(
            gap: AppSpacing.lg,
            left: const OverdueTableCard(),
            right: const BlockersCard(),
          ),
          const SizedBox(height: AppSpacing.lg),

          // Row 4 — batch action bar
          ActionBar(
            actions: const [
              ActionButtonSpec(icon: Icons.send, label: 'Nudge All Owners', primary: true),
              ActionButtonSpec(icon: Icons.priority_high, label: 'Escalate Blockers'),
              ActionButtonSpec(icon: Icons.update, label: 'Reschedule'),
              ActionButtonSpec(icon: Icons.file_download, label: 'Export'),
            ],
          ),
          const SizedBox(height: AppSpacing.lg),
        ],
      ),
    );
  }
}