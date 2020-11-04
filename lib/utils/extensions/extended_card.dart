import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

extension ExtendedCard on Widget {
  wrapWithCard(Color backgroundColor) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16))),
      color: backgroundColor,
      child: Container(padding: EdgeInsets.all(12), child: this),
    );
  }
}
