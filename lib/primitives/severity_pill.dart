import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_radii.dart';
import '../../core/theme/app_text_styles.dart';

enum SeverityLevel { high, medium, low, info, success }

/// Small rounded pill used for severities, statuses, and tags.
class SeverityPill extends StatelessWidget {
  final String label;
  final SeverityLevel level;
  final IconData? leadingIcon;

  const SeverityPill({
    super.key,
    required this.label,
    this.level = SeverityLevel.info,
    this.leadingIcon,
  });

  Color get _bg => switch (level) {
        SeverityLevel.high    => AppColors.errorContainer,
        SeverityLevel.medium  => AppColors.tertiaryFixed,
        SeverityLevel.low     => AppColors.secondaryContainer,
        SeverityLevel.success => AppColors.successContainer,
        SeverityLevel.info    => AppColors.primaryFixed,
      };

  Color get _fg => switch (level) {
        SeverityLevel.high    => AppColors.onErrorContainer,
        SeverityLevel.medium  => AppColors.onTertiaryFixed,
        SeverityLevel.low     => AppColors.onSecondaryContainer,
        SeverityLevel.success => AppColors.success,
        SeverityLevel.info    => AppColors.onPrimaryFixedVariant,
      };

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: _bg,
        borderRadius: AppRadii.pill,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (leadingIcon != null) ...[
            Icon(leadingIcon, size: 12, color: _fg),
            const SizedBox(width: 4),
          ],
          Text(
            label,
            style: AppTextStyles.labelSm.copyWith(
              color: _fg,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}