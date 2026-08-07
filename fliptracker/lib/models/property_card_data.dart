import 'package:flutter/material.dart';

class PropertyCardData {
  final int rank;
  final Color rankColor;
  final String address;
  final String score;
  final String scoreLabel;
  final String buttonLabel;
  final String imageUrl;

  const PropertyCardData({
    required this.rank,
    required this.rankColor,
    required this.address,
    required this.score,
    required this.scoreLabel,
    required this.buttonLabel,
    required this.imageUrl,
  });
}