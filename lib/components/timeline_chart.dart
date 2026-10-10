import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_radii.dart';
import '../../core/theme/app_spacing.dart';
import '../../core/theme/app_text_styles.dart';

class TimelineChart extends StatelessWidget {
  const TimelineChart({super.key});

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
              Text('Usage Timeline', style: AppTextStyles.headlineSm),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: const BoxDecoration(
                  color: AppColors.errorContainer,
                  borderRadius: AppRadii.pill,
                ),
                child: Text('18% Drop', style: AppTextStyles.codeSm.copyWith(
                  color: AppColors.error, fontWeight: FontWeight.w700,
                )),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text('Active execution counts per 24-hour cycle',
              style: AppTextStyles.bodySm.copyWith(
                color: AppColors.onSurfaceVariant,
              )),
          const SizedBox(height: AppSpacing.md),
          SizedBox(
            height: 220,
            child: LineChart(
              LineChartData(
                gridData: FlGridData(
                  show: true,
                  drawVerticalLine: false,
                  getDrawingHorizontalLine: (_) => FlLine(
                    color: AppColors.surfaceVariant,
                    strokeWidth: 1,
                    dashArray: [4, 4],
                  ),
                ),
                titlesData: const FlTitlesData(show: false),
                borderData: FlBorderData(show: false),
                lineBarsData: [
                  LineChartBarData(
                    spots: const [
                      FlSpot(0, 72), FlSpot(1, 68), FlSpot(2, 64),
                      FlSpot(3, 70), FlSpot(4, 40), FlSpot(5, 28),
                      FlSpot(6, 22), FlSpot(7, 25),
                    ],
                    isCurved: true,
                    color: AppColors.error,
                    barWidth: 3,
                    dotData: const FlDotData(show: false),
                    belowBarData: BarAreaData(
                      show: true,
                      color: AppColors.error.withOpacity(0.12),
                    ),
                  ),
                ],
                extraLinesData: ExtraLinesData(
                  verticalLines: [
                    VerticalLine(
                      x: 3,
                      color: AppColors.tertiaryContainer,
                      strokeWidth: 2,
                      dashArray: [4, 4],
                      label: VerticalLineLabel(
                        show: true,
                        alignment: Alignment.topLeft,
                        style: AppTextStyles.codeSm.copyWith(
                          color: AppColors.tertiaryContainer,
                          fontWeight: FontWeight.w700,
                        ),
                        labelResolver: (_) => 'Oct 3',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}