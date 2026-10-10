import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_radii.dart';
import '../../core/theme/app_spacing.dart';
import '../../core/theme/app_text_styles.dart';
import '../../data/mock_data.dart';

class RecentActivityCard extends StatelessWidget {
  const RecentActivityCard({super.key});

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
              Text('Recent Activity', style: AppTextStyles.headlineSm),
              Text('View log', style: AppTextStyles.labelSm.copyWith(
                color: AppColors.primary, fontWeight: FontWeight.w600,
              )),
            ],
          ),
          const SizedBox(height: AppSpacing.md),
          ...MockData.recentActivity.map((a) => Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 32, height: 32,
                  decoration: const BoxDecoration(
                    color: AppColors.primaryFixed,
                    shape: BoxShape.circle,
                  ),
                  alignment: Alignment.center,
                  child: Text(a['initials']!,
                      style: AppTextStyles.labelSm.copyWith(
                        color: AppColors.primary, fontWeight: FontWeight.w700,
                      )),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                          style: AppTextStyles.bodySm,
                          children: [
                            TextSpan(text: '${a['name']} ', style: const TextStyle(
                              fontWeight: FontWeight.w500,
                            )),
                            TextSpan(text: a['action']!),
                          ],
                        ),
                      ),
                      Text(a['time']!, style: AppTextStyles.labelSm.copyWith(
                        color: AppColors.onSurfaceVariant,
                      )),
                    ],
                  ),
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }
}