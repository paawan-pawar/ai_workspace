import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_radii.dart';
import '../../core/theme/app_spacing.dart';
import '../../core/theme/app_text_styles.dart';
import '../../data/mock_data.dart';

class PastIncidentsCard extends StatelessWidget {
  const PastIncidentsCard({super.key});

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
              const Icon(Icons.history_edu, size: 20, color: AppColors.primary),
              const SizedBox(width: 8),
              Text('Similar Past Incidents',
                  style: AppTextStyles.headlineSm),
            ],
          ),
          const SizedBox(height: 4),
          Text('Pattern matching against postmortems',
              style: AppTextStyles.bodySm.copyWith(
                color: AppColors.onSurfaceVariant,
              )),
          const SizedBox(height: AppSpacing.md),
          ...MockData.pastIncidents.map((p) => Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: const BoxDecoration(
                color: AppColors.surfaceContainerLow,
                borderRadius: AppRadii.md,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 6, vertical: 2),
                        decoration: const BoxDecoration(
                          color: AppColors.secondaryContainer,
                          borderRadius: AppRadii.sm,
                        ),
                        child: Text(p['id']!, style: AppTextStyles.codeSm.copyWith(
                          color: AppColors.onSecondaryContainer,
                          fontWeight: FontWeight.w700,
                        )),
                      ),
                      const Spacer(),
                      Text(p['date']!, style: AppTextStyles.codeSm.copyWith(
                        color: AppColors.onSurfaceVariant,
                      )),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Text(p['title']!, style: AppTextStyles.labelMd.copyWith(
                    fontWeight: FontWeight.w600,
                  )),
                  const SizedBox(height: 4),
                  Text(p['summary']!, style: AppTextStyles.bodySm.copyWith(
                    color: AppColors.onSurfaceVariant,
                  )),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Text('Resolution: ',
                          style: AppTextStyles.labelSm.copyWith(
                            color: AppColors.onSurfaceVariant,
                          )),
                      Text(p['resolution']!, style: AppTextStyles.labelSm.copyWith(
                        color: AppColors.primary, fontWeight: FontWeight.w600,
                      )),
                    ],
                  ),
                ],
              ),
            ),
          )),
        ],
      ),
    );
  }
}