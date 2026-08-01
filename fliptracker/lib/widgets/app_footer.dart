import 'package:flutter/material.dart';
import '../app/theme.dart';

class AppFooter extends StatelessWidget {
  const AppFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 16,
      ),
      color: AppColors.primaryDark,
      child: const Text(
        'Marca registrada Pelichomu 2026©  •  Contacto: n.facundomendoza@gmail.com',
        style: TextStyle(
          color: AppColors.background,
          fontSize: 14,
        ),
      ),
    );
  }
}