import 'package:flutter/widgets.dart';
import '../models/component_spec.dart';

/// Builder signature: takes data payload, returns a widget.
typedef ComponentBuilder = Widget Function(
  BuildContext context,
  Map<String, dynamic> data,
);

class RegistryEntry {
  final String name;
  final ComponentBuilder builder;
  final ComponentSize defaultSize;
  final List<String> requiredDataKeys;

  const RegistryEntry({
    required this.name,
    required this.builder,
    this.defaultSize = ComponentSize.medium,
    this.requiredDataKeys = const [],
  });
}