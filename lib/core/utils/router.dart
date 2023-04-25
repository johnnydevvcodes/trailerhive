import 'package:flutter/material.dart';

extension RouteExtension on BuildContext {
  void toScreen(Widget screen, {Function? onPopped}) {
    Navigator.push(
      this,
      MaterialPageRoute(
        builder: (BuildContext context) => screen,
      ),
    ).then((value) {
      onPopped?.call();
    });
  }

  void pop() {
    Navigator.pop(this);
  }

  void popToRoot() {
    Navigator.of(this).popUntil((route) => route.isFirst);
  }
}
