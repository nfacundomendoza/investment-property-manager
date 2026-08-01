import 'package:flutter/material.dart';

import '../app/theme.dart';
import '../widgets/app_navbar.dart';
import '../widgets/app_footer.dart';
import '../widgets/best_property_card.dart';
import '../widgets/filter_bar.dart';
import 'property_overview_screen.dart';

class BestPropertiesScreen extends StatefulWidget {
  const BestPropertiesScreen({super.key});

  @override
  State<BestPropertiesScreen> createState() => _BestPropertiesScreenState();
}

class _BestPropertiesScreenState extends State<BestPropertiesScreen> {
  late final PageController _pageController;
  int _currentIndex = 1;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      viewportFraction: 0.86,
      initialPage: 1,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cards = [
      _buildCard(1, const Color(0xFFFF9500), 'Av. Del Libertador 3200, Palermo', '98', '9.8 / 10', 'Ver detalles', 0),
      _buildCard(2, const Color(0xFFC0C0C0), 'Las Heras 2450, Recoleta', '92', '9.2 / 10', 'Comparar', 1),
      _buildCard(3, const Color(0xFF808080), 'Arenales 1450, Belgrano', '88', '8.8 / 10', 'Abrir ficha', 2),
      _buildCard(4, const Color(0xFF4F46E5), 'Sáenz Peña 1080, Villa Crespo', '85', '8.5 / 10', 'Ver oferta', 3),
      _buildCard(5, const Color(0xFF0F766E), 'Juan B. Justo 3000, Caballito', '81', '8.1 / 10', 'Reservar', 4),
    ];

    return Scaffold(
      backgroundColor: AppColors.surface,
      body: Column(
        children: [
          AppNavbar(
            selectedIndex: 1,
            onNavigate: (index) {
              if (index == 0) {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (_) => const PropertyOverviewScreen()),
                );
              } else if (index == 2) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Exportación disponible próximamente')),
                );
              }
            },
          ),
          Expanded(
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
                        Icon(Icons.chevron_right, size: 16, color: AppColors.textSecondary),
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
                      'Mejores Propiedades☆',
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
                    FilterBar(),
                    const SizedBox(height: 24),
                    SizedBox(
                      height: 430,
                      child: PageView.builder(
                        controller: _pageController,
                        itemCount: cards.length,
                        pageSnapping: true,
                        clipBehavior: Clip.none,
                        onPageChanged: (index) => setState(() => _currentIndex = index),
                        itemBuilder: (context, index) {
                          final card = cards[index];
                          final isFocused = index == _currentIndex;
                          final isPrevious = index == _currentIndex - 1;
                          final isNext = index == _currentIndex + 1;
                          final parallaxOffset = isFocused ? 0.0 : (isPrevious ? -8.0 : 8.0);

                          return AnimatedContainer(
                            duration: const Duration(milliseconds: 280),
                            curve: Curves.easeOutCubic,
                            padding: EdgeInsets.symmetric(
                              vertical: isFocused ? 0 : 12,
                              horizontal: 6,
                            ),
                            child: AnimatedSlide(
                              duration: const Duration(milliseconds: 260),
                              curve: Curves.easeOutCubic,
                              offset: Offset(parallaxOffset / 100, 0),
                              child: AnimatedScale(
                                duration: const Duration(milliseconds: 260),
                                curve: Curves.easeOutCubic,
                                scale: isFocused ? 1.0 : 0.9,
                                child: Align(
                                  alignment: Alignment.center,
                                  child: SizedBox(
                                    width: isFocused ? 292 : 238,
                                    child: card,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const AppFooter(),
        ],
      ),
    );
  }

  Widget _buildCard(int rank, Color rankColor, String address, String score, String scoreLabel, String buttonLabel, int index) {
    final isFocused = index == _currentIndex;
    return BestPropertyCard(
      rank: rank,
      rankColor: rankColor,
      address: address,
      imageUrl: 'https://images.unsplash.com/photo-1512918728675-ed5a9ecdebfd?auto=format&fit=crop&w=900&q=80',
      score: score,
      scoreLabel: scoreLabel,
      buttonLabel: buttonLabel,
      isFocused: isFocused,
      scale: isFocused ? 1.0 : 0.92,
    );
  }
}
