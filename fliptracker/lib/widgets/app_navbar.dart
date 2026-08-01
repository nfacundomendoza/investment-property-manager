import 'package:flutter/material.dart';
import '../app/theme.dart';

class AppNavbar extends StatelessWidget {
  const AppNavbar({
    super.key,
    required this.selectedIndex,
    this.onNavigate,
  });

  final int selectedIndex;
  final ValueChanged<int>? onNavigate;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      color: AppColors.primary,
      child: Row(
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: AppColors.primaryLight,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(
              Icons.dashboard_customize_outlined,
              color: AppColors.primary,
              size: 18,
            ),
          ),
          const SizedBox(width: 12),
          const Text(
            'FlipTracker',
            style: TextStyle(
              color: AppColors.background,
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Wrap(
              alignment: WrapAlignment.end,
              spacing: 8,
              runSpacing: 8,
              children: [
                NavPill(
                  label: 'Listar Propiedades',
                  active: selectedIndex == 0,
                  onTap: () => onNavigate?.call(0),
                ),
                NavPill(
                  label: 'Mejores Propiedades',
                  active: selectedIndex == 1,
                  onTap: () => onNavigate?.call(1),
                ),
                NavPill(
                  label: 'Exportar Propiedades',
                  active: selectedIndex == 2,
                  onTap: () => onNavigate?.call(2),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class NavPill extends StatelessWidget {
  const NavPill({
    super.key,
    required this.label,
    this.active = false,
    this.onTap,
  });

  final String label;
  final bool active;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        decoration: BoxDecoration(
          color: active
              ? AppColors.primaryDark
              : AppColors.primary.withValues(alpha: 0.12),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: AppColors.primaryDark.withValues(alpha: 0.25),
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: AppColors.background.withValues(alpha: 0.9),
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}