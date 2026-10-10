import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_radii.dart';
import '../../core/theme/app_spacing.dart';
import '../../core/theme/app_text_styles.dart';
import '../../data/mock_data.dart';

class OverdueTableCard extends StatelessWidget {
  const OverdueTableCard({super.key});

  Color _pillBg(String sev) => switch (sev) {
        'high'   => AppColors.errorContainer,
        'medium' => AppColors.tertiaryFixed,
        _        => AppColors.secondaryContainer,
      };
  Color _pillFg(String sev) => switch (sev) {
        'high'   => AppColors.onErrorContainer,
        'medium' => AppColors.onTertiaryFixed,
        _        => AppColors.onSecondaryContainer,
      };

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
          Row(
            children: [
              Text('Overdue Items', style: AppTextStyles.headlineSm),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: const BoxDecoration(
                  color: AppColors.errorContainer,
                  borderRadius: AppRadii.pill,
                ),
                child: Text('6 Immediate',
                    style: AppTextStyles.labelSm.copyWith(
                      color: AppColors.onErrorContainer,
                      fontWeight: FontWeight.w600,
                    )),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.md),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              headingRowColor: WidgetStateProperty.all(
                AppColors.surfaceContainerLow,
              ),
              headingTextStyle: AppTextStyles.labelSm.copyWith(
                color: AppColors.onSurfaceVariant, letterSpacing: 0.8,
              ),
              dataTextStyle: AppTextStyles.bodySm,
              horizontalMargin: 12,
              columnSpacing: 24,
              columns: const [
                DataColumn(label: Text('TASK')),
                DataColumn(label: Text('OWNER')),
                DataColumn(label: Text('CLIENT')),
                DataColumn(label: Text('DAYS')),
                DataColumn(label: Text('BLOCKED BY')),
              ],
              rows: MockData.overdueItems.map((item) {
                return DataRow(cells: [
                  DataCell(Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(item['task']!, style: AppTextStyles.bodySm.copyWith(
                        fontWeight: FontWeight.w500,
                      )),
                      Text(item['code']!, style: AppTextStyles.codeSm.copyWith(
                        color: AppColors.onSurfaceVariant,
                      )),
                    ],
                  )),
                  DataCell(Text(item['owner']!)),
                  DataCell(Text(item['client']!)),
                  DataCell(Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8, vertical: 3),
                    decoration: BoxDecoration(
                      color: _pillBg(item['severity']!),
                      borderRadius: AppRadii.pill,
                    ),
                    child: Text(item['days']!, style: AppTextStyles.codeSm.copyWith(
                      color: _pillFg(item['severity']!),
                      fontWeight: FontWeight.w600,
                    )),
                  )),
                  DataCell(Text(item['blockedBy']!, style: AppTextStyles.bodySm.copyWith(
                    color: AppColors.onSurfaceVariant,
                  ))),
                ]);
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}