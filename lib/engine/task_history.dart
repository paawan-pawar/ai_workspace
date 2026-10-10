import 'package:flutter/foundation.dart';
import '../models/task_state.dart';

/// Append-only task stack powering the Resume chip.
class TaskHistory extends ChangeNotifier {
  final List<TaskState> _stack = [];

  List<TaskState> get all => List.unmodifiable(_stack);
  TaskState? get current => _stack.isEmpty ? null : _stack.last;
  TaskState? get previous =>
      _stack.length < 2 ? null : _stack[_stack.length - 2];

  void push(TaskState state) {
    _stack.add(state);
    notifyListeners();
  }

  void resumeAt(int index) {
    if (index < 0 || index >= _stack.length) return;
    final picked = _stack.removeAt(index);
    _stack.add(picked);
    notifyListeners();
  }

  void clear() {
    _stack.clear();
    notifyListeners();
  }
}