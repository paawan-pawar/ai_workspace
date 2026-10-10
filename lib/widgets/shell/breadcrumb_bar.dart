import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_radii.dart';
import '../../core/theme/app_spacing.dart';
import '../../core/theme/app_text_styles.dart';
import '../../models/task_state.dart';

/// Header strip above every adaptive screen.
/// Shows: back link · active task · reason pill · resume chips.
class BreadcrumbBar extends StatelessWidget {
  final String taskLabel;
  final List<TaskState> history;
  final void Function(int index)? onResume;
  final VoidCallback? onBack;

  const BreadcrumbBar({
    super.key,
    required this.taskLabel,
    this.history = const [],
    this.onResume,
    this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    final resumable = history.length > 1
        ? history.sublist(0, history.length - 1).reversed.toList()
        : <TaskState>[];

    return Padding(
      padding: const EdgeInsets.fromLTRB(
        AppSpacing.lg, AppSpacing.md, AppSpacing.lg, 0,
      ),
      child: Wrap(
        spacing: AppSpacing.sm,
        runSpacing: AppSpacing.sm,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          // Back link
          Material(
            color: Colors.transparent,
            borderRadius: AppRadii.smLg,
            child: InkWell(
              onTap: onBack,
              borderRadius: AppRadii.smLg,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.arrow_back,
                        size: 16, color: AppColors.onSurfaceVariant),
                    const SizedBox(width: 6),
                    Text('Back to Dashboard',
                        style: AppTextStyles.bodySm.copyWith(
                          color: AppColors.onSurfaceVariant,
                        )),
                  ],
                ),
              ),
            ),
          ),
          Text('·', style: AppTextStyles.bodySm.copyWith(
            color: AppColors.outlineVariant,
          )),
          // Task indicator
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: AppColors.primaryContainer,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 6),
              Text(taskLabel, style: AppTextStyles.headlineSm),
            ],
          ),
          // Resume chips
          ...resumable.map((t) => _ResumeChip(
                label: t.label,
                onTap: () => onResume?.call(history.indexOf(t)),
              )),
          // Reason pill
          Material(
            color: AppColors.surfaceContainerLow,
            borderRadius: AppRadii.pill,
            child: InkWell(
              onTap: () => _showReason(context),
              borderRadius: AppRadii.pill,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.info_outline,
                        size: 14, color: AppColors.primary),
                    const SizedBox(width: 6),
                    Text('Why am I seeing this?',
                        style: AppTextStyles.labelSm.copyWith(
                          color: AppColors.onSurfaceVariant,
                        )),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showReason(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        shape: const RoundedRectangleBorder(borderRadius: AppRadii.lg),
        title: const Text('Why this layout?'),
        content: Text(
          'This workspace was arranged around: "$taskLabel".\n\n'
          'Components were selected because they contain context relevant to this task.',
          style: AppTextStyles.bodySm,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Got it'),
          ),
        ],
      ),
    );
  }
}

class _ResumeChip extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const _ResumeChip({required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      borderRadius: AppRadii.pill,
      child: InkWell(
        onTap: onTap,
        borderRadius: AppRadii.pill,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            color: AppColors.surfaceContainerLow,
            borderRadius: AppRadii.pill,
            border: Border.all(
              color: AppColors.outlineVariant.withOpacity(0.4),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.history, size: 12, color: AppColors.onSurfaceVariant),
              const SizedBox(width: 5),
              Text('Resume: $label',
                  style: AppTextStyles.labelSm.copyWith(
                    color: AppColors.onSurfaceVariant,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}