library itd.flutter.indicator;

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

/// Widget for the indicator item
///
/// Displays each indicator as a circle. The dot is displayed inside, if it is
/// selected.
class IndicatorItemWidget extends StatelessWidget {
  /// Checked state of the indicator item
  ///
  /// If true, the dot is displayed
  final bool checked;

  /// Color of the dot, if it is displayed
  final Color innerColor;

  /// Color of the outer circle
  final Color outerColor;

  IndicatorItemWidget(
      {this.checked: false,
        this.innerColor: const Color(0xFFAAAAAA),
        this.outerColor: const Color(0xFF008000)});

  @override
  Widget build(BuildContext context) {
    Widget tick;

    // Display the dot if checked is true
    if (checked) {
      tick = new Container(
          decoration: new BoxDecoration(
              borderRadius: new BorderRadius.circular(3.0),
              color: outerColor,
          ));
    }

    // The outer circle
    return new Container(
        width: 12.0,
        height: 12.0,
        margin: new EdgeInsets.only(left: 4.0, right: 4.0),
        padding: new EdgeInsets.all(2.0),
        decoration: new BoxDecoration(
            border: new Border.all(color: innerColor, width: 1.0),
            borderRadius: new BorderRadius.circular(6.0),
        ),
        child: tick,
    );
  }
}


/// Widget to display an indicator for each page with the selected page highlighted
class IndicatorWidget extends StatelessWidget {
  /// Number of indicators to show
  final int count;

  /// Index of the selected indicator
  final int selected;

  /// Color of the dot, if it is displayed
  final Color innerColor;

  /// Color of the outer circle
  final Color outerColor;

  IndicatorWidget(this.count, this.selected,
      {this.innerColor: const Color(0xFFAAAAAA),
        this.outerColor: const Color(0xFF008000)});

  @override
  Widget build(BuildContext context) {
    final wids = <IndicatorItemWidget>[];

    for (int i = 0; i < count; i++) {
      wids.add(new IndicatorItemWidget(
          checked: i == selected,
          innerColor: innerColor,
          outerColor: outerColor));
    }

    return new Row(
        mainAxisSize: MainAxisSize.min,
        children: wids,
    );
  }
}