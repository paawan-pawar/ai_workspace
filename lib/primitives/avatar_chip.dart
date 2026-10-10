import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';

enum AvatarSize { small, medium, large }

/// Initials-based circular avatar. No images = no broken links.
class AvatarChip extends StatelessWidget {
  final String initials;
  final AvatarSize size;
  final Color? background;
  final Color? foreground;
  final bool ring;

  const AvatarChip({
    super.key,
    required this.initials,
    this.size = AvatarSize.medium,
    this.background,
    this.foreground,
    this.ring = false,
  });

  double get _diameter => switch (size) {
        AvatarSize.small  => 24,
        AvatarSize.medium => 32,
        AvatarSize.large  => 40,
      };

  double get _fontSize => switch (size) {
        AvatarSize.small  => 10,
        AvatarSize.medium => 12,
        AvatarSize.large  => 14,
      };

  @override
  Widget build(BuildContext context) {
    final bg = background ?? AppColors.primaryContainer;
    final fg = foreground ?? AppColors.onPrimary;

    return Container(
      width: _diameter,
      height: _diameter,
      decoration: BoxDecoration(
        color: bg,
        shape: BoxShape.circle,
        border: ring
            ? Border.all(color: AppColors.surfaceContainerLowest, width: 2)
            : null,
      ),
      alignment: Alignment.center,
      child: Text(
        initials,
        style: AppTextStyles.labelSm.copyWith(
          color: fg,
          fontSize: _fontSize,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}