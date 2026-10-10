import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_radii.dart';
import '../../core/theme/app_spacing.dart';
import '../../core/theme/app_text_styles.dart';

class ClientSnapshotCard extends StatelessWidget {
  const ClientSnapshotCard({super.key});

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
              Container(
                width: 48, height: 48,
                decoration: const BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: AppRadii.lg,
                ),
                alignment: Alignment.center,
                child: Text('AC', style: AppTextStyles.headlineMd.copyWith(
                  color: AppColors.onPrimary,
                )),
              ),
              const SizedBox(width: AppSpacing.sm),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text('Acme Corp', style: AppTextStyles.headlineMd),
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 2),
                          decoration: const BoxDecoration(
                            color: AppColors.primaryFixed,
                            borderRadius: AppRadii.pill,
                          ),
                          child: Text('Enterprise', style: AppTextStyles.labelSm.copyWith(
                            color: AppColors.onPrimaryFixedVariant,
                            fontWeight: FontWeight.w600,
                          )),
                        ),
                      ],
                    ),
                    Text('Global Logistics & Tech',
                        style: AppTextStyles.bodySm.copyWith(
                          color: AppColors.onSurfaceVariant,
                        )),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.md),
          Container(
            padding: const EdgeInsets.all(AppSpacing.sm),
            decoration: const BoxDecoration(
              color: AppColors.surfaceContainerLow,
              borderRadius: AppRadii.md,
            ),
            child: Row(
              children: [
                SizedBox(
                  width: 56, height: 56,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      CircularProgressIndicator(
                        value: 0.78,
                        strokeWidth: 3,
                        backgroundColor: AppColors.surfaceVariant,
                        valueColor: const AlwaysStoppedAnimation(
                            AppColors.tertiaryContainer),
                      ),
                      Text('78%', style: AppTextStyles.headlineSm),
                    ],
                  ),
                ),
                const SizedBox(width: AppSpacing.md),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('HEALTH INDEX', style: AppTextStyles.labelSm.copyWith(
                        color: AppColors.onSurfaceVariant, letterSpacing: 0.8,
                      )),
                      Text('Needs Attention', style: AppTextStyles.bodySm.copyWith(
                        color: AppColors.tertiaryContainer,
                        fontWeight: FontWeight.w500,
                      )),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('RENEWAL', style: AppTextStyles.labelSm.copyWith(
                      color: AppColors.onSurfaceVariant, letterSpacing: 0.8,
                    )),
                    Text('Nov 15', style: AppTextStyles.headlineSm),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}