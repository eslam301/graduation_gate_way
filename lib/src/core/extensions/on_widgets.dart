import 'dart:io';

import 'package:flutter/cupertino.dart';
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

  Widget paddingOnlyIn(
          {double? left, double? top, double? right, double? bottom}) =>
      Padding(
        padding: EdgeInsets.only(
          left: left ?? 0,
          top: top ?? 0,
          right: right ?? 0,
          bottom: bottom ?? 0,
        ),
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

extension Loadable on BuildContext {
  void loadable({required bool isLoading}) {
    if (isLoading) {
      showDialog(
        context: this,
        barrierDismissible: true,
        builder: (context) => Center(
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Platform.isIOS
                    ? const CupertinoActivityIndicator()
                    : const CircularProgressIndicator(),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      );
    }
  }
}
