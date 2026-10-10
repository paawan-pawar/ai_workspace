import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_radii.dart';
import '../../core/theme/app_spacing.dart';
import '../../core/theme/app_text_styles.dart';

class MeetingSummaryCard extends StatelessWidget {
  const MeetingSummaryCard({super.key});

  static const _points = [
    'Q3 milestones reached: Multi-region rollout completed 4 days ahead.',
    'API latency blockers raised by Engineering Director (p99 spikes > 800ms).',
    'Executive budget freeze until FY25 expansion sign-off next month.',
  ];

  static const _colors = [
    AppColors.primary,
    AppColors.error,
    AppColors.tertiaryContainer,
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLowest,
        borderRadius: AppRadii.lg,
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.03),
              blurRadius: 8, offset: const Offset(0, 2)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('LAST INTERACTION',
              style: AppTextStyles.labelSm.copyWith(
                color: AppColors.onSurfaceVariant, letterSpacing: 0.8,
              )),
          const SizedBox(height: 4),
          Text('3 weeks ago', style: AppTextStyles.headlineMd),
          const SizedBox(height: AppSpacing.md),
          Container(
            padding: const EdgeInsets.all(AppSpacing.sm),
            decoration: const BoxDecoration(
              color: AppColors.surfaceContainerLow,
              borderRadius: AppRadii.md,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Icons.psychology,
                        size: 16, color: AppColors.primary),
                    const SizedBox(width: 6),
                    Text('AI SYNTHESIS', style: AppTextStyles.labelSm.copyWith(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w700, letterSpacing: 0.8,
                    )),
                  ],
                ),
                const SizedBox(height: 8),
                ...List.generate(_points.length, (i) => Padding(
                  padding: const EdgeInsets.only(bottom: 6),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 6),
                        width: 6, height: 6,
                        decoration: BoxDecoration(
                          color: _colors[i], shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(child: Text(_points[i],
                          style: AppTextStyles.bodySm)),
                    ],
                  ),
                )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}