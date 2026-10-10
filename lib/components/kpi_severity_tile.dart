import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_radii.dart';
import '../../core/theme/app_spacing.dart';
import '../../core/theme/app_text_styles.dart';

class KpiSeverityTile extends StatelessWidget {
  final String label;
  final String value;
  final String note;
  final String accent; // 'red' | 'amber' | 'gray'

  const KpiSeverityTile({
    super.key,
    required this.label,
    required this.value,
    required this.note,
    this.accent = 'gray',
  });

  Color get _color => switch (accent) {
        'red'   => AppColors.error,
        'amber' => AppColors.tertiaryContainer,
        _       => AppColors.secondary,
      };

  @override
  Widget build(BuildContext context) {
    return Container(
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
          Container(height: 4,
              decoration: BoxDecoration(
                color: _color,
                borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(16)),
              )),
          Padding(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: AppTextStyles.labelSm.copyWith(
                  color: AppColors.onSurfaceVariant, letterSpacing: 0.8,
                )),
                const SizedBox(height: 8),
                Text(value, style: AppTextStyles.headlineXl),
                const SizedBox(height: 4),
                Text(note, style: AppTextStyles.labelSm.copyWith(
                  color: _color,
                )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}