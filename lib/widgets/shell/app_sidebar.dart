import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_radii.dart';
import '../../core/theme/app_spacing.dart';
import '../../core/theme/app_text_styles.dart';
import '../../constants/app_constants.dart';

class AppSidebar extends StatelessWidget {
  const AppSidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppConstants.sidebarWidth,
      decoration: const BoxDecoration(
        color: AppColors.surfaceContainerLowest,
        border: Border(
          right: BorderSide(color: AppColors.outlineVariant, width: 0.5),
        ),
      ),
      child: Column(
        children: [
          _Brand(),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(AppSpacing.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSpacing.sm,
                      vertical: AppSpacing.xs,
                    ),
                    child: Text(
                      'WORKSPACE',
                      style: AppTextStyles.labelSm.copyWith(
                        color: AppColors.onSurfaceVariant.withOpacity(0.7),
                        letterSpacing: 1.2,
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),
                  _NavItem(icon: Icons.home_outlined, label: 'Home', active: true),
                  _NavItem(icon: Icons.group_outlined, label: 'Clients'),
                  _NavItem(icon: Icons.assignment_outlined, label: 'Projects'),
                  _NavItem(icon: Icons.bar_chart, label: 'Analytics'),
                  _NavItem(
                    icon: Icons.mail_outline,
                    label: 'Inbox',
                    badge: '3',
                  ),
                  _NavItem(icon: Icons.settings_outlined, label: 'Settings'),
                ],
              ),
            ),
          ),
          _CloudEngineStatus(),
        ],
      ),
    );
  }
}

class _Brand extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppConstants.topbarHeight,
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: AppColors.outlineVariant, width: 0.5),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 28,
            height: 28,
            decoration: const BoxDecoration(
              color: AppColors.primary,
              borderRadius: AppRadii.smLg,
            ),
            child: const Icon(Icons.layers, color: AppColors.onPrimary, size: 18),
          ),
          const SizedBox(width: AppSpacing.sm),
          Expanded(
            child: Text(
              AppConstants.appName,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.headlineSm.copyWith(letterSpacing: -0.3),
            ),
          ),
          const SizedBox(width: 6),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            decoration: const BoxDecoration(
              color: AppColors.surfaceContainer,
              borderRadius: AppRadii.pill,
            ),
            child: Text(
              AppConstants.appVersion,
              style: AppTextStyles.labelSm.copyWith(fontSize: 10),
            ),
          ),
        ],
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool active;
  final String? badge;

  const _NavItem({
    required this.icon,
    required this.label,
    this.active = false,
    this.badge,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 2),
      child: Material(
        color: active ? AppColors.primaryContainer : Colors.transparent,
        borderRadius: AppRadii.smLg,
        child: InkWell(
          onTap: () {},
          borderRadius: AppRadii.smLg,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.sm,
              vertical: 8,
            ),
            child: Row(
              children: [
                Icon(
                  icon,
                  size: 20,
                  color: active ? AppColors.onPrimary : AppColors.onSurfaceVariant,
                ),
                const SizedBox(width: AppSpacing.sm),
                Expanded(
                  child: Text(
                    label,
                    style: AppTextStyles.bodySm.copyWith(
                      color: active ? AppColors.onPrimary : AppColors.onSurfaceVariant,
                      fontWeight: active ? FontWeight.w500 : FontWeight.w400,
                    ),
                  ),
                ),
                if (badge != null)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: const BoxDecoration(
                      color: AppColors.secondaryContainer,
                      borderRadius: AppRadii.pill,
                    ),
                    child: Text(
                      badge!,
                      style: AppTextStyles.labelSm.copyWith(
                        color: AppColors.onSecondaryContainer,
                        fontSize: 11,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _CloudEngineStatus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.sm),
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(color: AppColors.outlineVariant, width: 0.5),
        ),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sm, vertical: 6),
        decoration: const BoxDecoration(
          color: AppColors.surfaceContainerLow,
          borderRadius: AppRadii.smLg,
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Cloud Engine',
                      style: AppTextStyles.labelSm.copyWith(fontWeight: FontWeight.w500)),
                  Text('99.98% up',
                      style: AppTextStyles.codeSm.copyWith(
                        color: AppColors.onSurfaceVariant,
                      )),
                ],
              ),
            ),
            Container(
              width: 8,
              height: 8,
              decoration: const BoxDecoration(
                color: AppColors.primary,
                shape: BoxShape.circle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}