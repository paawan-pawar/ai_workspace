import 'package:flutter/material.dart';

class ResponsiveGrid extends StatelessWidget {
  final List<Widget> children;
  final double minTileWidth;
  final double gap;

  const ResponsiveGrid({
    super.key,
    required this.children,
    required this.minTileWidth,
    required this.gap,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final columns = (constraints.maxWidth / (minTileWidth + gap))
            .floor()
            .clamp(1, children.length);
        final width = (constraints.maxWidth - gap * (columns - 1)) / columns;
        return Wrap(
          spacing: gap,
          runSpacing: gap,
          children: children
              .map((child) => SizedBox(width: width, child: child))
              .toList(),
        );
      },
    );
  }
}

class TwoOneSplit extends StatelessWidget {
  final Widget left;
  final Widget right;
  final double gap;

  const TwoOneSplit({
    super.key,
    required this.left,
    required this.right,
    required this.gap,
  });

  @override
  Widget build(BuildContext context) {
    return _SplitLayout(
      gap: gap,
      leftFlex: 2,
      left: left,
      right: right,
    );
  }
}

class OneTwoSplit extends StatelessWidget {
  final Widget left;
  final Widget right;
  final double gap;

  const OneTwoSplit({
    super.key,
    required this.left,
    required this.right,
    required this.gap,
  });

  @override
  Widget build(BuildContext context) {
    return _SplitLayout(
      gap: gap,
      leftFlex: 1,
      left: left,
      right: right,
    );
  }
}

class _SplitLayout extends StatelessWidget {
  final Widget left;
  final Widget right;
  final double gap;
  final int leftFlex;

  const _SplitLayout({
    required this.left,
    required this.right,
    required this.gap,
    required this.leftFlex,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 700) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [left, SizedBox(height: gap), right],
          );
        }
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(flex: leftFlex, child: left),
            SizedBox(width: gap),
            Expanded(flex: 3 - leftFlex, child: right),
          ],
        );
      },
    );
  }
}

class ThreeColumnGrid extends StatelessWidget {
  final List<Widget> children;
  final double gap;

  const ThreeColumnGrid({
    super.key,
    required this.children,
    required this.gap,
  });

  @override
  Widget build(BuildContext context) {
    return ResponsiveGrid(
      minTileWidth: 260,
      gap: gap,
      children: children,
    );
  }
}
