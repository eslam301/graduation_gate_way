import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../../../core/error/error_handel_api.dart';
import 'model/caption_model.dart';

class ApiCaption {
  static const String baseUrl =
      'https://ai-x-care.future-developers.cloud/chat/ai/caption';

  final http.Client client;

  ApiCaption({required this.client});

  Future<CaptionModel> getCaption({required File image}) async {
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
        return CaptionModel.fromJson(jsonDecode(response.body));
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
