import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_radii.dart';
import '../../core/theme/app_spacing.dart';
import '../../core/theme/app_text_styles.dart';
import '../../data/mock_data.dart';

class DeployTimelineCard extends StatelessWidget {
  const DeployTimelineCard({super.key});

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
          Row(
            children: [
              const Icon(Icons.rocket_launch, size: 20, color: AppColors.primary),
              const SizedBox(width: 8),
              Text('Recent Deploys', style: AppTextStyles.headlineSm),
            ],
          ),
          const SizedBox(height: 4),
          Text('Releases aligned with anomaly timeframe',
              style: AppTextStyles.bodySm.copyWith(
                color: AppColors.onSurfaceVariant,
              )),
          const SizedBox(height: AppSpacing.md),
          ...MockData.recentDeploys.map((d) {
            final suspect = d['suspect'] == 'true';
            return Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: suspect
                      ? AppColors.tertiaryFixed.withOpacity(0.3)
                      : AppColors.surfaceContainerLow.withOpacity(0.6),
                  borderRadius: AppRadii.md,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(d['title']!, style: AppTextStyles.labelMd.copyWith(
                          fontWeight: FontWeight.w600,
                        )),
                        Text(d['time']!, style: AppTextStyles.codeSm.copyWith(
                          color: suspect
                              ? AppColors.tertiary
                              : AppColors.onSurfaceVariant,
                        )),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(d['note']!, style: AppTextStyles.bodySm.copyWith(
                      color: AppColors.onSurfaceVariant,
                    )),
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