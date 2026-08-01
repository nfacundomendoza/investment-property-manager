import 'package:flutter/material.dart';

import '../app/theme.dart';

class BestPropertyCard extends StatelessWidget {
  const BestPropertyCard({
    super.key,
    required this.rank,
    required this.rankColor,
    required this.address,
    required this.imageUrl,
    required this.score,
    required this.scoreLabel,
    required this.buttonLabel,
    this.isFocused = false,
    this.scale = 1.0,
  });

  final int rank;
  final Color rankColor;
  final String address;
  final String imageUrl;
  final String score;
  final String scoreLabel;
  final String buttonLabel;
  final bool isFocused;
  final double scale;

  @override
  Widget build(BuildContext context) {
    final baseOpacity = isFocused ? 1.0 : 0.64;
    final glowColor = isFocused ? rankColor.withValues(alpha: 0.35) : Colors.transparent;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 260),
      curve: Curves.easeOutCubic,
      width: isFocused ? 292 : 238,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.background.withValues(alpha: baseOpacity),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: isFocused
              ? rankColor.withValues(alpha: 0.65)
              : AppColors.textPrimary.withValues(alpha: 0.12),
        ),
        boxShadow: [
          BoxShadow(
            color: glowColor,
            blurRadius: isFocused ? 34 : 10,
            spreadRadius: isFocused ? 8 : 0,
          ),
          BoxShadow(
            color: AppColors.textPrimary.withValues(alpha: isFocused ? 0.2 : 0.08),
            blurRadius: isFocused ? 28 : 12,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      transform: Matrix4.identity()..scale(scale),
      child: Opacity(
        opacity: baseOpacity,
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxHeight: 320),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        color: rankColor,
                        shape: BoxShape.circle,
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        rank.toString(),
                        style: const TextStyle(
                          color: AppColors.background,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Text(
                      'Top #$rank',
                      style: const TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  address,
                  style: const TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: AspectRatio(
                    aspectRatio: 16 / 10,
                    child: Image.network(
                      imageUrl,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => Container(
                        color: AppColors.surface,
                        alignment: Alignment.center,
                        child: const Icon(
                          Icons.image_outlined,
                          size: 40,
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Wrap(
                  alignment: WrapAlignment.start,
                  spacing: 12,
                  runSpacing: 10,
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: rankColor, width: 2),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        score,
                        style: TextStyle(
                          color: rankColor,
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 120,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Puntaje',
                            style: TextStyle(
                              color: AppColors.textSecondary,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            scoreLabel,
                            style: const TextStyle(
                              color: AppColors.textPrimary,
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: isFocused
                            ? AppColors.primary
                            : AppColors.primary.withValues(alpha: 0.9),
                        foregroundColor: AppColors.background,
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                      child: Text(buttonLabel),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
