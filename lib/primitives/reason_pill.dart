import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_radii.dart';
import '../../core/theme/app_text_styles.dart';

/// The "Why am I seeing this?" pill — opens an explanation popover.
/// Reused on every adaptive screen (see BreadcrumbBar for the header version).
class ReasonPill extends StatelessWidget {
  final String reason;
  final String label;
  final IconData icon;

  const ReasonPill({
    super.key,
    required this.reason,
    this.label = 'Why this?',
    this.icon = Icons.info_outline,
  });

  void _show(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        shape: const RoundedRectangleBorder(borderRadius: AppRadii.lg),
        title: const Text('Why this component?'),
        content: Text(reason, style: AppTextStyles.bodySm),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Got it'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      borderRadius: AppRadii.pill,
      child: InkWell(
        borderRadius: AppRadii.pill,
        onTap: () => _show(context),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(
            color: AppColors.surfaceContainerLow,
            borderRadius: AppRadii.pill,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 13, color: AppColors.primary),
              const SizedBox(width: 5),
              Text(
                label,
                style: AppTextStyles.labelSm.copyWith(
                  color: AppColors.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}