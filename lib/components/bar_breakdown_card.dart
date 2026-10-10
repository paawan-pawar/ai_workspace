import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_radii.dart';
import '../../core/theme/app_spacing.dart';
import '../../core/theme/app_text_styles.dart';

class BarBreakdownCard extends StatelessWidget {
  const BarBreakdownCard({super.key});

  static const _segments = [
    {'label': 'Enterprise', 'delta': '-24.2%', 'pct': 0.76, 'color': AppColors.tertiary},
    {'label': 'Mid-market', 'delta': '-4.1%',  'pct': 0.22, 'color': AppColors.secondary},
    {'label': 'SMB',        'delta': '+0.8%',  'pct': 0.14, 'color': AppColors.outline},
    {'label': 'Self-serve', 'delta': '-1.2%',  'pct': 0.18, 'color': AppColors.outlineVariant},
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
          Text('Breakdown by Segment', style: AppTextStyles.headlineSm),
          const SizedBox(height: 4),
          Text('Daily active volume variance',
              style: AppTextStyles.bodySm.copyWith(
                color: AppColors.onSurfaceVariant,
              )),
          const SizedBox(height: AppSpacing.md),
          ..._segments.map((s) {
            final isPrimary = s['label'] == 'Enterprise';
            return Padding(
              padding: const EdgeInsets.only(bottom: AppSpacing.md),
              child: Container(
                padding: const EdgeInsets.all(AppSpacing.sm),
                decoration: BoxDecoration(
                  color: isPrimary
                      ? AppColors.tertiaryFixed.withOpacity(0.3)
                      : AppColors.surfaceContainerLow.withOpacity(0.6),
                  borderRadius: AppRadii.md,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(width: 10, height: 10,
                              decoration: BoxDecoration(
                                  color: s['color'] as Color,
                                  shape: BoxShape.circle)),
                            const SizedBox(width: 8),
                            Text(s['label'] as String,
                                style: AppTextStyles.labelMd.copyWith(
                                  fontWeight: FontWeight.w600,
                                )),
                          ],
                        ),
                        Text(s['delta'] as String,
                            style: AppTextStyles.codeSm.copyWith(
                              color: (s['delta'] as String).startsWith('-')
                                  ? AppColors.error
                                  : AppColors.success,
                              fontWeight: FontWeight.w700,
                            )),
                      ],
                    ),
                    const SizedBox(height: 6),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(999),
                      child: LinearProgressIndicator(
                        value: s['pct'] as double,
                        minHeight: 8,
                        backgroundColor: AppColors.surfaceContainer,
                        valueColor: AlwaysStoppedAnimation(s['color'] as Color),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}