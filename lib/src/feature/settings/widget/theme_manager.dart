import 'package:flutter/material.dart';

class ThemeManager {
  static ThemeData buildTheme(ThemeData theme) {
    const borderSide = BorderSide(
      width: 1,
      color: Color.fromRGBO(0, 0, 0, 0.6),
    );
    const radius = BorderRadius.all(Radius.circular(8));
    return theme.copyWith(
      inputDecorationTheme: theme.inputDecorationTheme.copyWith(
        isCollapsed: false,
        isDense: false,
        filled: true,
        floatingLabelAlignment: FloatingLabelAlignment.start,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        contentPadding: const EdgeInsets.fromLTRB(16, 8, 4, 8),
        border: const OutlineInputBorder(
          borderRadius: radius,
          borderSide: borderSide,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: radius,
          borderSide: borderSide.copyWith(
            color: theme.colorScheme.primary,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: radius,
          borderSide: borderSide.copyWith(
            color: theme.colorScheme.error,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: radius,
          borderSide: borderSide.copyWith(
            color: const Color.fromRGBO(0, 0, 0, 0.24),
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: radius,
          borderSide: borderSide.copyWith(
            color: const Color.fromRGBO(0, 0, 0, 0.24),
          ),
        ),
      ),
    );
  }
}
