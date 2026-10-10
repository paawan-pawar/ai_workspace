import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_radii.dart';
import '../../core/theme/app_spacing.dart';
import '../../core/theme/app_text_styles.dart';

class AnomalyBanner extends StatelessWidget {
  const AnomalyBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        color: AppColors.tertiaryFixed.withOpacity(0.6),
        borderRadius: AppRadii.lg,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 48, height: 48,
            decoration: const BoxDecoration(
              color: AppColors.tertiaryContainer,
              borderRadius: AppRadii.lg,
            ),
            child: const Icon(Icons.warning_amber,
                color: AppColors.onPrimary, size: 26),
          ),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 2),
                      decoration: const BoxDecoration(
                        color: AppColors.tertiary,
                        borderRadius: AppRadii.sm,
                      ),
                      child: Text('ROOT CAUSE',
                          style: AppTextStyles.labelSm.copyWith(
                            color: AppColors.onPrimary,
                            fontWeight: FontWeight.w700, letterSpacing: 0.8,
                          )),
                    ),
                    const SizedBox(width: 8),
                    Text('Detected Oct 3, 08:14 UTC',
                        style: AppTextStyles.codeSm.copyWith(
                          color: AppColors.onTertiaryFixedVariant,
                        )),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  'Usage dropped 18.4% between Oct 3–9. Main driver: enterprise segment.',
                  style: AppTextStyles.headlineSm.copyWith(
                    color: AppColors.onTertiaryFixed,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Diagnostic models report high confidence (94.2%) linking the drop to latency spikes during the Gateway API v2 cutover.',
                  style: AppTextStyles.bodySm.copyWith(
                    color: AppColors.onTertiaryFixedVariant,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}