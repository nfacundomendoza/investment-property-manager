import 'package:flutter/material.dart';
import '../app/theme.dart';

class HeaderCell extends StatelessWidget {
  const HeaderCell({
    super.key,
    required this.label,
    required this.width,
  });

  final String label;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Text(
        label,
        style: const TextStyle(
          color: AppColors.background,
          fontSize: 13,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}


class PropertyDataCell extends StatelessWidget {
  const PropertyDataCell({
    super.key,
    required this.width,
    this.child,
    this.label,
    this.textColor,
    this.isStrong = false,
  });

  final double width;
  final Widget? child;
  final String? label;
  final Color? textColor;
  final bool isStrong;

  @override
  Widget build(BuildContext context) {
    final content = child ??
        Text(
          label ?? '',
          style: TextStyle(
            color: textColor ?? AppColors.textPrimary,
            fontSize: 14,
            fontWeight: isStrong
                ? FontWeight.w700
                : FontWeight.w500,
          ),
        );

    return SizedBox(
      width: width,
      child: content,
    );
  }
}