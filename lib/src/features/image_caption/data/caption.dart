import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../../../core/error/error_handel_api.dart';

class ApiCaption {
  static const String baseUrl =
      'https://ai-x-care.future-developers.cloud/chat/ai/caption';

  final http.Client client;

  ApiCaption({required this.client});

  Future<Responseclass> getCaption({required File image}) async {
    try {
      var request = http.MultipartRequest('POST', Uri.parse(baseUrl))
        ..headers.addAll({'Content-Type': 'multipart/form-data'})
        ..files.add(
          await http.MultipartFile.fromPath(
            'file',
            image.path,
          ),
        );

      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);

      log(response.body);

      if (response.statusCode == 200) {
        return Responseclass.fromJson(jsonDecode(response.body));
      } else {
        handleHttpError(response);
        throw Exception('Failed to get caption');
      }
    } catch (e) {
      log(e.toString());
      throw Exception('Failed to get caption');
    }
  }
}

class Responseclass {
  final bool statusCode;
  final String message;
  final String data;

  Responseclass(
      {required this.statusCode, required this.message, required this.data});

  factory Responseclass.fromJson(Map<String, dynamic> json) {
    return Responseclass(
      statusCode: json['status_code'],
      message: json['message'],
      data: json['data'],
    );
  }
}
