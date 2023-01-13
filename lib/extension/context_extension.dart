import 'package:flutter/material.dart';

extension ContextExt on BuildContext {
  ThemeData get themeData => Theme.of(this);
}
