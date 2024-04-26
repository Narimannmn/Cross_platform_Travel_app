// ignore_for_file: file_names

import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import '../models/Tour.dart';

class TourController {
  final String filePath;

  TourController() : filePath = 'assets/tours.json';

  // Fetch all tours from JSON file
  Future<List<Tour>> getAllTours() async {
    try {
      final String data = await rootBundle.loadString(filePath);
      final List<dynamic> tourData = json.decode(data);
      return tourData.map((tour) => Tour.fromJson(tour)).toList();
    } catch (error) {
      print('Error reading tours file: $error');
      return [];
    }
  }
}
