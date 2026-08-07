import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../models/property_card_data.dart';

import '../app/theme.dart';
import '../widgets/best_property_card.dart';
import '../widgets/filter_bar.dart';

class BestPropertiesPage extends StatefulWidget {
  const BestPropertiesPage({super.key});

  @override
  State<BestPropertiesPage> createState() => _BestPropertiesPageState();
}

class _BestPropertiesPageState extends State<BestPropertiesPage> {
  late final PageController _pageController;
  int _currentIndex = 1;

  @override
  void initState() {
    super.initState();

    _pageController = PageController(
      viewportFraction: 0.55,
      initialPage: 1,
    )..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cards = [
  const PropertyCardData(
    rank: 1,
    rankColor: Color(0xFFFF9500),
    address: 'Av. Del Libertador 3200, Palermo',
    score: '98',
    scoreLabel: '9.8 / 10',
    buttonLabel: 'Ver detalles',
    imageUrl:
        'https://images.unsplash.com/photo-1512918728675-ed5a9ecdebfd?auto=format&fit=crop&w=900&q=80',
  ),

  const PropertyCardData(
    rank: 2,
    rankColor: Color(0xFFC0C0C0),
    address: 'Las Heras 2450, Recoleta',
    score: '92',
    scoreLabel: '9.2 / 10',
    buttonLabel: 'Comparar',
    imageUrl:
        'https://images.unsplash.com/photo-1512918728675-ed5a9ecdebfd?auto=format&fit=crop&w=900&q=80',
  ),
];

    return Container(
      color: AppColors.surface,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(56, 24, 56, 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Text(
                    'PORTAFOLIO ACTIVO',
                    style: TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.2,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Icon(
                    Icons.chevron_right,
                    size: 16,
                    color: AppColors.textSecondary,
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'BUENOS AIRES',
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.2,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              const Text(
                'Mejores Propiedades ☆',
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 40,
                  fontWeight: FontWeight.w700,
                  height: 1.1,
                ),
              ),

              const SizedBox(height: 8),

              Text(
                'Visualización de las mejores propiedades según puntaje',
                style: TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 16,
                  height: 1.5,
                ),
              ),

              const SizedBox(height: 16),

              const FilterBar(),

              const SizedBox(height: 24),

              SizedBox(
                height: 430,
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: cards.length,
                  pageSnapping: true,
                  clipBehavior: Clip.none,
                  onPageChanged: (index) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                  itemBuilder: (context, index) {
  final property = cards[index];

  final page = _pageController.hasClients
      ? _pageController.page ?? _currentIndex.toDouble()
      : _currentIndex.toDouble();

  final difference = (page - index).abs();

  final scale =
      (1 - difference * 0.15).clamp(0.85, 1.0).toDouble();

  final isFocused = difference < 0.5;

  return AnimatedScale(
  duration: const Duration(milliseconds: 200),
  scale: scale,
  child: Center(
    child: Container(
      width: 292,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          if (isFocused)
            BoxShadow(
              blurRadius: 18,
              spreadRadius: 0,
              offset: const Offset(0, 4),
              color: AppColors.primary.withValues(alpha: 0.20),
            ),
        ],
      ),
      child: BestPropertyCard(
        rank: property.rank,
        rankColor: property.rankColor,
        address: property.address,
        imageUrl: property.imageUrl,
        score: property.score,
        scoreLabel: property.scoreLabel,
        buttonLabel: property.buttonLabel,
        isFocused: isFocused,
        scale: scale,
      ),
    ),
  ),
);
},
                ),
              ),

              const SizedBox(height: 20),

              Center(
                child: SmoothPageIndicator(
                  controller: _pageController,
                  count: cards.length,
                  effect: const ExpandingDotsEffect(
                    dotHeight: 8,
                    dotWidth: 8,
                    expansionFactor: 4,
                  ),
                  onDotClicked: (index) {
                    _pageController.animateToPage(
                      index,
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.easeInOut,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}