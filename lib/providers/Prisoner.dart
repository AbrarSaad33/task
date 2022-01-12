import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Prisoner with ChangeNotifier {
  final String id;
  final String name;
  final String place;
  final String image;
  final String background;
  final int neededAmount;
  // final String details;

  Prisoner({
    required this.id,
    required this.name,
    required this.place,
    required this.image,
    required this.background,
    required this.neededAmount,
    // required this.details
  });
}
