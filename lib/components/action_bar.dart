import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_radii.dart';
import '../../core/theme/app_spacing.dart';
import '../../core/theme/app_text_styles.dart';

class ActionBar extends StatelessWidget {
  final List<ActionButtonSpec> actions;

  const ActionBar({super.key, this.actions = const []});

  @override
  Widget build(BuildContext context) {
    final buttons = actions.isEmpty ? _defaults : actions;
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
      child: Wrap(
        alignment: WrapAlignment.end,
        spacing: 8,
        runSpacing: 8,
        children: buttons.map((b) {
          final isPrimary = b.primary;
          return ElevatedButton.icon(
            onPressed: b.onTap ?? () {},
            icon: Icon(b.icon, size: 18),
            label: Text(b.label),
            style: ElevatedButton.styleFrom(
              backgroundColor: isPrimary
                  ? AppColors.primary
                  : AppColors.surfaceContainerLow,
              foregroundColor: isPrimary
                  ? AppColors.onPrimary
                  : AppColors.onSurface,
              elevation: 0,
              padding: const EdgeInsets.symmetric(
                  horizontal: 16, vertical: 12),
              shape: const RoundedRectangleBorder(
                borderRadius: AppRadii.smLg,
              ),
              textStyle: AppTextStyles.headlineSm.copyWith(
                color: isPrimary ? AppColors.onPrimary : AppColors.onSurface,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  static final List<ActionButtonSpec> _defaults = [
    const ActionButtonSpec(
      icon: Icons.calendar_today, label: 'Schedule Call'),
    const ActionButtonSpec(
      icon: Icons.edit_note, label: 'Draft Email'),
    const ActionButtonSpec(
      icon: Icons.business, label: 'Open Account', primary: true),
  ];
}

class ActionButtonSpec {
  final IconData icon;
  final String label;
  final bool primary;
  final VoidCallback? onTap;

  const ActionButtonSpec({
    required this.icon,
    required this.label,
    this.primary = false,
    this.onTap,
  });
}