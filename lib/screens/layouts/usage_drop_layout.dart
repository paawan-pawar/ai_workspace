import 'package:flutter/material.dart';
import '../../core/theme/app_spacing.dart';
import '../../components/accounts_list_card.dart';
import '../../components/anomaly_banner.dart';
import '../../components/bar_breakdown_card.dart';
import '../../components/deploy_timeline_card.dart';
import '../../components/next_steps_card.dart';
import '../../components/past_incidents_card.dart';
import '../../components/timeline_chart.dart';
import 'layout_helpers.dart';

class UsageDropLayout extends StatelessWidget {
  const UsageDropLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Row 1 — full-width amber anomaly banner
          const AnomalyBanner(),
          const SizedBox(height: AppSpacing.lg),

          // Row 2 — breakdown (1/3) + timeline chart (2/3)
          OneTwoSplit(
            gap: AppSpacing.lg,
            left: const BarBreakdownCard(),
            right: const TimelineChart(),
          ),
          const SizedBox(height: AppSpacing.lg),

          // Row 3 — 3 diagnostic cards
          ThreeColumnGrid(
            gap: AppSpacing.lg,
            children: const [
              AccountsListCard(),
              DeployTimelineCard(),
              PastIncidentsCard(),
            ],
          ),
          const SizedBox(height: AppSpacing.lg),

          // Row 4 — suggested next steps (full width)
          const NextStepsCard(),
          const SizedBox(height: AppSpacing.lg),
        ],
      ),
    );
  }
}