import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_radii.dart';
import '../../core/theme/app_spacing.dart';
import '../../core/theme/app_text_styles.dart';

class KpiCard extends StatelessWidget {
  final String label;
  final String value;
  final String delta;
  final IconData icon;

  const KpiCard({
    super.key,
    required this.label,
    required this.value,
    required this.delta,
    this.icon = Icons.bar_chart,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
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
              Text(label, style: AppTextStyles.labelMd.copyWith(
                color: AppColors.onSurfaceVariant,
              )),
              Container(
                width: 32, height: 32,
                decoration: const BoxDecoration(
                  color: AppColors.surfaceContainerLow,
                  borderRadius: AppRadii.smLg,
                ),
                child: Icon(icon, size: 18, color: AppColors.onSurfaceVariant),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Flexible(
                child: FittedBox(
                  alignment: Alignment.centerLeft,
                  fit: BoxFit.scaleDown,
                  child: Text(value, style: AppTextStyles.headlineXl),
                ),
              ),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: const BoxDecoration(
                  color: AppColors.successContainer,
                  borderRadius: AppRadii.pill,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.arrow_upward, size: 12,
                        color: AppColors.success),
                    const SizedBox(width: 2),
                    Text(delta, style: AppTextStyles.labelSm.copyWith(
                      color: AppColors.success, fontWeight: FontWeight.w600,
                    )),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}