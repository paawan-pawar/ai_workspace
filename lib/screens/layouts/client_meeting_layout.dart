import 'package:flutter/material.dart';
import '../../core/theme/app_spacing.dart';
import '../../components/action_bar.dart';
import '../../components/chart_card.dart';
import '../../components/client_snapshot_card.dart';
import '../../components/email_thread_card.dart';
import '../../components/meeting_summary_card.dart';
import '../../components/open_issues_card.dart';
import '../../components/talking_points_card.dart';
import 'layout_helpers.dart';

class ClientMeetingLayout extends StatelessWidget {
  const ClientMeetingLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Row 1 — three-column executive triad
          ThreeColumnGrid(
            gap: AppSpacing.md,
            children: const [
              ClientSnapshotCard(),
              MeetingSummaryCard(),
              OpenIssuesCard(),
            ],
          ),
          const SizedBox(height: AppSpacing.lg),

          // Row 2 — emails (2/3) + usage chart (1/3)
          TwoOneSplit(
            gap: AppSpacing.lg,
            left: const EmailThreadCard(),
            right: const ChartCard(
              title: 'Product Usage (90d)',
              insight: 'Usage down 18% in last 14 days · EU cluster.',
            ),
          ),
          const SizedBox(height: AppSpacing.lg),

          // Row 3 — talking points (full width)
          const TalkingPointsCard(),
          const SizedBox(height: AppSpacing.lg),

          // Row 4 — action bar
          const ActionBar(),
          const SizedBox(height: AppSpacing.lg),
        ],
      ),
    );
  }
}