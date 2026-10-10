import 'package:flutter/material.dart' hide Intent;
import 'package:provider/provider.dart';

import '../core/theme/app_colors.dart';
import '../core/theme/app_spacing.dart';
import '../engine/intent_parser.dart';
import '../engine/layout_engine.dart';
import '../engine/task_history.dart';
import '../models/intent.dart';
import '../models/layout_plan.dart';
import '../models/task_state.dart';
import '../widgets/shell/app_sidebar.dart';
import '../widgets/shell/app_topbar.dart';
import '../widgets/shell/breadcrumb_bar.dart';
import '../widgets/shell/ai_command_surface.dart';
import 'layouts/generic_dashboard_layout.dart';
import 'layouts/client_meeting_layout.dart';
import 'layouts/usage_drop_layout.dart';
import 'layouts/overdue_work_layout.dart';

class WorkspaceScreen extends StatefulWidget {
  const WorkspaceScreen({super.key});

  @override
  State<WorkspaceScreen> createState() => _WorkspaceScreenState();
}

class _WorkspaceScreenState extends State<WorkspaceScreen> {
  final _parser = IntentParser();
  final _history = TaskHistory();
  LayoutPlan _plan = LayoutEngine.plan(Intent.fallback());
  bool _loading = false;

  Future<void> _handleQuery(String input) async {
    setState(() => _loading = true);
    final intent = await _parser.parse(input);
    final plan = LayoutEngine.plan(intent);
    _history.push(TaskState(id: plan.intent.type, plan: plan));
    setState(() {
      _plan = plan;
      _loading = false;
    });
  }

  Widget _buildContent() {
    switch (_plan.intent.type) {
      case 'client_meeting_prep':
        return const ClientMeetingLayout();
      case 'usage_drop_investigation':
        return const UsageDropLayout();
      case 'overdue_work_review':
        return const OverdueWorkLayout();
      default:
        return const GenericDashboardLayout();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _history,
      child: Scaffold(
        backgroundColor: AppColors.surface,
        body: Row(
          children: [
            const AppSidebar(),
            Expanded(
              child: Column(
                children: [
                  const AppTopbar(),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          BreadcrumbBar(
                            taskLabel: _plan.taskLabel,
                            history: _history.all,
                            onResume: (i) => _history.resumeAt(i),
                          ),
                          if (_loading)
                            const Padding(
                              padding: EdgeInsets.all(AppSpacing.lg),
                              child: LinearProgressIndicator(),
                            )
                          else
                            _buildContent(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        floatingActionButton: AiCommandSurface(onSubmit: _handleQuery),
      ),
    );
  }
}
