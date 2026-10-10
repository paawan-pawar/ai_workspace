import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_radii.dart';
import '../../core/theme/app_spacing.dart';
import '../../core/theme/app_text_styles.dart';
import '../../data/mock_data.dart';

class OpenIssuesCard extends StatelessWidget {
  const OpenIssuesCard({super.key});

  Color _colorFor(String sev) => switch (sev) {
        'HIGH' => AppColors.error,
        'MED'  => AppColors.tertiaryContainer,
        _      => AppColors.secondary,
      };

  Color _bgFor(String sev) => switch (sev) {
        'HIGH' => AppColors.errorContainer,
        'MED'  => AppColors.tertiaryFixed,
        _      => AppColors.secondaryContainer,
      };

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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text('Open Issues', style: AppTextStyles.headlineMd),
                  const SizedBox(width: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    decoration: const BoxDecoration(
                      color: AppColors.errorContainer,
                      borderRadius: AppRadii.pill,
                    ),
                    child: Text('3 Total', style: AppTextStyles.labelSm.copyWith(
                      color: AppColors.onErrorContainer,
                      fontWeight: FontWeight.w600,
                    )),
                  ),
                ],
              ),
              Text('View in Jira →', style: AppTextStyles.labelSm.copyWith(
                color: AppColors.primary, fontWeight: FontWeight.w500,
              )),
            ],
          ),
          const SizedBox(height: AppSpacing.md),
          ...MockData.openIssues.map((issue) {
            final sev = issue['severity']!;
            return Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                  color: AppColors.surfaceContainerLow,
                  borderRadius: AppRadii.md,
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: _bgFor(sev), borderRadius: AppRadii.xs,
                      ),
                      child: Text(sev, style: AppTextStyles.codeSm.copyWith(
                        color: _colorFor(sev), fontWeight: FontWeight.w700,
                      )),
                    ),
                    const SizedBox(width: 10),
                    Expanded(child: Text(issue['title']!,
                        style: AppTextStyles.bodySm)),
                    Text(issue['age']!, style: AppTextStyles.labelSm.copyWith(
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