import 'package:flutter/material.dart';

@immutable
class Diameter {
  final int id;
  final double diameter;

  const Diameter({
    required this.id,
    required this.diameter,
  });

  factory Diameter.fromJson(Map<String, dynamic> json) {
    return Diameter(
      id: json['id'] as int,
      diameter: json['diameter'] as double,
    );
  }
}
