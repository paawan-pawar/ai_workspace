import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_radii.dart';
import '../../core/theme/app_spacing.dart';
import '../../core/theme/app_text_styles.dart';
import '../../data/mock_data.dart';

class BlockersCard extends StatelessWidget {
  const BlockersCard({super.key});

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
              Text('Blockers', style: AppTextStyles.headlineSm),
              const SizedBox(width: 6),
              Container(width: 8, height: 8,
                  decoration: const BoxDecoration(
                    color: AppColors.tertiaryContainer,
                    shape: BoxShape.circle,
                  )),
            ],
          ),
          const SizedBox(height: AppSpacing.md),
          ...MockData.blockers.map((b) {
            final isHigh = b['severity'] == 'high';
            return Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                  color: AppColors.surfaceContainerLow,
                  borderRadius: AppRadii.md,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(b['level']!,
                        style: AppTextStyles.labelSm.copyWith(
                          color: isHigh ? AppColors.error : AppColors.tertiary,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.5,
                        )),
                    const SizedBox(height: 4),
                    RichText(
                      text: TextSpan(
                        style: AppTextStyles.bodySm,
                        children: [
                          TextSpan(text: b['cause']!, style: TextStyle(
                            color: isHigh ? AppColors.error : AppColors.tertiary,
                            fontWeight: FontWeight.w600,
                          )),
                          const TextSpan(text: ' blocking '),
                          TextSpan(text: b['effect']!, style: const TextStyle(
                            fontWeight: FontWeight.w600,
                          )),
                        ],
                      ),
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        Text('Client: ${b['client']}',
                            style: AppTextStyles.codeSm.copyWith(
                              color: AppColors.onSurfaceVariant,
                            )),
                        const SizedBox(width: 8),
                        Text('· Stalled ${b['stalled']}',
                            style: AppTextStyles.codeSm.copyWith(
                              color: isHigh ? AppColors.error : AppColors.tertiary,
                              fontWeight: FontWeight.w600,
                            )),
                      ],
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