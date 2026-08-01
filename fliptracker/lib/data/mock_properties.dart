import '../models/property_record.dart';
import '../app/theme.dart';

final List<PropertyRecord> propertiesMock = [
  PropertyRecord(
    code: 'VIV-9821',
    address: 'Av. Del Libertador 3200, Palermo',
    area: 112,
    type: 'Depto',
    purchasePrice: 345000,
    reformCost: 25000,
    salePrice: 470000,
    yieldPercentage: 27.0,
    score: 89,
    scoreLabel: 'Alta',
    scoreColor: AppColors.success,
  ),

  PropertyRecord(
    code: 'VIV-4412',
    address: 'Quintana 150, Recoleta',
    area: 85,
    type: 'Depto',
    purchasePrice: 220000,
    reformCost: 15000,
    salePrice: 295000,
    yieldPercentage: 25.5,
    score: 84,
    scoreLabel: 'Media',
    scoreColor: AppColors.warning,
  ),

  PropertyRecord(
    code: 'VIV-7710',
    address: 'Sarmiento 1800, Belgrano',
    area: 140,
    type: 'Casa',
    purchasePrice: 410000,
    reformCost: 35000,
    salePrice: 560000,
    yieldPercentage: 31.2,
    score: 92,
    scoreLabel: 'Alta',
    scoreColor: AppColors.success,
  ),
];