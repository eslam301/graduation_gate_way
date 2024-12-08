import 'package:flutter/material.dart';

extension Pad on Widget {
  Widget paddingAll(double value) => Padding(
        padding: EdgeInsets.all(value),
        child: this,
      );
  Widget paddingSymmetric(double horizontal, double vertical) => Padding(
        padding:
            EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
        child: this,
      );
  Widget paddingOnly(double left, double top, double right, double bottom) =>
      Padding(
        padding: EdgeInsets.fromLTRB(left, top, right, bottom),
        child: this,
      );
  Widget paddingLeft(double value) => Padding(
        padding: EdgeInsets.only(left: value),
        child: this,
      );
  Widget paddingRight(double value) => Padding(
        padding: EdgeInsets.only(right: value),
        child: this,
      );
  Widget paddingTop(double value) => Padding(
        padding: EdgeInsets.only(top: value),
        child: this,
      );
  Widget paddingBottom(double value) => Padding(
        padding: EdgeInsets.only(bottom: value),
        child: this,
      );
}
