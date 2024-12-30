import 'dart:convert';

class CaptionModel {
  final bool statusCode;
  final String message;
  final List<Caption> data;

  CaptionModel(
      {required this.statusCode, required this.message, required this.data});

  factory CaptionModel.fromJson(Map<String, dynamic> json) {
    final String rawData = json['data'];
    final String formattedData = Caption.formatJson(rawData);
    final List<dynamic> decodedData = jsonDecode(formattedData)['projects'];

    return CaptionModel(
      statusCode: json['status_code'],
      message: json['message'],
      data: decodedData.map((e) => Caption.fromJson(e)).toList(),
    );
  }
}

class Caption {
  final String? level;
  final String? title;
  final String? description;

  Caption({this.level, this.title, this.description});

  factory Caption.fromJson(Map<String, dynamic> json) {
    return Caption(
      level: json['level'],
      title: json['title'],
      description: json['description'],
    );
  }

  static String formatJson(String input) {
    final regex = RegExp(r'```json\n(.*?)\n```', dotAll: true);
    final match = regex.firstMatch(input);

    if (match != null) {
      final extractedJson = match.group(1);
      input = extractedJson ?? input;
    }

    try {
      final decodedJson = jsonDecode(input);
      return jsonEncode(decodedJson);
    } catch (e) {
      throw FormatException("Invalid JSON format: $e");
    }
  }
}
