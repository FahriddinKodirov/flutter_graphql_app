import 'package:flutter_graphql_app/api/models/languages.dart';

class CountryModel {
  final String name;
  final String native;
  final String capital;
  final String emoji;
  final String currency;
  List<Languages> languages;

  CountryModel({
    required this.name,
    required this.capital,
    required this.currency,
    required this.emoji,
    required this.native,
    required this.languages,
  });

  

  factory CountryModel.fromJson(Map<String, dynamic> json) => CountryModel(
        name: json['name'] as String? ?? "",
        native: json['native'] as String? ?? "",
        capital: json['capital'] as String? ?? "",
        emoji: json['emoji'] as String? ?? "",
        currency: json['currency'] as String? ?? "",
        languages: (json['languages'] as List).map((e) => Languages.fromJson(e)).toList(),
      );
}