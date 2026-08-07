import 'package:flutter/material.dart';

import '../app/theme.dart';
import '../data/mock_properties.dart';
import '../widgets/filter_bar.dart';
import '../widgets/kpi_card.dart';
import '../widgets/table_cells.dart';
import '../models/property_record.dart';

class PropertyOverviewPage extends StatelessWidget {
  const PropertyOverviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<PropertyRecord> properties = propertiesMock;

    return Container(
      color: AppColors.surface,
      child: Column(
        children: [
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
                          'PORTAFOLIO',
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
                    const SizedBox(height: 8),
                    LayoutBuilder(
                      builder: (context, constraints) {
                        final isWide = constraints.maxWidth > 860;

                        if (isWide) {
                          return Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Análisis de Oportunidades Inmobiliarias',
                                      softWrap: true,
                                      style: TextStyle(
                                        color: AppColors.textPrimary,
                                        fontSize: 40,
                                        fontWeight: FontWeight.w700,
                                        height: 1.1,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      'Valuación, estimación de reformas y proyecciones de rentabilidad para adquisiciones residenciales.',
                                      softWrap: true,
                                      style: TextStyle(
                                        color: AppColors.textSecondary,
                                        fontSize: 16,
                                        height: 1.5,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 24),
                              Column(
                                children: [
                                  KpiCard(
                                    label: 'Total Analizadas',
                                    value: '8 Propiedades',
                                  ),
                                  const SizedBox(height: 10),
                                  KpiCard(
                                    label: 'Rentabilidad Promedio',
                                    value: '19.7%',
                                    valueColor: AppColors.success,
                                  ),
                                ],
                              ),
                            ],
                          );
                        }

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Análisis de Oportunidades Inmobiliarias',
                              softWrap: true,
                              style: TextStyle(
                                color: AppColors.textPrimary,
                                fontSize: 40,
                                fontWeight: FontWeight.w700,
                                height: 1.1,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Valuación, estimación de reformas y proyecciones de rentabilidad para adquisiciones residenciales.',
                              softWrap: true,
                              style: TextStyle(
                                color: AppColors.textSecondary,
                                fontSize: 16,
                                height: 1.5,
                              ),
                            ),
                            const SizedBox(height: 16),
                            KpiCard(
                              label: 'Total Analizadas',
                              value: '8 Propiedades',
                            ),
                            const SizedBox(height: 10),
                            KpiCard(
                              label: 'Rentabilidad Promedio',
                              value: '19.7%',
                              valueColor: AppColors.success,
                            ),
                          ],
                        );
                      },
                    ),
                    const SizedBox(height: 24),
                    FilterBar(),
                    const SizedBox(height: 16),
                    Align(
                      alignment: Alignment.centerRight,
                      child: ElevatedButton.icon(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.add,
                          size: 18,
                        ),
                        label: const Text(
                          'Añadir Propiedad',
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.success,
                          foregroundColor: AppColors.background,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.background,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: AppColors.border,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.textPrimary.withValues(alpha: 0.05),
                            blurRadius: 10,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(minWidth: 1120),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                color: AppColors.primary,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 14,
                                ),
                                child: const Row(
                                  children: [
                                    HeaderCell(
                                      label: 'Cód Viv.',
                                      width: 90,
                                    ),
                                    HeaderCell(
                                      label: 'Dirección',
                                      width: 230,
                                    ),
                                    HeaderCell(
                                      label: 'm²',
                                      width: 70,
                                    ),
                                    HeaderCell(
                                      label: 'Tipo',
                                      width: 100,
                                    ),
                                    HeaderCell(
                                      label: 'Compra',
                                      width: 130,
                                    ),
                                    HeaderCell(
                                      label: 'Est. Reforma',
                                      width: 140,
                                    ),
                                    HeaderCell(
                                      label: 'Est. Venta',
                                      width: 130,
                                    ),
                                    HeaderCell(
                                      label: 'Ganancia Est.',
                                      width: 140,
                                    ),
                                    HeaderCell(
                                      label: 'Rentabilidad',
                                      width: 110,
                                    ),
                                    HeaderCell(
                                      label: 'Puntaje Oportunidad',
                                      width: 172,
                                    ),
                                  ],
                                ),
                              ),
                              ...List.generate(
                                properties.length,
                                (index) {
                                  final property = properties[index];

                                  return Container(
                                    color: index.isEven
                                        ? AppColors.background
                                        : AppColors.surface,
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 20,
                                      vertical: 16,
                                    ),
                                    child: Row(
                                      children: [
                                        PropertyDataCell(
                                          label: property.code,
                                          width: 90,
                                          textColor: AppColors.textSecondary,
                                        ),
                                        PropertyDataCell(
                                          label: property.address,
                                          width: 230,
                                          isStrong: true,
                                        ),
                                        PropertyDataCell(
                                          label: property.area.toString(),
                                          width: 70,
                                          textColor: AppColors.textSecondary,
                                        ),
                                        PropertyDataCell(
                                          width: 100,
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 8,
                                              vertical: 2,
                                            ),
                                            decoration: BoxDecoration(
                                              color: AppColors.surface,
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                            ),
                                            child: Text(
                                              property.type,
                                              style: const TextStyle(
                                                color: AppColors.textPrimary,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                        ),
                                        PropertyDataCell(
                                          label: property.purchasePrice.toString(),
                                          width: 130,
                                          isStrong: true,
                                        ),
                                        PropertyDataCell(
                                          label: property.reformCost.toString(),
                                          width: 140,
                                          textColor: AppColors.textSecondary,
                                        ),
                                        PropertyDataCell(
                                          label: property.salePrice.toString(),
                                          width: 130,
                                          isStrong: true,
                                        ),
                                        PropertyDataCell(
                                          label: property.estimatedGain.toString(),
                                          width: 140,
                                          textColor: AppColors.success,
                                          isStrong: true,
                                        ),
                                        PropertyDataCell(
                                          label: '${property.yieldPercentage}%',
                                          width: 110,
                                          isStrong: true,
                                        ),
                                        PropertyDataCell(
                                          width: 172,
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 8,
                                              vertical: 4,
                                            ),
                                            decoration: BoxDecoration(
                                              color: property.scoreColor
                                                  .withValues(alpha: 0.15),
                                              borderRadius:
                                                  BorderRadius.circular(6),
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Text(
                                                  property.score.toString(),
                                                  style: TextStyle(
                                                    color: property.scoreColor,
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                                const SizedBox(width: 4),
                                                Text(
                                                  '/ ${property.scoreLabel}',
                                                  style: TextStyle(
                                                    color: property.scoreColor,
                                                    fontSize: 11,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
