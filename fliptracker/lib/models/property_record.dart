import 'package:flutter/material.dart';

class PropertyRecord {
  const PropertyRecord({
    required this.code,
    required this.address,
    required this.area,
    required this.type,
    required this.purchasePrice,
    required this.reformCost,
    required this.salePrice,
    required this.yieldPercentage,
    required this.score,
    required this.scoreLabel,
    required this.scoreColor,
  });

  final String code;
  final String address;
  final double area;
  final String type;

  final double purchasePrice;
  final double reformCost;
  final double salePrice;

  final double yieldPercentage;

  final int score;
  final String scoreLabel;
  final Color scoreColor;

  double get estimatedGain {
    return salePrice - purchasePrice - reformCost;
  }
}