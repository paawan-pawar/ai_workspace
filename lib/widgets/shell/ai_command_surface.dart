import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_radii.dart';
import '../../core/theme/app_spacing.dart';
import '../../core/theme/app_text_styles.dart';
import '../../constants/app_constants.dart';

/// Bottom-right AI entry point.
/// Collapsed = orb only. Tap = expands into an input pill.
/// Submit = triggers intent parse, collapses back.
class AiCommandSurface extends StatefulWidget {
  final ValueChanged<String> onSubmit;

  const AiCommandSurface({super.key, required this.onSubmit});

  @override
  State<AiCommandSurface> createState() => _AiCommandSurfaceState();
}

class _AiCommandSurfaceState extends State<AiCommandSurface>
    with SingleTickerProviderStateMixin {
  bool _expanded = false;
  final _controller = TextEditingController();
  final _focus = FocusNode();

  @override
  void dispose() {
    _controller.dispose();
    _focus.dispose();
    super.dispose();
  }

  void _toggle() {
    setState(() => _expanded = !_expanded);
    if (_expanded) {
      Future.delayed(const Duration(milliseconds: 80), () => _focus.requestFocus());
    }
  }

  void _submit() {
    final text = _controller.text.trim();
    if (text.isEmpty) return;
    widget.onSubmit(text);
    _controller.clear();
    setState(() => _expanded = false);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (_expanded) ...[
            Container(
              width: 340,
              height: 48,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: AppColors.surfaceContainerLowest,
                borderRadius: AppRadii.pill,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    blurRadius: 16,
                    offset: const Offset(0, 4),
                  ),
                ],
                border: Border.all(
                  color: AppColors.outlineVariant.withOpacity(0.3),
                ),
              ),
              child: Row(
                children: [
                  const Icon(Icons.auto_awesome,
                      size: 18, color: AppColors.primary),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      focusNode: _focus,
                      style: AppTextStyles.bodySm,
                      onSubmitted: (_) => _submit(),
                      decoration: InputDecoration(
                        hintText: 'Ask or tell me what to do...',
                        hintStyle: AppTextStyles.bodySm.copyWith(
                          color: AppColors.onSurfaceVariant.withOpacity(0.7),
                        ),
                        border: InputBorder.none,
                        isDense: true,
                        contentPadding: EdgeInsets.zero,
                      ),
                    ),
                  ),
                  IconButton(
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    icon: const Icon(Icons.arrow_upward,
                        size: 18, color: AppColors.primary),
                    onPressed: _submit,
                  ),
                ],
              ),
            ),
            const SizedBox(width: AppSpacing.sm),
          ],
          // The orb
          GestureDetector(
            onTap: _toggle,
            child: AnimatedContainer(
              duration: AppConstants.normalAnim,
              width: AppConstants.orbSize,
              height: AppConstants.orbSize,
              decoration: BoxDecoration(
                color: _expanded ? AppColors.primary : AppColors.primaryContainer,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primary.withOpacity(0.3),
                    blurRadius: 16,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: const Icon(
                Icons.auto_awesome,
                color: AppColors.onPrimary,
                size: 26,
              ),
            ),
          ),
        ],
      ),
    );
  }
}