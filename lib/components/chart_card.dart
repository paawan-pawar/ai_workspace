import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_radii.dart';
import '../../core/theme/app_spacing.dart';
import '../../core/theme/app_text_styles.dart';

class ChartCard extends StatelessWidget {
  final String title;
  final String? insight;

  const ChartCard({
    super.key,
    required this.title,
    this.insight,
  });

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
              Text(title, style: AppTextStyles.headlineSm),
              Container(
                padding: const EdgeInsets.all(2),
                decoration: const BoxDecoration(
                  color: AppColors.surfaceContainerLow,
                  borderRadius: AppRadii.smLg,
                ),
                child: Row(
                  children: [
                    _RangePill(label: '7d', selected: false),
                    _RangePill(label: '30d', selected: true),
                    _RangePill(label: '90d', selected: false),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.md),
          SizedBox(
            height: 200,
            child: LineChart(
              LineChartData(
                gridData: FlGridData(
                  show: true,
                  drawVerticalLine: false,
                  horizontalInterval: 30,
                  getDrawingHorizontalLine: (_) => FlLine(
                    color: AppColors.surfaceVariant, strokeWidth: 1,
                    dashArray: [4, 4],
                  ),
                ),
                titlesData: const FlTitlesData(show: false),
                borderData: FlBorderData(show: false),
                lineBarsData: [
                  LineChartBarData(
                    spots: const [
                      FlSpot(0, 30), FlSpot(1, 35), FlSpot(2, 40),
                      FlSpot(3, 45), FlSpot(4, 50), FlSpot(5, 60),
                      FlSpot(6, 55), FlSpot(7, 62),
                    ],
                    isCurved: true,
                    color: AppColors.primary,
                    barWidth: 3,
                    dotData: const FlDotData(show: false),
                    belowBarData: BarAreaData(
                      show: true,
                      color: AppColors.primary.withOpacity(0.15),
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (insight != null) ...[
            const SizedBox(height: AppSpacing.md),
            Container(
              padding: const EdgeInsets.all(AppSpacing.sm),
              decoration: BoxDecoration(
                color: AppColors.tertiaryFixed,
                borderRadius: AppRadii.smLg,
              ),
              child: Row(
                children: [
                  const Icon(Icons.warning_amber,
                      size: 20, color: AppColors.tertiaryContainer),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(insight!,
                        style: AppTextStyles.bodySm.copyWith(
                          color: AppColors.onTertiaryFixed,
                        )),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _RangePill extends StatelessWidget {
  final String label;
  final bool selected;
  const _RangePill({required this.label, required this.selected});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: selected ? AppColors.surfaceContainerLowest : Colors.transparent,
        borderRadius: AppRadii.sm,
      ),
      child: Text(label, style: AppTextStyles.labelSm.copyWith(
        color: selected ? AppColors.primary : AppColors.onSurfaceVariant,
        fontWeight: selected ? FontWeight.w600 : FontWeight.w500,
      )),
    );
  }
}