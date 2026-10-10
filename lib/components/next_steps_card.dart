import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_radii.dart';
import '../../core/theme/app_spacing.dart';
import '../../core/theme/app_text_styles.dart';

class NextStepsCard extends StatelessWidget {
  const NextStepsCard({super.key});

  static const _steps = [
    {
      'title': 'Check API v2 error rates for enterprise accounts',
      'priority': 'P1',
      'desc': 'Isolate 502 and 429 logs on Envoy ingress routes.',
      'button': 'Run',
    },
    {
      'title': 'Notify affected account managers',
      'priority': 'CS',
      'desc': 'Generate status advisory for Acme and CloudScale.',
      'button': 'Draft',
    },
    {
      'title': 'Evaluate API v2 fallback toggle',
      'priority': 'ARCH',
      'desc': 'Simulate traffic shift of batch endpoints back to v1.',
      'button': 'Simulate',
    },
  ];

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
              const Icon(Icons.smart_toy,
                  size: 22, color: AppColors.primaryContainer),
              const SizedBox(width: 8),
              Text('Suggested Next Steps',
                  style: AppTextStyles.headlineSm),
            ],
          ),
          const SizedBox(height: 4),
          Text('Remediation actions from telemetry correlation',
              style: AppTextStyles.bodySm.copyWith(
                color: AppColors.onSurfaceVariant,
              )),
          const SizedBox(height: AppSpacing.md),
          ..._steps.map((s) => Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(s['title']!, style: AppTextStyles.labelMd.copyWith(
                            fontWeight: FontWeight.w600,
                          )),
                          const SizedBox(width: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 6, vertical: 2),
                            decoration: const BoxDecoration(
                              color: AppColors.surfaceContainer,
                              borderRadius: AppRadii.pill,
                            ),
                            child: Text(s['priority']!,
                                style: AppTextStyles.codeSm.copyWith(
                                  fontSize: 10,
                                )),
                          ),
                        ],
                      ),
                      const SizedBox(height: 2),
                      Text(s['desc']!, style: AppTextStyles.bodySm.copyWith(
                        color: AppColors.onSurfaceVariant,
                      )),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryContainer,
                    foregroundColor: AppColors.onPrimary,
                    shape: const RoundedRectangleBorder(
                      borderRadius: AppRadii.smLg,
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 10),
                    elevation: 0,
                  ),
                  child: Text(s['button']!,
                      style: AppTextStyles.labelMd.copyWith(
                        color: AppColors.onPrimary,
                      )),
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }
}