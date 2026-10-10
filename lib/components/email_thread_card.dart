import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_radii.dart';
import '../../core/theme/app_spacing.dart';
import '../../core/theme/app_text_styles.dart';
import '../../data/mock_data.dart';

class EmailThreadCard extends StatelessWidget {
  const EmailThreadCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.lg),
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
          Text('Recent Communications', style: AppTextStyles.headlineSm),
          const SizedBox(height: 4),
          Text('Last 4 exchanges across Acme Corp stakeholders',
              style: AppTextStyles.bodySm.copyWith(
                color: AppColors.onSurfaceVariant,
              )),
          const SizedBox(height: AppSpacing.md),
          ...MockData.emails.map((e) {
            final unread = e['unread'] == 'true';
            return Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.surfaceContainerLow,
                  borderRadius: AppRadii.md,
                  border: unread
                      ? const Border(
                          left: BorderSide(color: AppColors.primary, width: 4),
                        )
                      : null,
                ),
                child: Row(
                  children: [
                    Container(
                      width: 36, height: 36,
                      decoration: const BoxDecoration(
                        color: AppColors.primaryContainer,
                        shape: BoxShape.circle,
                      ),
                      alignment: Alignment.center,
                      child: Text(e['initials']!, style: AppTextStyles.labelMd.copyWith(
                        color: AppColors.onPrimary, fontWeight: FontWeight.w600,
                      )),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(e['sender']!, style: AppTextStyles.headlineSm),
                              const SizedBox(width: 6),
                              Text(e['role']!, style: AppTextStyles.labelSm.copyWith(
                                color: AppColors.onSurfaceVariant,
                              )),
                            ],
                          ),
                          Text(e['subject']!,
                              style: AppTextStyles.bodySm.copyWith(
                                fontWeight: FontWeight.w500,
                              ),
                              overflow: TextOverflow.ellipsis),
                          Text(e['preview']!,
                              style: AppTextStyles.bodySm.copyWith(
                                color: AppColors.onSurfaceVariant,
                              ),
                              overflow: TextOverflow.ellipsis),
                        ],
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(e['time']!, style: AppTextStyles.labelSm.copyWith(
                      color: unread ? AppColors.primary : AppColors.onSurfaceVariant,
                      fontWeight: unread ? FontWeight.w600 : FontWeight.w500,
                    )),
                  ],
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}