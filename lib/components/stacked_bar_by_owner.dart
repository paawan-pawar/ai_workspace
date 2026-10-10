import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_radii.dart';
import '../../core/theme/app_spacing.dart';
import '../../core/theme/app_text_styles.dart';
import '../../data/mock_data.dart';

class StackedBarByOwner extends StatelessWidget {
  const StackedBarByOwner({super.key});

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
          Text('Overdue by Owner', style: AppTextStyles.headlineSm),
          const SizedBox(height: 4),
          Text('Distribution of delinquent deliverables',
              style: AppTextStyles.bodySm.copyWith(
                color: AppColors.onSurfaceVariant,
              )),
          const SizedBox(height: AppSpacing.lg),
          ...MockData.overdueByOwner.map((o) {
            final crit = o['crit'] as int;
            final mid  = o['mid'] as int;
            final low  = o['low'] as int;
            final total = o['total'] as int;
            return Padding(
              padding: const EdgeInsets.only(bottom: AppSpacing.md),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(o['name'], style: AppTextStyles.bodySm.copyWith(
                        fontWeight: FontWeight.w500,
                      )),
                      Text('$total tasks ($crit crit)',
                          style: AppTextStyles.codeSm.copyWith(
                            color: AppColors.onSurfaceVariant,
                          )),
                    ],
                  ),
                  const SizedBox(height: 6),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(999),
                    child: Row(
                      children: [
                        if (crit > 0) Expanded(flex: crit,
                            child: Container(height: 12, color: AppColors.error)),
                        if (mid > 0) Expanded(flex: mid,
                            child: Container(height: 12, color: AppColors.tertiaryContainer)),
                        if (low > 0) Expanded(flex: low,
                            child: Container(height: 12, color: AppColors.surfaceVariant)),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}