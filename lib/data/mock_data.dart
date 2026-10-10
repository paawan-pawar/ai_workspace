import 'package:flutter/material.dart';

/// Central mock data store. Replace with real API calls later.
class MockData {
  MockData._();

  // ─── Dashboard KPIs ────────────────────────────────────────────────
  static const List<Map<String, dynamic>> dashboardKpis = [
    {
      'label': 'Active Clients',
      'value': '47',
      'delta': '+12%',
      'icon': Icons.corporate_fare_outlined,
    },
    {
      'label': 'Open Tickets',
      'value': '128',
      'delta': '+4%',
      'icon': Icons.confirmation_number_outlined,
    },
    {
      'label': 'Revenue',
      'value': '\$284K',
      'delta': '+18%',
      'icon': Icons.payments_outlined,
    },
    {
      'label': 'Meetings Today',
      'value': '6',
      'delta': '+2 scheduled',
      'icon': Icons.event_outlined,
    },
  ];

  // ─── Recent Activity ───────────────────────────────────────────────
  static const List<Map<String, String>> recentActivity = [
    {
      'initials': 'ER',
      'name': 'Elena Rostova',
      'action': 'closed ticket #1042',
      'time': '12m ago',
    },
    {
      'initials': 'MC',
      'name': 'Marcus Chen',
      'action': 'scheduled sync with Kinetix AI',
      'time': '45m ago',
    },
    {
      'initials': 'SL',
      'name': 'Siddharth Lee',
      'action': 'generated invoice #INV-891',
      'time': '2h ago',
    },
    {
      'initials': 'AK',
      'name': 'Anya Kapoor',
      'action': 'commented on SOC2 Scope document',
      'time': '3h ago',
    },
  ];

  // ─── My Tasks (dashboard table) ────────────────────────────────────
  static const List<Map<String, String>> myTasks = [
    {
      'task': 'Finalize SOC2 compliance audit',
      'client': 'Apex Fintech',
      'due': 'Today, 5:00 PM',
      'status': 'In Progress',
      'owner': 'Sarah Vance',
      'ownerInitials': 'SV',
    },
    {
      'task': 'Q2 Renewal agreement negotiation',
      'client': 'Strata Labs',
      'due': 'Tomorrow',
      'status': 'Pending',
      'owner': 'Marcus Chen',
      'ownerInitials': 'MC',
    },
    {
      'task': 'Security patch deployment sign-off',
      'client': 'HyperGrid Cloud',
      'due': 'Yesterday',
      'status': 'Done',
      'owner': 'Elena Rostova',
      'ownerInitials': 'ER',
    },
    {
      'task': 'Client onboarding kickoff',
      'client': 'Vanguard Mobility',
      'due': 'May 18, 2025',
      'status': 'In Progress',
      'owner': 'Sarah Vance',
      'ownerInitials': 'SV',
    },
  ];

  // ─── Open Issues (client meeting) ──────────────────────────────────
  static const List<Map<String, String>> openIssues = [
    {'severity': 'HIGH', 'title': 'SAML SSO intermittent timeout', 'age': '6d open'},
    {'severity': 'MED',  'title': 'Analytics export CSV memory timeout', 'age': '4d open'},
    {'severity': 'LOW',  'title': 'Billing seat tier re-allocation config', 'age': '1d open'},
  ];

  // ─── Emails (client meeting) ───────────────────────────────────────
  static const List<Map<String, String>> emails = [
    {
      'initials': 'DM',
      'sender': 'David Miller',
      'role': 'VP Engineering',
      'subject': "Tomorrow's sync agenda + Q4 architecture plans",
      'preview': 'We need to nail down the latency mitigation SLA before the finance review...',
      'time': '2h ago',
      'unread': 'true',
    },
    {
      'initials': 'RA',
      'sender': 'Rachel Adams',
      'role': 'Procurement Lead',
      'subject': 'Master Service Agreement renewal draft checklist',
      'preview': 'Attaching our standard vendor security addendum ahead of our next call...',
      'time': 'Yesterday',
      'unread': 'false',
    },
    {
      'initials': 'SJ',
      'sender': 'Sarah Jenkins',
      'role': 'Lead Data Architect',
      'subject': 'Pipeline ingestion latency benchmark results',
      'preview': "Here are the trace logs from Friday's batch export...",
      'time': '3d ago',
      'unread': 'false',
    },
    {
      'initials': 'TZ',
      'sender': 'Tom Zhao',
      'role': 'Billing Administrator',
      'subject': 'Invoice #INV-84920 receipt confirmation',
      'preview': 'Payment has cleared from our end. Looking forward to the contract refresh.',
      'time': 'Aug 29',
      'unread': 'false',
    },
  ];

  // ─── Talking Points (client meeting) ───────────────────────────────
  static const List<Map<String, String>> talkingPoints = [
    {
      'text': 'Acknowledge the SAML SSO timeout blocker upfront and commit our senior infrastructure engineers to deploy hotfix v3.4.1 before Friday.',
      'source': 'Support Desk',
      'icon': 'support_agent',
    },
    {
      'text': 'Address the 18% drop in EU analytics usage: clarify if this relates to export timeouts or seasonal shifts in their logistics team.',
      'source': 'Telemetry Signals',
      'icon': 'query_stats',
    },
    {
      'text': 'Present early draft of the Q4 performance roadmap focusing on p99 latency guarantees to resolve architecture concerns.',
      'source': 'Mail Exchange',
      'icon': 'mark_email_unread',
    },
    {
      'text': 'Introduce early renewal terms for the Nov 15 expiry with grandfathered pricing to pre-empt their FY25 budget freeze.',
      'source': 'CRM Pipeline',
      'icon': 'dataset',
    },
    {
      'text': 'Confirm attendees for the bi-weekly operational check-in schedule to keep procurement aligned before final MSA signature.',
      'source': 'Calendar Feed',
      'icon': 'calendar_today',
    },
  ];

  // ─── Usage Drop (investigation) ────────────────────────────────────
  static const List<Map<String, dynamic>> affectedAccounts = [
    {'initials': 'AC', 'name': 'Acme Corp', 'tier': 'Enterprise · Tier 1', 'delta': '-32.4%'},
    {'initials': 'CS', 'name': 'CloudScale Systems', 'tier': 'Enterprise · Tier 1', 'delta': '-28.1%'},
    {'initials': 'AF', 'name': 'Apex Fintech', 'tier': 'Enterprise · Tier 1', 'delta': '-22.0%'},
    {'initials': 'VD', 'name': 'Vanguard Dynamics', 'tier': 'Enterprise · Tier 2', 'delta': '-19.4%'},
    {'initials': 'HL', 'name': 'Hyperion Labs', 'tier': 'Enterprise · Tier 2', 'delta': '-15.3%'},
  ];

  static const List<Map<String, String>> recentDeploys = [
    {
      'title': 'API v2 Gateway Rollout',
      'time': 'Oct 3, 07:45 UTC',
      'note': 'SHA 9f4b82d · 100% traffic rerouted to new Envoy proxy cluster.',
      'suspect': 'true',
      'correlation': '0.94',
    },
    {
      'title': 'Auth Token Expiry Patch',
      'time': 'Oct 4, 14:10 UTC',
      'note': 'SHA 31cc81a · Adjusted JWT refresh window from 15m to 60m.',
      'suspect': 'false',
    },
    {
      'title': 'Database Index Rebuild',
      'time': 'Oct 2, 22:30 UTC',
      'note': 'SHA e40a187 · PostgreSQL pg_repack on sessions table.',
      'suspect': 'false',
    },
  ];

  static const List<Map<String, String>> pastIncidents = [
    {
      'id': 'INC-402',
      'date': 'Jul 18 (Resolved)',
      'title': 'OAuth token refresh failure',
      'summary': 'Downstream enterprise SDK dropped silently due to 401 unhandled reject.',
      'resolution': 'Fallback auth middleware',
    },
    {
      'id': 'INC-289',
      'date': 'May 04 (Resolved)',
      'title': 'Rate limiter misconfig',
      'summary': 'Redis burst buffer capped enterprise pool requests to 50 req/sec inadvertent cap.',
      'resolution': 'Burst capacity multiplier 10x',
    },
  ];

  // ─── Overdue (review) ──────────────────────────────────────────────
  static const List<Map<String, String>> overdueItems = [
    {
      'task': 'SOC2 Type II Audit Signoff',
      'code': 'SEC-8821',
      'owner': 'Alex Rivera',
      'client': 'Apex Global',
      'days': '12 days',
      'blockedBy': 'SecOps Compliance',
      'severity': 'high',
    },
    {
      'task': 'Master Service Agreement Ratification',
      'code': 'LGL-1049',
      'owner': 'Sarah Jenkins',
      'client': 'Acme Corp',
      'days': '10 days',
      'blockedBy': 'Legal Counsel',
      'severity': 'high',
    },
    {
      'task': 'Zero-Trust Kubernetes Patch Deploy',
      'code': 'OPS-4412',
      'owner': 'Marcus Chen',
      'client': 'Finova Health',
      'days': '9 days',
      'blockedBy': 'Staging Drift',
      'severity': 'high',
    },
    {
      'task': 'Enterprise Tier Renewal Billing Plan',
      'code': 'FIN-9923',
      'owner': 'David Kim',
      'client': 'CloudScale Inc',
      'days': '8 days',
      'blockedBy': 'CFO Discount Auth',
      'severity': 'medium',
    },
    {
      'task': 'Edge Gateway TLS 1.3 Transition',
      'code': 'NET-3091',
      'owner': 'Elena Rostova',
      'client': 'OmniCorp',
      'days': '6 days',
      'blockedBy': 'DNS Verification',
      'severity': 'medium',
    },
    {
      'task': 'Data Retention Policy Sync',
      'code': 'POL-5502',
      'owner': 'Sarah Jenkins',
      'client': 'Acme Corp',
      'days': '4 days',
      'blockedBy': 'None (Internal)',
      'severity': 'low',
    },
  ];

  static const List<Map<String, dynamic>> overdueByOwner = [
    {'name': 'Sarah Jenkins', 'role': 'Lead Systems Architect', 'crit': 3, 'mid': 2, 'low': 2, 'total': 7},
    {'name': 'Marcus Chen',   'role': 'DevSecOps Engineer',     'crit': 2, 'mid': 2, 'low': 1, 'total': 5},
    {'name': 'Elena Rostova', 'role': 'Core Protocol Developer', 'crit': 1, 'mid': 2, 'low': 1, 'total': 4},
    {'name': 'David Kim',     'role': 'Infrastructure Strategist', 'crit': 1, 'mid': 1, 'low': 2, 'total': 4},
    {'name': 'Alex Rivera',   'role': 'Compliance Officer',     'crit': 1, 'mid': 1, 'low': 1, 'total': 3},
  ];

  static const List<Map<String, String>> blockers = [
    {
      'level': 'High Impact Bottleneck',
      'cause': 'Legal review',
      'effect': 'Contract sign-off',
      'client': 'Acme',
      'stalled': '9d',
      'severity': 'high',
    },
    {
      'level': 'Compliance Halt',
      'cause': 'SecOps compliance logs',
      'effect': 'SOC2 audit',
      'client': 'Apex',
      'stalled': '12d',
      'severity': 'high',
    },
    {
      'level': 'Commercial Authorization',
      'cause': 'CFO discount approval',
      'effect': 'CloudScale renewal',
      'client': 'CloudScale',
      'stalled': '8d',
      'severity': 'medium',
    },
    {
      'level': 'DevOps Stoppage',
      'cause': 'Staging environment drift',
      'effect': 'Security patch',
      'client': 'Internal Infra',
      'stalled': '9d',
      'severity': 'high',
    },
  ];

  // ─── Overdue KPI tiles ─────────────────────────────────────────────
  static const List<Map<String, dynamic>> overdueKpis = [
    {'label': 'Total Tasks',      'value': '23', 'note': '+4 since yesterday', 'accent': 'red'},
    {'label': 'Severity >7 Days', 'value': '8',  'note': '35% of total backlog', 'accent': 'amber'},
    {'label': 'Dependencies',     'value': '5',  'note': 'across 3 clients', 'accent': 'amber'},
    {'label': 'Accountability',   'value': '7',  'note': 'Engineers & PMs', 'accent': 'gray'},
  ];
}