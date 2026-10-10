import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_radii.dart';
import '../../core/theme/app_spacing.dart';
import '../../core/theme/app_text_styles.dart';
import '../../data/mock_data.dart';

class MyTasksTableCard extends StatelessWidget {
  const MyTasksTableCard({super.key});

  Color _statusBg(String s) => switch (s) {
        'Done'        => AppColors.successContainer,
        'In Progress' => const Color(0xFFEEF2FF),
        _             => const Color(0xFFF3F4F6),
      };
  Color _statusFg(String s) => switch (s) {
        'Done'        => AppColors.success,
        'In Progress' => AppColors.primaryContainer,
        _             => const Color(0xFF374151),
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('My Tasks', style: AppTextStyles.headlineSm),
              Row(
                children: [
                  OutlinedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.filter_list, size: 16),
                    label: const Text('Filter'),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: AppColors.onSurfaceVariant,
                      side: BorderSide.none,
                      backgroundColor: AppColors.surfaceContainerLow,
                      shape: const RoundedRectangleBorder(
                        borderRadius: AppRadii.smLg,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.add, size: 16),
                    label: const Text('New Task'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryContainer,
                      foregroundColor: AppColors.onPrimary,
                      elevation: 0,
                      shape: const RoundedRectangleBorder(
                        borderRadius: AppRadii.smLg,
                      ),
                    ),
                  ),
                ],
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
              columnSpacing: 24,
              columns: const [
                DataColumn(label: Text('TASK')),
                DataColumn(label: Text('CLIENT')),
                DataColumn(label: Text('DUE')),
                DataColumn(label: Text('STATUS')),
                DataColumn(label: Text('OWNER')),
              ],
              rows: MockData.myTasks.map((t) {
                final status = t['status']!;
                return DataRow(cells: [
                  DataCell(Text(t['task']!, style: AppTextStyles.bodySm.copyWith(
                    fontWeight: FontWeight.w500,
                  ))),
                  DataCell(Text(t['client']!)),
                  DataCell(Text(t['due']!)),
                  DataCell(Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: _statusBg(status),
                      borderRadius: AppRadii.pill,
                    ),
                    child: Text(status, style: AppTextStyles.labelSm.copyWith(
                      color: _statusFg(status), fontWeight: FontWeight.w600,
                    )),
                  )),
                  DataCell(Row(
                    children: [
                      Container(
                        width: 24, height: 24,
                        decoration: const BoxDecoration(
                          color: AppColors.primary, shape: BoxShape.circle,
                        ),
                        alignment: Alignment.center,
                        child: Text(t['ownerInitials']!,
                            style: AppTextStyles.labelSm.copyWith(
                              color: AppColors.onPrimary, fontSize: 10,
                            )),
                      ),
                      const SizedBox(width: 6),
                      Text(t['owner']!),
                    ],
                  )),
                ]);
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}