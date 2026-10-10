import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_radii.dart';
import '../../core/theme/app_spacing.dart';

/// The white card wrapper used everywhere.
/// Every component in `components/` should ideally be built on this.
class SurfaceCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;
  final BorderRadius? radius;
  final Color? color;
  final bool withShadow;
  final VoidCallback? onTap;
  final BoxBorder? border;

  const SurfaceCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(AppSpacing.lg),
    this.radius,
    this.color,
    this.withShadow = true,
    this.onTap,
    this.border,
  });

  @override
  Widget build(BuildContext context) {
    final br = radius ?? AppRadii.lg;

    final content = Container(
      padding: padding,
      decoration: BoxDecoration(
        color: color ?? AppColors.surfaceContainerLowest,
        borderRadius: br,
        border: border,
        boxShadow: withShadow
            ? [
                BoxShadow(
                  color: Colors.black.withOpacity(0.03),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ]
            : null,
      ),
      child: child,
    );

    if (onTap == null) return content;

    return Material(
      color: Colors.transparent,
      borderRadius: br,
      child: InkWell(
        borderRadius: br,
        onTap: onTap,
        child: content,
      ),
    );
  }
}