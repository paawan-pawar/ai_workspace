import 'package:flutter/widgets.dart';

/// Border radius scale extracted from the Stitch design system.
/// Matches the Tailwind config: DEFAULT=0.25rem, lg=0.5rem, xl=0.75rem, full=9999px.
class AppRadii {
  AppRadii._();

  /// 4px — small pills, chips, inline tags.
  static const BorderRadius xs = BorderRadius.all(Radius.circular(4));

  /// 6px — inputs, small buttons.
  static const BorderRadius sm = BorderRadius.all(Radius.circular(6));

  /// 8px — buttons, nav items, mid-size chips.
  static const BorderRadius smLg = BorderRadius.all(Radius.circular(8));

  /// 12px — inner cards, sub-panels.
  static const BorderRadius md = BorderRadius.all(Radius.circular(12));

  /// 16px — primary surface cards (most common in the design).
  static const BorderRadius lg = BorderRadius.all(Radius.circular(16));

  /// 24px — hero cards, modals.
  static const BorderRadius xl = BorderRadius.all(Radius.circular(24));

  /// Full pill (999px).
  static const BorderRadius pill = BorderRadius.all(Radius.circular(999));
}

/// Raw radius values for cases where you need a `double`
/// (e.g. `BorderRadius.circular(value)` in inline widgets).
class AppRadiusValues {
  AppRadiusValues._();
  static const double xs = 4;
  static const double sm = 6;
  static const double md = 8;
  static const double lg = 12;
  static const double xl = 16;
  static const double xxl = 24;
  static const double pill = 999;
}