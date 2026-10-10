import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_radii.dart';
import '../../core/theme/app_spacing.dart';
import '../../core/theme/app_text_styles.dart';
import '../../data/mock_data.dart';

class AccountsListCard extends StatelessWidget {
  const AccountsListCard({super.key});

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
              const Icon(Icons.domain_disabled,
                  size: 20, color: AppColors.error),
              const SizedBox(width: 8),
              Text('Top Affected Accounts',
                  style: AppTextStyles.headlineSm),
            ],
          ),
          const SizedBox(height: 4),
          Text('Accounts driving 64% of decline',
              style: AppTextStyles.bodySm.copyWith(
                color: AppColors.onSurfaceVariant,
              )),
          const SizedBox(height: AppSpacing.md),
          ...MockData.affectedAccounts.map((a) => Padding(
            padding: const EdgeInsets.only(bottom: 6),
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                color: AppColors.surfaceContainerLow,
                borderRadius: AppRadii.md,
              ),
              child: Row(
                children: [
                  Container(
                    width: 32, height: 32,
                    decoration: const BoxDecoration(
                      color: AppColors.surfaceContainer,
                      borderRadius: AppRadii.smLg,
                    ),
                    alignment: Alignment.center,
                    child: Text(a['initials']!,
                        style: AppTextStyles.codeSm.copyWith(
                          fontWeight: FontWeight.w700,
                        )),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(a['name']!, style: AppTextStyles.labelMd.copyWith(
                          fontWeight: FontWeight.w600,
                        )),
                        Text(a['tier']!, style: AppTextStyles.codeSm.copyWith(
                          color: AppColors.onSurfaceVariant, fontSize: 11,
                        )),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8, vertical: 4),
                    decoration: const BoxDecoration(
                      color: AppColors.errorContainer,
                      borderRadius: AppRadii.sm,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.arrow_downward,
                            size: 14, color: AppColors.error),
                        Text(a['delta']!,
                            style: AppTextStyles.codeSm.copyWith(
                              color: AppColors.error,
                              fontWeight: FontWeight.w700,
                            )),
                      ],
                    ),
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