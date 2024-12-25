import 'dart:developer';

import 'package:http/http.dart' as http;

void handleHttpError(http.Response response) {
  final message = 'HTTP Error:${response.body}';
  //Get.snackbar('Error', response.body);
  log(response.statusCode.toString());
  log(response.body.toString());
  log(message);
  throw Exception(message);
}
